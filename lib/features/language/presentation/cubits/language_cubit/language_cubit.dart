import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:stock_mate/core/cubit/cubit/locale_cubit.dart';

part 'language_state.dart';

class LanguageCubit extends Cubit<LanguageState> {
  LanguageCubit(this.localeCubit)
    : super(LanguageInitialState());
  final LocaleCubit localeCubit;

  //1- When user click on language card
  void selectLanguage(String code) {
    // emit state with selected language
    // UI update (border + radio)
    emit(LanguageSelectedState(selectedCode: code));
  }

  //2- confirm language
  Future<void> confirmLanguage() async {
    if (state is! LanguageSelectedState)
      return; // to ensure that user select one card
    final selectedCode = (state as LanguageSelectedState).selectedCode;
    emit(LanguageSaveLoadingState());
    await localeCubit.changeLocal(selectedCode); // will give this function the code that user choice
    emit(LanguageSaveSuccessState());
  }
}
