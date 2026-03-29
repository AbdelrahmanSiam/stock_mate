import 'package:stock_mate/features/splash/data/datasources/remote/splash_remote_datasource.dart';
import 'package:stock_mate/features/splash/domain/repo/splash_repo.dart';

class SplashRepoImpl implements SplashRepo{
  final SplashRemoteDatasource splashRemoteDatasource;

  SplashRepoImpl({required this.splashRemoteDatasource});
  @override
  Future<bool> isUserLoggedIn()async {
    try {
  return await splashRemoteDatasource.isUserLoggedIn();
} catch (e) {
  return false; // for safe callback when exception happen
}
  }
}