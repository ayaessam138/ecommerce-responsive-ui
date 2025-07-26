import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

import '../../../../core/helpers/app_secure_local_storage.dart';


part 'set_up_profile_state.dart';

class SetUpProfileCubit extends Cubit<SetUpProfileState> {
  SetUpProfileCubit() : super(SetUpProfileInitial()) {
    loadPhoneNumber();
  }

  static SetUpProfileCubit of(BuildContext context) =>
      context.read<SetUpProfileCubit>();
  File? profileImage;
  Future<void> pickProfileImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      profileImage = File(pickedFile.path);
      emit(ProfileImagePicked(image: profileImage!));
    } else {
      emit(ProfileImagePickCancelled());
    }
  }

  var number = '';
  Future<void> loadPhoneNumber() async {
    number = await AppSecureLocalStorageHelperFunctions.getUserNumber();
    emit(SetUpProfilePhoneLoaded(userNumber: number));
  }
}
