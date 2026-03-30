part of 'language_cubit.dart';

@immutable
sealed class LanguageState {}

final class LanguageInitialState extends LanguageState {}

final class LanguageSelectedState extends LanguageState {
  final String selectedCode;

  LanguageSelectedState({required this.selectedCode});
}

final class LanguageSaveLoadingState extends LanguageState {}

final class LanguageSaveSuccessState extends LanguageState {}

final class LanguageSaveFailureState extends LanguageState {
  final String errMessage;

  LanguageSaveFailureState({required this.errMessage});
}
