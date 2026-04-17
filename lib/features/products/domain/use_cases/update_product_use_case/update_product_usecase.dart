import 'package:dartz/dartz.dart';
import 'package:stock_mate/core/errors/failure.dart';
import 'package:stock_mate/core/usecases/use_case.dart';
import 'package:stock_mate/features/products/domain/repo/product_repository.dart';
import 'package:stock_mate/features/products/domain/use_cases/update_product_use_case/update_product_use_case_parameters.dart';

class UpdateProductUseCase
    implements UseCase<void, UpdateProductUseCaseParameters> {
  final ProductRepository repository;
  const UpdateProductUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call([UpdateProductUseCaseParameters? param]) =>
      repository.updateProduct(param!.product);
}
