import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class AppSecureLocalStorageHelper {
  static late FlutterSecureStorage flutterSecureStorage;

  static init() async {
    flutterSecureStorage = const FlutterSecureStorage();
  }

  static dynamic getData({required String key}) {
    return flutterSecureStorage.read(key: key);
  }

  static Future<void> saveData({
    required String key,
    required dynamic value,
  }) async {
    return await flutterSecureStorage.write(key: key, value: value);
  }

  static Future<void> removeData({required String key}) async {
    return await flutterSecureStorage.delete(key: key);
  }
}

class AppSecureLocalStorageHelperFunctions {
  static Future<void> saveToken({required String token}) async {
    await AppSecureLocalStorageHelper.saveData(key: "token", value: token);
  }

  static Future<String> getToken() async {
    final token = await AppSecureLocalStorageHelper.getData(key: "token");
    return token ?? ''; // Return empty string if token is null
  }

  static Future<void> removeToken() async {
    await AppSecureLocalStorageHelper.removeData(key: "token");
    print('removetoken==============================');
  }

  static Future<void> saveLanguage({required String language}) async {
    await AppSecureLocalStorageHelper.saveData(
      key: "Language",
      value: language,
    );
  }

  static Future<String> getLanguage() async {
    final language = await AppSecureLocalStorageHelper.getData(key: "Language");
    return language ?? ''; // Return empty string if token is null
  }

  static Future<void> removeLanguage() async {
    await AppSecureLocalStorageHelper.removeData(key: "Language");
    print('removeLanguage==============================');
  }

  static Future<void> saveRefreshToken({required String refreshToken}) async {
    await AppSecureLocalStorageHelper.saveData(
      key: "refreshToken",
      value: refreshToken,
    );
  }

  static Future<String> getRefreshToken() async {
    final token = await AppSecureLocalStorageHelper.getData(
      key: "refreshToken",
    );
    return token ?? ''; // Return empty string if token is null
  }

  static Future<void> removeRefreshToken() async {
    await AppSecureLocalStorageHelper.removeData(key: "refreshToken");
    print('removerefreshToken==============================');
  }

  static Future<void> saveUserNumber({required String userNumber}) async {
    await AppSecureLocalStorageHelper.saveData(
      key: "UserNumber",
      value: userNumber,
    );
  }

  static Future<String> getUserNumber() async {
    final userNumber = await AppSecureLocalStorageHelper.getData(
      key: "UserNumber",
    );
    return userNumber ?? ''; // Return empty string if token is null
  }

  static Future<void> removeUserNumber() async {
    await AppSecureLocalStorageHelper.removeData(key: "UserNumber");
    print('removeUserNumber==============================');
  }

  static Future<void> saveCachedLocation({
    required double latitude,
    required double longitude,
    required String place,
  }) async {
    await AppSecureLocalStorageHelper.saveData(
      key: "cached_lat",
      value: latitude.toString(),
    );
    await AppSecureLocalStorageHelper.saveData(
      key: "cached_lng",
      value: longitude.toString(),
    );
    await AppSecureLocalStorageHelper.saveData(
      key: "cached_place",
      value: place,
    );
  }

  static Future<(Position?, Placemark?)> getCachedLocation() async {
    final lat = await AppSecureLocalStorageHelper.getData(key: "cached_lat");
    final lng = await AppSecureLocalStorageHelper.getData(key: "cached_lng");
    final place = await AppSecureLocalStorageHelper.getData(
      key: "cached_place",
    );

    if (lat != null && lng != null && place != null) {
      final position = Position(
        latitude: double.parse(lat),
        longitude: double.parse(lng),
        timestamp: DateTime.now(),
        accuracy: 1,
        altitude: 0,
        heading: 0,
        speed: 0,
        speedAccuracy: 0,
        altitudeAccuracy: 1,
        headingAccuracy: 1,
      );
      final placeMark = Placemark(name: place);
      return (position, placeMark);
    }

    return (null, null);
  }
}
