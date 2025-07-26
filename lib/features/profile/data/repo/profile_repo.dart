import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:client/core/network/network_info.dart';
import 'package:client/features/profile/data/api/profile_api.dart';

import '../../../../core/error_handle/error_handler.dart';
import '../models/profile_model.dart';

class ProfileRepo {
  final ProfileApi profileApi;
  final NetworkInfo networkInfo;

  ProfileRepo({required this.profileApi, required this.networkInfo});
  Future<Either<ErrorHandler, ProfileModel>> getUserProfile() async {
    try {
      final response = await profileApi.getUserProfile();

      return Right(response);
    } on DioException catch (error) {
      return Left(ErrorHandler.handle(error));
    }
  }
}
