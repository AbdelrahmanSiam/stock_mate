import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:stock_mate/core/constants/constants.dart';
import 'package:stock_mate/core/cubit/cubit/locale_cubit.dart';
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
  getIt.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
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
    () => LanguageCubit(
      getIt<LocaleCubit>(),
    ),
  );
}
