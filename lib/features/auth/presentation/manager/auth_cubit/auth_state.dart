part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitialState extends AuthState {}

final class AuthLoadingState extends AuthState {}

// Login or Register success
final class AuthSuccessState extends AuthState {
  final UserEntity user;
  AuthSuccessState(this.user);
}

// Email verification sent successfully
final class AuthEmailVerificationSentState extends AuthState {}

// user verify his email successfully
final class AuthEmailVerifiedState extends AuthState {}

// email still not verified
final class AuthEmailNotVerifiedState extends AuthState {}

// Password reset email sent successfully
final class AuthPasswordResetSentState extends AuthState {}

final class AuthErrorState extends AuthState {
  final String errMessage;
  AuthErrorState(this.errMessage);
}
