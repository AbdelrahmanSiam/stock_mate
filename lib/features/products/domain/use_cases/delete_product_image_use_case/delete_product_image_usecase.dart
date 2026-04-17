import 'package:dartz/dartz.dart';
import 'package:stock_mate/core/errors/failure.dart';
import 'package:stock_mate/core/usecases/use_case.dart';
import 'package:stock_mate/features/products/domain/repo/product_repository.dart';
import 'package:stock_mate/features/products/domain/use_cases/delete_product_image_use_case/delete_product_image_use_case_parameters.dart';

class DeleteProductImageUseCase
    implements UseCase<void, DeleteProductImageUseCaseParameters> {
  final ProductRepository repository;
  const DeleteProductImageUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call([
    DeleteProductImageUseCaseParameters? param,
  ]) => repository.deleteProductImage(param!.imageUrl);
}
