import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:meta/meta.dart';
import '../helpers/app_secure_local_storage.dart';
import '../helpers/location_helper.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(SettingsInitial());

  StreamSubscription<Position>? _positionSubscription;
  StreamSubscription<ServiceStatus>? _serviceStatusSubscription;
  bool _hasTriedToOpenSettings = false;

  Future<void> initLocationTracking() async {
    emit(LocationLoading());
    final permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      // استخدم بيانات الكاش لو موجودة
      final (cachedPosition, cachedPlacemark) =
      await AppSecureLocalStorageHelperFunctions.getCachedLocation();

      if (cachedPosition != null && cachedPlacemark != null) {
        emit(LocationLoaded(
          position: cachedPosition,
          placeMark: cachedPlacemark,
        ));
      } else {
        emit(LocationPermissionDenied());
      }
      return;
    }

    // ✅ لو في بيانات أولية
    if (LocationHelper.initialPosition != null &&
        LocationHelper.initialPlacemark != null) {
      emit(LocationLoaded(
        position: LocationHelper.initialPosition!,
        placeMark: LocationHelper.initialPlacemark!,
      ));
    } else {
      emit(LocationError(errorMessage: "Location not available at startup"));
    }

    //  الاشتراك في تحديثات الموقع
    _positionSubscription?.cancel();
    _positionSubscription = Geolocator.getPositionStream(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 100,
      ),
    ).listen(
          (position) async {
        Placemark? placeMark =
        await LocationHelper.getPlaceMarkFromPosition(position);

        if (placeMark != null) {
          // ✅ خزن الكاش
          await AppSecureLocalStorageHelperFunctions.saveCachedLocation(
            latitude: position.latitude,
            longitude: position.longitude,
            place: placeMark.name ?? '',
          );
        }

        emit(LocationLoaded(position: position, placeMark: placeMark));
      },
      onError: (error) {
        emit(LocationError(errorMessage: error.toString()));
      },
    );
  }



  void startPermissionMonitoring() {
    _serviceStatusSubscription?.cancel();
    _serviceStatusSubscription =
        Geolocator.getServiceStatusStream().listen((status) async {
          print("Service status changed: $status");

          if (status == ServiceStatus.enabled) {
            LocationPermission permission = await Geolocator.checkPermission();
            print("Permission : $permission");

            if (permission == LocationPermission.denied) {
              permission = await Geolocator.requestPermission();
              print("Permission after request: $permission");
            }

            if (permission == LocationPermission.denied) {
              print("Permission still denied");
              emit(LocationPermissionDenied());
            }
            else if (permission == LocationPermission.deniedForever) {
              print("Permission denied forever");
              emit(LocationPermissionDeniedForever());
              await openAppSettings();
            }
            else {
              print("Permission granted: $permission");
              Position position = await LocationHelper.getCurrentLocation();
              Placemark? placeMark =
              await LocationHelper.getPlaceMarkFromPosition(position);
              emit(LocationLoaded(position: position, placeMark: placeMark));
            }
          } else if (status == ServiceStatus.disabled) {
            print("Location service disabled");
            emit(LocationDisabled());
          }
        });
  }


  Future<void> openAppSettings() async {
    _hasTriedToOpenSettings = true;

    final opened = await Geolocator.openAppSettings();

    if (opened) {
      print("openAppSettings");
      print(opened);
      // لما يرجع من الإعدادات، استنى ثانية ثم افحص التصريح تاني
      Future.delayed(Duration(seconds: 1), () async {
        final permission = await Geolocator.checkPermission();

        if (permission == LocationPermission.always ||
            permission == LocationPermission.whileInUse) {
          print("LocationPermission.always");
          // الصلاحية اديت، نعيد تشغيل التتبع
          await initLocationTracking();
        } else if (permission == LocationPermission.denied) {
          print("LocationPermission.denied---------------");
          emit(LocationPermissionDenied());
        } else if (permission == LocationPermission.deniedForever) {
          print("LocationPermission.deniedForever--------------");
          emit(LocationPermissionDeniedForever());
        }
      });
    }
  }


  @override
  Future<void> close() {
    _positionSubscription?.cancel();
    _serviceStatusSubscription?.cancel();
    return super.close();
  }
}
// Future<void> initLocationTracking() async {
//   emit(LocationLoading());
//   final permission = await Geolocator.checkPermission();
//
//   if (permission == LocationPermission.denied ||
//       permission == LocationPermission.deniedForever) {
//     emit(LocationPermissionDenied());
//     return;
//   }
//
//   //
//   // LocationPermission permission = await Geolocator.checkPermission();
//
//   // if (permission == LocationPermission.denied) {
//   //   permission = await Geolocator.requestPermission();
//   // }
//   //
//   // if (permission == LocationPermission.denied) {
//   //   emit(LocationPermissionDenied());
//   //   return;
//   // }
//   // else if (permission == LocationPermission.deniedForever) {
//   //   emit(LocationPermissionDeniedForever());
//   //   await openAppSettings();
//   //   return;
//   // }
//
//   // ✅ لو في بيانات أولية
//   if (LocationHelper.initialPosition != null &&
//       LocationHelper.initialPlacemark != null) {
//     emit(
//       LocationLoaded(
//         position: LocationHelper.initialPosition!,
//         placeMark: LocationHelper.initialPlacemark!,
//       ),
//     );
//   } else {
//     emit(LocationError(errorMessage: "Location not available at startup"));
//   }
//
//   // ✅ الاشتراك في تحديثات الموقع
//   _positionSubscription?.cancel();
//   _positionSubscription = Geolocator.getPositionStream(
//     locationSettings: const LocationSettings(
//       accuracy: LocationAccuracy.high,
//       distanceFilter: 100,
//     ),
//   ).listen(
//     (position) async {
//       Placemark? placeMark = await LocationHelper.getPlaceMarkFromPosition(
//         position,
//       );
//       emit(LocationLoaded(position: position, placeMark: placeMark));
//     },
//     onError: (error) {
//       emit(LocationError(errorMessage: error.toString()));
//     },
//   );
// }


