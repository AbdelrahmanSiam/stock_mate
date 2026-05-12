import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:stock_mate/features/auth/domain/entities/user_entity.dart';
import 'package:stock_mate/features/auth/domain/use_cases/check_email_verified_usecase/check_email_verified_usecase.dart';
import 'package:stock_mate/features/auth/domain/use_cases/get_current_user_use_case/get_current_user_use_case.dart';
import 'package:stock_mate/features/auth/domain/use_cases/login_use_case/login_parameters.dart';
import 'package:stock_mate/features/auth/domain/use_cases/login_use_case/login_use_case.dart';
import 'package:stock_mate/features/auth/domain/use_cases/logout_use_case/logout_use_case.dart';
import 'package:stock_mate/features/auth/domain/use_cases/register_use_case/register_parameters.dart';
import 'package:stock_mate/features/auth/domain/use_cases/register_use_case/register_use_case.dart';
import 'package:stock_mate/features/auth/domain/use_cases/send_email_verification_usecase/send_email_verification_usecase.dart';
import 'package:stock_mate/features/auth/domain/use_cases/send_password_reset_usecase/send_password_reset_parameters.dart';
import 'package:stock_mate/features/auth/domain/use_cases/send_password_reset_usecase/send_password_reset_usecase.dart';
import 'package:stock_mate/features/auth/domain/use_cases/sign_in_with_google_use_case/sign_in_with_google_use_case.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(
    this.loginUseCase,
    this.registerUseCase,
    this.sendEmailVerificationUseCase,
    this.checkEmailVerifiedUseCase,
    this.sendPasswordResetUseCase,
    this.signInWithGoogleUseCase,
    this.logoutUseCase,
    this.getCurrentUserUseCase,
  ) : super(AuthInitialState());
  final LoginUseCase loginUseCase;
  final RegisterUseCase registerUseCase;
  final SendEmailVerificationUseCase sendEmailVerificationUseCase;
  final CheckEmailVerifiedUseCase checkEmailVerifiedUseCase;
  final SendPasswordResetUseCase sendPasswordResetUseCase;
  final SignInWithGoogleUseCase signInWithGoogleUseCase;
  final LogoutUseCase logoutUseCase;
  final GetCurrentUserUseCase getCurrentUserUseCase;

  Future<void> login({required String email, required String password}) async {
    emit(AuthLoadingState());
    final result = await loginUseCase.call(
      LoginParameters(email: email, password: password),
    );
    result.fold(
      (failure) {
        emit(AuthErrorState(failure.errMessage));
      },
      (user) {
        emit(AuthSuccessState(user));
      },
    );
  }

  Future<void> register({
    required String email,
    required String password,
    required String displayName,
    required String shopName,
  }) async {
    emit(AuthLoadingState());
    final result = await registerUseCase(
      RegisterParameters(
        email: email,
        password: password,
        displayName: displayName,
        shopName: shopName,
      ),
    );
    result.fold(
      (failure) => emit(AuthErrorState(failure.errMessage)),
      (user) => emit(AuthEmailVerificationSentState()),
    );
  }

  // called each 3 sec from Email Verification screen using timer controller
  Future<void> checkEmailVerified() async {
    final result = await checkEmailVerifiedUseCase.call();
    result.fold((failure) => emit(AuthErrorState(failure.errMessage)), (
      isVerified,
    ) {
      if (isVerified) {
        emit(AuthEmailVerifiedState());
      } else {
        emit(AuthEmailNotVerifiedState());
      }
    });
  }

  Future<void> resendEmailVerification() async {
    final result = await sendEmailVerificationUseCase.call();
    result.fold((failure) => emit(AuthErrorState(failure.errMessage)), (_) {
      emit(AuthEmailVerificationSentState());
    });
  }

  Future<void> sendPasswordReset({required String email}) async {
    emit(AuthLoadingState());
    final result = await sendPasswordResetUseCase.call(
      SendPasswordResetParams(email: email),
    );
    result.fold(
      (failure) => emit(AuthErrorState(failure.errMessage)),
      (_) => emit(AuthPasswordResetSentState()),
    );
  }

  Future<void> signInWithGoogle() async {
    emit(AuthLoadingState());
    final result = await signInWithGoogleUseCase();
    result.fold(
      (failure) => emit(AuthErrorState(failure.errMessage)),
      (user) => emit(AuthSuccessState(user)),
    );
  }

  Future<void> logout() async {
    emit(AuthLoadingState());
    final result = await logoutUseCase();
    result.fold(
      (failure) => emit(AuthErrorState(failure.errMessage)),
      (_) => emit(AuthLoggedOutState()),
    );
  }

  void getCurrentUser() {
    final result = getCurrentUserUseCase();
    result.listen((either) {
      either.fold((failure) => emit(AuthErrorState(failure.errMessage)), (
        user,
      ) {
        if (user != null) {
          emit(AuthSuccessState(user));
        } else {
          emit(AuthLoggedOutState());
        }
      });
    });
  }
}
