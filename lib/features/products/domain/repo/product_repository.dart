import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:stock_mate/core/errors/failure.dart';
import 'package:stock_mate/features/products/domain/entities/product_entity.dart';

abstract class ProductRepository {
  Stream<Either<Failure, List<ProductEntity>>> getProducts();
  Future<Either<Failure, void>> addProduct(ProductEntity product);
  Future<Either<Failure, void>> updateProduct(ProductEntity product);
  Future<Either<Failure, void>> deleteProduct(String id);
  Future<Either<Failure, String>> uploadProductImage(File image);
  Future<Either<Failure, void>> deleteProductImage(String imageUrl);
}
