import 'package:dartz/dartz.dart';
import 'package:stock_mate/core/errors/failure.dart';
import 'package:stock_mate/core/usecases/use_case.dart';
import 'package:stock_mate/features/settings/domain/repo/settings_repository.dart';
import 'package:stock_mate/features/settings/domain/use_cases/upload_shop_logo_use_case/upload_shop_logo_use_case_parameters.dart';

class UploadShopLogoUseCase
    implements UseCase<String, UploadShopLogoUseCaseParameters> {
  final SettingsRepository repository;

  const UploadShopLogoUseCase({required this.repository});
  @override
  Future<Either<Failure, String>> call([
    UploadShopLogoUseCaseParameters? param,
  ]) {
    return repository.uploadShopLogo(param!.image);
  }
}
