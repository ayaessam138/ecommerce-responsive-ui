import 'package:client/core/helpers/app_const.dart';
import 'package:client/core/network/dio_client.dart';

import '../models/profile_model.dart';

abstract class ProfileApi {
  Future<ProfileModel> getUserProfile();
}

class ProfileApiImpl implements ProfileApi {
  final DioClient dioClient;

  ProfileApiImpl({required this.dioClient});
  @override
  Future<ProfileModel> getUserProfile() async {
    final response = await dioClient.get(ApiConstants.profile);
    return ProfileModel.fromJson(response.data);
  }
}
