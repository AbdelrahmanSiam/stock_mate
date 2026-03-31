import 'package:bloc/bloc.dart';
import 'package:flutter/rendering.dart';
import 'package:meta/meta.dart';
import 'package:stock_mate/features/language/domain/usecases/get_saved_language_use_case.dart';
import 'package:stock_mate/features/language/domain/usecases/save_language_use_case.dart';

part 'locale_state.dart';

class LocaleCubit extends Cubit<LocaleState> {
  LocaleCubit(this.saveLanguageUseCase, this.getSavedLanguageUseCase)
    : super(LocaleInitialState());

  final SaveLanguageUseCase saveLanguageUseCase;
  final GetSavedLanguageUseCase getSavedLanguageUseCase;
          // call it main to return saved language when open app every time
  Future<void> loadSavedLanguage() async {
    final result = await getSavedLanguageUseCase();
    result.fold((_) => emit(LocaleLoadedState(locale: Locale("ar"))), (
      languageCode,
    ) {
      if (languageCode == null) {
        // first time to visit app
        emit(LocaleInitialState());
      } else {
        emit(LocaleLoadedState(locale: Locale(languageCode)));
      }
    });
  }
}
