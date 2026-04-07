import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:stock_mate/features/auth/domain/entities/user_entity.dart';
import 'package:stock_mate/features/auth/domain/use_cases/check_email_verified_usecase/check_email_verified_usecase.dart';
import 'package:stock_mate/features/auth/domain/use_cases/login_use_case/login_parameters.dart';
import 'package:stock_mate/features/auth/domain/use_cases/login_use_case/login_use_case.dart';
import 'package:stock_mate/features/auth/domain/use_cases/register_use_case/register_use_case.dart';
import 'package:stock_mate/features/auth/domain/use_cases/send_email_verification_usecase/send_email_verification_usecase.dart';
import 'package:stock_mate/features/auth/domain/use_cases/send_password_reset_usecase/send_password_reset_usecase.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(
    this.loginUseCase,
    this.registerUseCase,
    this.sendEmailVerificationUseCase,
    this.checkEmailVerifiedUseCase,
    this.sendPasswordResetUseCase,
  ) : super(AuthInitialState());
  final LoginUseCase loginUseCase;
  final RegisterUseCase registerUseCase;
  final SendEmailVerificationUseCase sendEmailVerificationUseCase;
  final CheckEmailVerifiedUseCase checkEmailVerifiedUseCase;
  final SendPasswordResetUseCase sendPasswordResetUseCase;

  Future<void> login({required String email, required String password}) async {
    emit(AuthLoadingState());
    final result = await loginUseCase.call(
      LoginParameters(email: email, password: password),
    );
    result.fold(
      (error) {
        emit(AuthErrorState(error.errMessage));
      },
      (user) {
        emit(AuthSuccessState(user));
      },
    );
  }
}
