part of 'set_up_profile_cubit.dart';

@immutable
sealed class SetUpProfileState {}

final class SetUpProfileInitial extends SetUpProfileState {}

final class ProfileImagePicked extends SetUpProfileState {
  final File image;
  ProfileImagePicked({required this.image});
}

final class ProfileImagePickCancelled extends SetUpProfileState {}

final class SetUpProfilePhoneLoaded extends SetUpProfileState {
  final String userNumber;

  SetUpProfilePhoneLoaded({required this.userNumber});
}
