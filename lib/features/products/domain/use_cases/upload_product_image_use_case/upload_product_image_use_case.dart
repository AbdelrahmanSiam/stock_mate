import 'package:dartz/dartz.dart';
import 'package:stock_mate/core/errors/failure.dart';
import 'package:stock_mate/core/usecases/use_case.dart';
import 'package:stock_mate/features/products/domain/repo/product_repository.dart';
import 'package:stock_mate/features/products/domain/use_cases/upload_product_image_use_case/upload_product_image_use_case_parameters.dart';

class UploadProductImageUseCase
    implements UseCase<String, UploadProductImageUseCaseParameters> {
  final ProductRepository repository;
  const UploadProductImageUseCase(this.repository);

  @override
  Future<Either<Failure, String>> call([
    UploadProductImageUseCaseParameters? param,
  ]) => repository.uploadProductImage(param!.image);
}
