import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../core/helpers/app_secure_local_storage.dart';
import '../../../../core/helpers/dependency_injection.dart';
import '../../data/models/profile_model.dart';
import '../../data/repo/profile_repo.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit({required this.profileRepo}) : super(ProfileInitial()) {
    loadPhoneNumber();
  }
  final ProfileRepo profileRepo;

  static ProfileCubit get get => getIt();
  static ProfileCubit of(BuildContext context) => context.read<ProfileCubit>();

  Future getProfile() async {
    emit(ProfileLoading());
    final result = await profileRepo.getUserProfile();
    result.fold(
      (fail) {
        emit(ProfileFailure(errorMessage: fail.apiErrorModel.message ?? ''));
      },
      (success) {
        emit(ProfileSuccess(profileModel: success));
      },
    );
  }

  var phoneNumber = '';
  Future<void> loadPhoneNumber() async {
    phoneNumber = await AppSecureLocalStorageHelperFunctions.getUserNumber();
    emit(PhoneLoaded(phone: phoneNumber));
  }
}
