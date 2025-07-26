part of 'settings_cubit.dart';

@immutable
sealed class SettingsState {}

final class SettingsInitial extends SettingsState {}
final class LocationLoading extends SettingsState {}
final class LocationDisabled extends SettingsState {}
final class LocationPermissionDenied extends SettingsState {}
final class LocationPermanentlyDeniedAndRejectedAgain extends SettingsState {}
final class LocationPermissionDeniedForever extends SettingsState {}

final class LocationLoaded extends SettingsState {
  final Position position;
  final Placemark? placeMark;

  LocationLoaded({required this.position, required this.placeMark});


}

final class LocationError extends SettingsState {
  final String errorMessage;

  LocationError({required this.errorMessage});
}
