import 'package:dartz/dartz.dart';
import 'package:stock_mate/core/errors/failure.dart';
import 'package:stock_mate/core/usecases/use_case.dart';
import 'package:stock_mate/features/products/domain/repo/product_repository.dart';
import 'package:stock_mate/features/products/domain/use_cases/delete_product_use_case/delete_product_use_case_parameters.dart';

class DeleteProductUseCase implements UseCase<void, DeleteProductUseCaseParameters> {
  final ProductRepository repository;
  const DeleteProductUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call([DeleteProductUseCaseParameters? param]) async {
    // First delete image from supabase
    if (param!.imageUrl.isNotEmpty) {
      await repository.deleteProductImage(param.imageUrl);
    }
    //then delete document from firestore
    return repository.deleteProduct(param.id);
  }
}