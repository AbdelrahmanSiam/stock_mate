import 'package:dartz/dartz.dart';
import 'package:stock_mate/core/errors/failure.dart';
import 'package:stock_mate/core/usecases/use_case.dart';
import 'package:stock_mate/features/language/domain/repo/language_repo.dart';

class GetSavedLanguageUseCase implements UseCase<String?, NoParameters> {
  final LanguageRepo languageRepo;

  GetSavedLanguageUseCase({required this.languageRepo});
  @override
  Future<Either<Failure, String?>> call([NoParameters? param]) async {
    try {
     final String? languageCode = await languageRepo.getSavedLanguage();
      return Right(languageCode);
    } catch (e) {
      return Left(ServerFailure(errMessage: e.toString()));
    }
  }
}
