import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:stock_mate/core/errors/failure.dart';
import 'package:stock_mate/features/products/data/data_sources/remote/product_image_datasource/product_image_datasource.dart';
import 'package:stock_mate/features/products/data/data_sources/remote/product_remote_datasource/product_remote_datasource.dart';
import 'package:stock_mate/features/products/data/repo/helper/helper.dart';
import 'package:stock_mate/features/products/domain/entities/product_entity.dart';
import 'package:stock_mate/features/products/domain/repo/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDatasource remoteDatasource;
  final ProductImageDataSource productImageDataSource;

  const ProductRepositoryImpl({
    required this.remoteDatasource,
    required this.productImageDataSource,
  });
  @override
  Future<Either<Failure, void>> addProduct(ProductEntity product) {
    return handleFirebaseFirestoreRequests(
      () => remoteDatasource.addProduct(entityToModel(product)),
    );
  }

  @override
  Future<Either<Failure, void>> deleteProduct(String id) {
    return handleFirebaseFirestoreRequests(
      () => remoteDatasource.deleteProduct(id),
    );
  }

  @override
  Future<Either<Failure, void>> deleteProductImage(String imageUrl) async {
    try {
      return Right(await productImageDataSource.deleteImage(imageUrl));
    } catch (e) {
      return Left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> updateProduct(ProductEntity product) {
    return handleFirebaseFirestoreRequests(
      () => remoteDatasource.updateProduct(entityToModel(product)),
    );
  }

  @override
  Future<Either<Failure, String>> uploadProductImage(File image) async {
    try {
      return Right(await productImageDataSource.uploadImage(image));
    } catch (e) {
      return Left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Stream<Either<Failure, List<ProductEntity>>> getProducts() {
    return remoteDatasource
        .getProducts()
        .map((products) => Right<Failure, List<ProductEntity>>(products))
        .handleError(
          (error) => Left<Failure, List<ProductEntity>>(
            ServerFailure(errMessage: error.toString()),
          ),
        );
  }
}
