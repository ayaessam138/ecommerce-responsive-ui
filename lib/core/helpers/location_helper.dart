import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

import 'app_secure_local_storage.dart';


class LocationHelper {
  static Position? initialPosition;
  static Placemark? initialPlacemark;

  /// Call this in main() to load cached location into static variables
  static Future<void> initFromCache() async {
    final (position, placemark) = await AppSecureLocalStorageHelperFunctions.getCachedLocation();
    if (position != null && placemark != null) {
      initialPosition = position;
      initialPlacemark = placemark;
    }
  }

  static Future<bool> requestLocationPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.whileInUse || permission == LocationPermission.always) {
      try {
        initialPosition = await Geolocator.getCurrentPosition();
        final placemarks = await placemarkFromCoordinates(
          initialPosition!.latitude,
          initialPosition!.longitude,
        );
        initialPlacemark = placemarks.isNotEmpty ? placemarks.first : null;

        // Save to cache
        if (initialPosition != null && initialPlacemark != null) {
          await AppSecureLocalStorageHelperFunctions.saveCachedLocation(
            latitude: initialPosition!.latitude,
            longitude: initialPosition!.longitude,
            place: initialPlacemark!.locality ?? initialPlacemark!.name ?? '',
          );
        }

        return true;
      } catch (e) {
        print("Location error: $e");
        return false;
      }
    }

    return false;
  }

  static Future<Position> getCurrentLocation() async {
    return Geolocator.getCurrentPosition();
  }

  static Future<Placemark?> getPlaceMarkFromPosition(Position position) async {
    final placeMarks = await placemarkFromCoordinates(position.latitude, position.longitude);
    return placeMarks.isNotEmpty ? placeMarks.first : null;
  }
}
