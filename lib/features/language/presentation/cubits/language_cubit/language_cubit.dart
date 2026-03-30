import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:stock_mate/features/language/domain/usecases/get_saved_language_use_case.dart';
import 'package:stock_mate/features/language/domain/usecases/save_language_use_case.dart';

part 'language_state.dart';

class LanguageCubit extends Cubit<LanguageState> {
  LanguageCubit(this.saveLanguageUseCase, this.getSavedLanguageUseCase)
    : super(LanguageInitialState());
  final SaveLanguageUseCase saveLanguageUseCase;
  final GetSavedLanguageUseCase getSavedLanguageUseCase;

  //1- When user click on language card
  void selectLanguage(String code) {
    // emit state with selected language
    // UI update (border + radio)
    emit(LanguageSelectedState(selectedCode: code));
    //2- confirm language
    Future<void> confirmLanguage() async {
      if (state is! LanguageSelectedState)
        return; // to ensure that user select one card
      final selectedCode = (state as LanguageSelectedState).selectedCode;
      emit(LanguageSaveLoadingState());
      final result = await saveLanguageUseCase(
        SaveLanguageParameters(languageCode: selectedCode),
      );
      return result.fold(
        (error) {
          emit(LanguageSaveFailureState(errMessage: error.toString()));
        },
        (_) {
          emit(LanguageSaveSuccessState());
        },
      );
    }
  }
}
