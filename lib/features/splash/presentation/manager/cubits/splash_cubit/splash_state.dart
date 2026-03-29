part of 'splash_cubit.dart';

@immutable
sealed class SplashState {}

final class SplashInitialState extends SplashState {}

final class SplashLoadingState extends SplashState {}

final class SplashAuthenticatedState extends SplashState {} // go to Dashboard View

final class SplashUnauthenticatedState extends SplashState {} // go to Login View
