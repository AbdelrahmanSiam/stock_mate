import 'package:dartz/dartz.dart';
import 'package:stock_mate/core/errors/failure.dart';
import 'package:stock_mate/features/products/domain/entities/product_entity.dart';
import 'package:stock_mate/features/products/domain/repo/product_repository.dart';

class GetProductsUseCase {
  final ProductRepository productRepository;

  const GetProductsUseCase({required this.productRepository});

  Stream<Either<Failure, List<ProductEntity>>> call() {
    return productRepository.getProducts();
  }
}
