import 'package:dartz/dartz.dart';
import 'package:stock_mate/core/errors/failure.dart';
import 'package:stock_mate/core/usecases/use_case.dart';
import 'package:stock_mate/features/settings/domain/repo/settings_repository.dart';
import 'package:stock_mate/features/settings/domain/use_cases/update_display_name_use_case/update_display_name_use_case_parameters.dart';

class UpdateDisplayNameUseCase
    implements UseCase<void, UpdateDisplayNameUseCaseParameters> {
  final SettingsRepository repository;

  UpdateDisplayNameUseCase({required this.repository});

  @override
  Future<Either<Failure, void>> call([
    UpdateDisplayNameUseCaseParameters? param,
  ]) {
    return repository.updateDisplayName(param!.displayName);
  }
}
