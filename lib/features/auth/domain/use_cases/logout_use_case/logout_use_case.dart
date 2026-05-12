import 'package:dartz/dartz.dart';
import 'package:stock_mate/core/errors/failure.dart';
import 'package:stock_mate/core/usecases/use_case.dart';
import 'package:stock_mate/features/settings/domain/repo/settings_repository.dart';

class LogoutUseCase implements UseCase<void, NoParameters> {
  final SettingsRepository repository;
  const LogoutUseCase({required this.repository});
  @override
  Future<Either<Failure, void>> call([NoParameters? param]) async {
    return await repository.logout();
  }
}
