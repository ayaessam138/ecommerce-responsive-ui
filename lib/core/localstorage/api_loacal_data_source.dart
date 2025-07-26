import 'dart:convert';
import 'package:hive/hive.dart';
import '../helpers/app_const.dart';
import 'hive_helper.dart';

//cashing api request
abstract class ApiLocalDataSource {
  Future save({
    required Map<String, dynamic> data,
    required String key,
    required Box box,
    bool saveWhen = true,
  });
  Future clear({required String key, required Box box,});

  Future<Map<String, dynamic>> get({required String key, required Box box,});

  Future cashRequest({required String key, required bool cashWhen, required Box box,});

  bool isRequestCashed({required String key, required Box box,});
}

class ApiLocalDataSourceImpl implements ApiLocalDataSource {
  // final AppHiveAppHiveLocalStorage AppHiveLocalStorage;
  final DateTime _cashPeriod = DateTime.now().add(const Duration(days: 1));

  ApiLocalDataSourceImpl();

  @override
  Future<void> save({
    required Map<String, dynamic> data,
    required String key,
    required Box box,
    bool saveWhen = true,
  }) async {
    if (!saveWhen) return;
    await HiveHelper.saveString(key, jsonEncode(data),box);
  }

  @override
  Future<Map<String, dynamic>> get({required String key, required Box box,}) async {
    try {
      return jsonDecode(HiveHelper.getString(key,box));
    } catch (e) {
      return {};
    }
  }

  @override
  Future<void> clear({required String key, required Box box,}) {
    return HiveHelper.delete(key,box);
  }

  @override
  Future<void> cashRequest({
    required String key,
    required bool cashWhen,
     required Box box,
  }) async {
    var data = CashRequestModel(expires: _cashPeriod, isCashed: cashWhen);
    await HiveHelper.saveString(
      key + AppSavedKey.cashRequest,
      jsonEncode(data),box
    );
    print("Saving cache: ${jsonEncode(data)} for key: $key");
  }

  @override
  bool isRequestCashed({required String key, required Box box,}) {
    try {
      var data = CashRequestModel.fromJson(
        jsonDecode(
          HiveHelper.getString(key + AppSavedKey.cashRequest,box),
        ),
      );

      return !DateTime.now().isAfter(data.expires!) && data.isCashed;
    } catch (e) {
      print("Cache expires at: ${e}");
      return false;
    }
  }
}

class CashRequestModel {
  DateTime? expires;
  bool isCashed = false;
  CashRequestModel({required this.expires, required this.isCashed});

  CashRequestModel.fromJson(Map<String, dynamic> json) {
    expires = json['expires'] != null ? DateTime.parse(json['expires']) : null;
    isCashed = json['is_cashed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['expires'] = expires?.toIso8601String();
    data['is_cashed'] = isCashed;
    return data;
  }
}
