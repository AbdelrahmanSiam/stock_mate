import 'package:dartz/dartz.dart';
import 'package:stock_mate/core/errors/failure.dart';
import 'package:stock_mate/core/usecases/usecase.dart';
import 'package:stock_mate/features/splash/domain/repo/splash_repo.dart';

class CheckAuthUseCase extends UseCase<bool, NoParameters> {
  final SplashRepo splashRepo;

  CheckAuthUseCase({required this.splashRepo});
  @override
  Future<Either<Failure, bool>> call([NoParameters? param]) async {
    try {
      final result = await splashRepo.isUserLoggedIn();
      return Right(result);
    } catch (e) {
      return Right(
        false,
      ); // No error show when user not login , just send him to login view
    }
  }
}
