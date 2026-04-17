import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:stock_mate/core/errors/failure.dart';
import 'package:stock_mate/features/products/data/models/product_model.dart';
import 'package:stock_mate/features/products/domain/entities/product_entity.dart';

Future<Either<Failure, T>> handleFirebaseFirestoreRequests<T>(
  Future<T> Function() request,
) async {
  try {
    final result = await request();
    return Right(result);
  } on FirebaseException catch (e) {
    return Left(ServerFailure.fromFirebaseFirestore(e));
  } catch (e) {
    return Left(ServerFailure(errMessage: e.toString()));
  }
}
ProductModel entityToModel(ProductEntity entity) {
  return ProductModel(
    id:        entity.id,
    name:      entity.name,
    barcode:   entity.barcode,
    category:  entity.category,
    buyPrice:  entity.buyPrice,
    sellPrice: entity.sellPrice,
    quantity:  entity.quantity,
    threshold: entity.threshold,
    imageUrl:  entity.imageUrl,
  );
}