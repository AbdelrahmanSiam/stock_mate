import 'package:firebase_auth/firebase_auth.dart';
import 'package:stock_mate/features/splash/data/datasources/remote/splash_remote_datasource.dart';

class SplashRemoteDatasourceImpl implements SplashRemoteDatasource {
  final FirebaseAuth firebaseAuth;

  const SplashRemoteDatasourceImpl(this.firebaseAuth);

  @override
  Future<bool> isUserLoggedIn() async {
    // currentUser not Future — synchronous
    // Firebase save session locally
    // no need for internet
    return firebaseAuth.currentUser != null;
  }
}