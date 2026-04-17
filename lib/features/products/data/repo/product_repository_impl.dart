import 'package:dartz/dartz.dart';
import 'package:stock_mate/core/errors/failure.dart';
import 'package:stock_mate/features/products/data/data_sources/remote/product_remote_datasource/product_remote_datasource.dart';
import 'package:stock_mate/features/products/data/models/product_model.dart';
import 'package:stock_mate/features/products/data/repo/helper/helper.dart';
import 'package:stock_mate/features/products/domain/entities/product_entity.dart';
import 'package:stock_mate/features/products/domain/repo/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDatasource remoteDatasource;

  const ProductRepositoryImpl({required this.remoteDatasource});
  @override
  Future<Either<Failure, void>> addProduct(ProductEntity product) {
    return handleFirebaseFirestoreRequests(
      () => remoteDatasource.addProduct(product as ProductModel),
    );
  }
}
