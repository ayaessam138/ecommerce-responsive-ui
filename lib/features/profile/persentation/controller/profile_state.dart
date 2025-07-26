part of 'profile_cubit.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class ProfileLoading extends ProfileState {}

final class ProfileSuccess extends ProfileState {
  final ProfileModel profileModel;

  ProfileSuccess({required this.profileModel});
}

final class  PhoneLoaded extends ProfileState {
  final String phone;

  PhoneLoaded({required this.phone});
}

final class ProfileFailure extends ProfileState {
  final String errorMessage;

  ProfileFailure({required this.errorMessage});
}
