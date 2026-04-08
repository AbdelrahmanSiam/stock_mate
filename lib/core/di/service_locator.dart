import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hive/hive.dart';
import 'package:stock_mate/core/constants/constants.dart';
import 'package:stock_mate/core/cubit/cubit/locale_cubit.dart';
import 'package:stock_mate/features/auth/data/data_sources/remote/auth_remote_datasource.dart';
import 'package:stock_mate/features/auth/data/data_sources/remote/auth_remote_datasource_impl.dart';
import 'package:stock_mate/features/auth/data/repo/auth_repository_impl.dart';
import 'package:stock_mate/features/auth/domain/repo/auth_repo.dart';
import 'package:stock_mate/features/auth/domain/use_cases/check_email_verified_usecase/check_email_verified_usecase.dart';
import 'package:stock_mate/features/auth/domain/use_cases/login_use_case/login_use_case.dart';
import 'package:stock_mate/features/auth/domain/use_cases/logout_use_case/logout_use_case.dart';
import 'package:stock_mate/features/auth/domain/use_cases/register_use_case/register_use_case.dart';
import 'package:stock_mate/features/auth/domain/use_cases/send_email_verification_usecase/send_email_verification_usecase.dart';
import 'package:stock_mate/features/auth/domain/use_cases/send_password_reset_usecase/send_password_reset_usecase.dart';
import 'package:stock_mate/features/auth/domain/use_cases/sign_in_with_google_use_case/sign_in_with_google_use_case.dart';
import 'package:stock_mate/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:stock_mate/features/language/data/local/language_local_data.dart';
import 'package:stock_mate/features/language/data/local/language_local_data_impl.dart';
import 'package:stock_mate/features/language/data/repo/language_repo_impl.dart';
import 'package:stock_mate/features/language/domain/repo/language_repo.dart';
import 'package:stock_mate/features/language/domain/usecases/get_saved_language_use_case.dart';
import 'package:stock_mate/features/language/domain/usecases/save_language_use_case.dart';
import 'package:stock_mate/features/language/presentation/cubits/language_cubit/language_cubit.dart';
import 'package:stock_mate/features/splash/data/datasources/remote/splash_remote_datasource.dart';
import 'package:stock_mate/features/splash/data/datasources/remote/splash_remote_datasource_impl.dart';
import 'package:stock_mate/features/splash/data/repo/splash_repo_impl.dart';
import 'package:stock_mate/features/splash/domain/usecase/check_auth_use_case.dart';
import 'package:stock_mate/features/splash/presentation/manager/cubits/splash_cubit/splash_cubit.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  //              Splash Feature
  getIt.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
  getIt.registerLazySingleton<GoogleSignIn>(() => GoogleSignIn.instance);
  getIt.registerLazySingleton<SplashRemoteDatasource>(
    () => SplashRemoteDatasourceImpl(getIt<FirebaseAuth>()),
  );
  getIt.registerLazySingleton<SplashRepoImpl>(
    () =>
        SplashRepoImpl(splashRemoteDatasource: getIt<SplashRemoteDatasource>()),
  );
  getIt.registerLazySingleton<CheckAuthUseCase>(
    () => CheckAuthUseCase(splashRepo: getIt<SplashRepoImpl>()),
  );
  getIt.registerFactory<SplashCubit>(
    () => SplashCubit(getIt<CheckAuthUseCase>()),
  );
  //              Language Feature
  // ── Hive Box ──────────────────────────────────────────
  getIt.registerLazySingleton<Box>(
    () => Hive.box(kLanguageBox),
    instanceName: kLanguageInstanceName,
  );

  // ── Language DataSources ───────────────────────────────
  getIt.registerLazySingleton<LanguageLocalData>(
    () => LanguageLocalDataImpl(
      box: getIt<Box>(instanceName: kLanguageInstanceName),
    ),
  );

  // ── Language Repository ────────────────────────────────
  getIt.registerLazySingleton<LanguageRepo>(
    () => LanguageRepoImpl(languageLocalData: getIt<LanguageLocalData>()),
  );

  // ── Language UseCases ──────────────────────────────────
  getIt.registerLazySingleton<SaveLanguageUseCase>(
    () => SaveLanguageUseCase(languageRepo: getIt<LanguageRepo>()),
  );

  getIt.registerLazySingleton<GetSavedLanguageUseCase>(
    () => GetSavedLanguageUseCase(languageRepo: getIt<LanguageRepo>()),
  );
  // ── Local Cubit ─────────────────────────────────────
  getIt.registerFactory<LocaleCubit>(
    () => LocaleCubit(
      getIt<SaveLanguageUseCase>(),
      getIt<GetSavedLanguageUseCase>(),
    ),
  );

  // ── Language Cubit ─────────────────────────────────────
  getIt.registerFactory<LanguageCubit>(
    () => LanguageCubit(getIt<LocaleCubit>()),
  );
  //                other Auth Feature
  // ── Auth Remote DataSource ─────────────────────────────────
  getIt.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDatasourceImpl(
      firebaseAuth: getIt<FirebaseAuth>(),
      googleSignIn: getIt<GoogleSignIn>(),
    ),
  );

  // ── Auth Repository ────────────────────────────────────────
  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(getIt<AuthRemoteDataSource>()),
  );

  // ── Auth UseCases ──────────────────────────────────────────
  getIt.registerLazySingleton<LoginUseCase>(
    () => LoginUseCase(authRepository: getIt<AuthRepository>()),
  );
  getIt.registerLazySingleton<RegisterUseCase>(
    () => RegisterUseCase(authRepository: getIt<AuthRepository>()),
  );
  getIt.registerLazySingleton<SendEmailVerificationUseCase>(
    () => SendEmailVerificationUseCase(getIt<AuthRepository>()),
  );
  getIt.registerLazySingleton<CheckEmailVerifiedUseCase>(
    () => CheckEmailVerifiedUseCase(getIt<AuthRepository>()),
  );
  getIt.registerLazySingleton<SendPasswordResetUseCase>(
    () => SendPasswordResetUseCase(getIt<AuthRepository>()),
  );
  getIt.registerLazySingleton<SignInWithGoogleUseCase>(
    () => SignInWithGoogleUseCase(getIt<AuthRepository>()),
  );
  getIt.registerLazySingleton<LogoutUseCase>(
    () => LogoutUseCase(getIt<AuthRepository>()),
  );

  // ── Auth Cubit ─────────────────────────────────────────────
  getIt.registerFactory<AuthCubit>(
    () => AuthCubit(
      getIt<LoginUseCase>(),
      getIt<RegisterUseCase>(),
      getIt<SendEmailVerificationUseCase>(),
      getIt<CheckEmailVerifiedUseCase>(),
      getIt<SendPasswordResetUseCase>(),
      getIt<SignInWithGoogleUseCase>(),
      getIt<LogoutUseCase>(),
    ),
  );
}
