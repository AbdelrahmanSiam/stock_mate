part of 'locale_cubit.dart';

@immutable
sealed class LocaleState {}

final class LocaleInitialState extends LocaleState {}

final class LocaleLoadedState extends LocaleState {
  final Locale locale;

  LocaleLoadedState({required this.locale});
}
