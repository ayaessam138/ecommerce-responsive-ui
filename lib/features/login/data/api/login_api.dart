import 'package:client/core/helpers/app_const.dart';
import 'package:client/core/network/dio_client.dart';

import '../model/login_model.dart';
import '../param/login_param.dart';

abstract class LoginApi {
  Future<LoginModel> login({required LoginParam param});
}

class LoginApiImpl implements LoginApi {
  final DioClient dioClient;

  LoginApiImpl({required this.dioClient});
  @override
  Future<LoginModel> login({required LoginParam param}) async {
    final reponse = await dioClient.post(
      ApiConstants.login,
      data: param.toJson(),
    );
    return LoginModel.fromJson(reponse.data);
  }
}
