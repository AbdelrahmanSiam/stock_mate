import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
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
    result.fold((_) => emit(LocaleInitialState()), (languageCode) {
      if (languageCode == null) {
        // No saved language at first time will navigate to language screen
        emit(LocaleInitialState());
      } else {
        emit(LocaleLoadedState(locale: Locale(languageCode)));
      }
    });
  }

  // Called when user use language screen from app to change it
  Future<void> changeLocal(String languageCode) async {
    final result = await saveLanguageUseCase(
      SaveLanguageParameters(languageCode: languageCode),
    );
    result.fold(
      (_) => null,
      (_) => emit(LocaleLoadedState(locale: Locale(languageCode))),
    );
  }
}
