import 'package:dartz/dartz.dart';
import 'package:stock_mate/core/errors/failure.dart';
import 'package:stock_mate/core/usecases/use_case.dart';
import 'package:stock_mate/features/language/domain/repo/language_repo.dart';

class SaveLanguageParameters {
  final String languageCode;

  SaveLanguageParameters({required this.languageCode});
}

class SaveLanguageUseCase implements UseCase<void, SaveLanguageParameters> {
  final LanguageRepo languageRepo;

  SaveLanguageUseCase({required this.languageRepo});
  @override
  Future<Either<Failure, void>> call([
    SaveLanguageParameters? parameter,
  ]) async {
    try {
      await languageRepo.saveLanguage(
        languageCode: parameter!.languageCode,
      ); // parameter is obj from SaveLanguageParameters class
      return const Right(null); // save it and return nothing
    } catch (e) {
      return Left(ServerFailure(errMessage: e.toString()));
    }
  }
}
