part of 'settings_cubit.dart';

@immutable
sealed class SettingsState {}

final class SettingsInitialState extends SettingsState {}

final class SettingsLoadingState extends SettingsState {}

final class SettingsSuccessState extends SettingsState {
  final SettingsUserEntity user;
  SettingsSuccessState(this.user);
}

final class SettingsErrorState extends SettingsState {
  final SettingsUserEntity?
  user; // In case of error we can still show the user data if we have it, for example when updating the display name if the update failed we can still show the old display name
  final String errMessage;
  SettingsErrorState({this.user, required this.errMessage});
}

final class SettingsLoggedOutState extends SettingsState {}
// To show loading indicator at saving button only when saving the settings
final class SettingsSavingState extends SettingsState {
  final SettingsUserEntity user;
  SettingsSavingState(this.user);
}
 // To show loading indicator when uploading at avatar only without showing loading indicator on the whole page
final class SettingsLogoUploadingState extends SettingsState {
  final SettingsUserEntity user;
  SettingsLogoUploadingState(this.user);
}

final class SettingsSavedState extends SettingsState {
  final SettingsUserEntity user;
  final String message;
  SettingsSavedState({required this.user, required this.message});
}
