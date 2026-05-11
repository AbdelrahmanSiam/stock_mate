import 'package:dartz/dartz.dart';
import 'package:stock_mate/core/errors/failure.dart';
import 'package:stock_mate/core/usecases/use_case.dart';
import 'package:stock_mate/features/settings/domain/repo/settings_repository.dart';
import 'package:stock_mate/features/settings/domain/use_cases/update_shop_name_use_case/update_shop_name_use_case_parameters.dart';

class UpdateShopNameUseCase
    implements UseCase<void, UpdateShopNameUseCaseParameters> {
  final SettingsRepository repository;

  UpdateShopNameUseCase({required this.repository});
  @override
  Future<Either<Failure, void>> call([UpdateShopNameUseCaseParameters? param]) {
    return repository.updateShopName(param!.shopName);
  }
}
