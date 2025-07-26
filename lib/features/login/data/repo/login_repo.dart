import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:client/core/error_handle/error_handler.dart';
import 'package:client/features/login/data/api/login_api.dart';
import '../../../../core/network/network_info.dart';
import '../model/login_model.dart';
import '../param/login_param.dart';

class LoginRepo {
  final LoginApi loginApis;
  final NetworkInfo networkInfo;

  LoginRepo(this.loginApis, {required this.networkInfo});

  Future<Either<ErrorHandler, LoginModel>> login({
    required LoginParam params,
  }) async {
    try {
      final response = await loginApis.login(
        param: params,
      );
      //! Tokens
      // var data = response.data;
      // var token = data?.token ?? "";
      // await AppSecureLocalStorageHelperFunctions.saveToken(token: token);
      // var refreshToken = data?.refreshToken ?? "";
      // await AppSecureLocalStorageHelperFunctions.saveRefreshToken(refreshToken: refreshToken);

      return Right(response);
    } on DioException catch (error) {
      return Left(ErrorHandler.handle(error));
    }
  }
}