// class SettingsCubit extends Cubit<SettingsState> {
//   SettingsCubit() : super(SettingsInitial());
//
//   StreamSubscription<Position>? _positionSubscription;
//   StreamSubscription<ServiceStatus>? _serviceStatusSubscription;
//   Timer? _permissionCheckTimer;
//   bool _hasTriedToOpenSettings = false;
//   LocationPermission _lastKnownPermission = LocationPermission.denied;
//
//   Future<void> initLocationTracking() async {
//     emit(LocationLoading());
//
//     final permission = await Geolocator.checkPermission();
//     _lastKnownPermission = permission;
//
//     if (permission == LocationPermission.denied ||
//         permission == LocationPermission.deniedForever) {
//       final (cachedPosition, cachedPlacemark) =
//       await AppSecureLocalStorageHelperFunctions.getCachedLocation();
//
//       if (cachedPosition != null && cachedPlacemark != null) {
//         emit(LocationLoaded(
//           position: cachedPosition,
//           placeMark: cachedPlacemark,
//         ));
//       } else {
//         emit(LocationPermissionDenied());
//       }
//       return;
//     }
//
//     if (LocationHelper.initialPosition != null &&
//         LocationHelper.initialPlacemark != null) {
//       emit(LocationLoaded(
//         position: LocationHelper.initialPosition!,
//         placeMark: LocationHelper.initialPlacemark!,
//       ));
//     } else {
//       emit(LocationError(errorMessage: "Location not available at startup"));
//     }
//
//     _positionSubscription?.cancel();
//     _positionSubscription = Geolocator.getPositionStream(
//       locationSettings: const LocationSettings(
//         accuracy: LocationAccuracy.high,
//         distanceFilter: 100,
//       ),
//     ).listen(
//           (position) async {
//         Placemark? placeMark =
//         await LocationHelper.getPlaceMarkFromPosition(position);
//
//         if (placeMark != null) {
//           await AppSecureLocalStorageHelperFunctions.saveCachedLocation(
//             latitude: position.latitude,
//             longitude: position.longitude,
//             place: placeMark.name ?? '',
//           );
//         }
//
//         emit(LocationLoaded(position: position, placeMark: placeMark));
//       },
//       onError: (error) {
//         emit(LocationError(errorMessage: error.toString()));
//       },
//     );
//   }
//
//   void startPermissionMonitoring() {
//     _serviceStatusSubscription?.cancel();
//     _serviceStatusSubscription =
//         Geolocator.getServiceStatusStream().listen((status) async {
//           print("Service status changed: $status");
//
//           if (status == ServiceStatus.enabled) {
//             _startPeriodicPermissionCheck();
//           }
//           else if (status == ServiceStatus.disabled) {
//             print("Location service disabled");
//             emit(LocationError(errorMessage: "Location service disabled"));
//           }
//         });
//
//     _startPeriodicPermissionCheck(); // علشان لو الخدمة كانت مفعلة من البداية
//   }
//
//   void _startPeriodicPermissionCheck() {
//     _permissionCheckTimer?.cancel();
//     _permissionCheckTimer = Timer.periodic(Duration(seconds: 5), (timer) async {
//       final currentPermission = await Geolocator.checkPermission();
//
//       if (_lastKnownPermission != currentPermission) {
//         print("Permission changed: $_lastKnownPermission → $currentPermission");
//         _lastKnownPermission = currentPermission;
//
//         if (currentPermission == LocationPermission.whileInUse ||
//             currentPermission == LocationPermission.always) {
//           print("Permission granted after being denied.");
//           await initLocationTracking();
//         } else if (currentPermission == LocationPermission.deniedForever) {
//           emit(LocationPermissionDeniedForever());
//         } else if (currentPermission == LocationPermission.denied) {
//           emit(LocationPermissionDenied());
//         }
//       }
//     });
//   }
//
//   Future<void> openAppSettings() async {
//     _hasTriedToOpenSettings = true;
//     await Geolocator.openAppSettings();
//   }
//
//   @override
//   Future<void> close() {
//     _positionSubscription?.cancel();
//     _serviceStatusSubscription?.cancel();
//     _permissionCheckTimer?.cancel();
//     return super.close();
//   }
// }
