import 'package:dartz/dartz.dart';
import 'package:stock_mate/core/errors/failure.dart';
import 'package:stock_mate/core/usecases/use_case.dart';
import 'package:stock_mate/features/settings/domain/enitites/settings_user_entity.dart';
import 'package:stock_mate/features/settings/domain/repo/settings_repository.dart';

class GetUserDataUseCase {
  final SettingsRepository repository;

  GetUserDataUseCase({required this.repository});
  @override
  Stream<Either<Failure, SettingsUserEntity>> call([NoParameters? param]) {
    return repository.getUserData();
  }
}
