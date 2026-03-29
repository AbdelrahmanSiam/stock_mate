import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:stock_mate/features/splash/domain/usecase/check_auth_use_case.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit(this.checkAuthUseCase) : super(SplashInitialState());
  final CheckAuthUseCase checkAuthUseCase;
  Future<void> checkUserLogin() async {
    emit(SplashLoadingState());
    final result = await checkAuthUseCase.call();
    result.fold(
      (error) {
        emit(SplashUnauthenticatedState());
      },
      (isLoggedIn) { // return bool value
        if (isLoggedIn) {
          emit(SplashAuthenticatedState());
        } else {
          emit(SplashUnauthenticatedState());
        }
      },
    );
  }
}
