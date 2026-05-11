import 'package:dartz/dartz.dart';
import 'package:stock_mate/core/errors/failure.dart';
import 'package:stock_mate/core/usecases/use_case.dart';
import 'package:stock_mate/features/settings/domain/repo/settings_repository.dart';
import 'package:stock_mate/features/settings/domain/use_cases/upload_shop_logo_url_use_case/upload_shop_logo_url_use_case_parameters.dart';

class UploadShopLogoUrlUseCase
    implements UseCase<void, UploadShopLogoUrlUseCaseParameters> {
  final SettingsRepository repository;

  const UploadShopLogoUrlUseCase({required this.repository});

  @override
  Future<Either<Failure, void>> call([
    UploadShopLogoUrlUseCaseParameters? param,
  ]) {
    return repository.updateShopLogoUrl(param!.url);
  }
}
