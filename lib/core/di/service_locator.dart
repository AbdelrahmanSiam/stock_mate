import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
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
}
