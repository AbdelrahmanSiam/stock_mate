import 'package:dartz/dartz.dart';
import 'package:stock_mate/core/errors/failure.dart';
import 'package:stock_mate/features/products/domain/entities/product_entity.dart';

abstract class ProductRepository {
  Future<Either<Failure , void>> addProduct(ProductEntity product);
}