import 'package:dartz/dartz.dart';
import 'package:stock_mate/core/errors/failure.dart';
import 'package:stock_mate/core/usecases/use_case.dart';
import 'package:stock_mate/features/products/domain/repo/product_repository.dart';
import 'package:stock_mate/features/products/domain/use_cases/add_product_use_case/add_products_use_case_parameters.dart';

class AddProductUseCase implements UseCase<void, AddProductsUseCaseParameters> {
  final ProductRepository repository;
  const AddProductUseCase(this.repository);
  @override
  Future<Either<Failure, void>> call([AddProductsUseCaseParameters? param]) {
    return repository.addProduct(param!.product);
  }
}
