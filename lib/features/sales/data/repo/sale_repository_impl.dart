import 'package:dartz/dartz.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:stock_mate/core/errors/failure.dart';
import 'package:stock_mate/features/sales/data/data_source/remote/sale_remote_datasource/sale_remote_datasource.dart';
import 'package:stock_mate/features/sales/data/models/invoice_item_model.dart';
import 'package:stock_mate/features/sales/data/repo/helper.dart';
import 'package:stock_mate/features/sales/domain/entities/invoice_item_entity.dart';
import 'package:stock_mate/features/sales/domain/entities/sale_entity.dart';
import 'package:stock_mate/features/sales/domain/entities/sale_filter.dart';
import 'package:stock_mate/features/sales/domain/repo/sale_repository.dart';

class SaleRepositoryImpl implements SaleRepository {
  final SaleRemoteDataSource remoteDataSource;

  SaleRepositoryImpl(this.remoteDataSource);
  @override
  Future<Either<Failure, SaleEntity>> createSale({
    required List<InvoiceItemEntity> items,
    required String paymentMethod,
  }) async {
    try {
      final List<InvoiceItemModel> itemModels = items
          .map((item) => itemEntityToItemModel(item))
          .toList();

      final result = await remoteDataSource.createSale(
        items: itemModels,
        paymentMethod: paymentMethod,
      );

      return Right(result);
    } on FirebaseException catch (e) {
      return Left(ServerFailure.fromFirebaseFirestore(e));
    } catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }

  @override
  Stream<Either<Failure, List<SaleEntity>>> getRecentSales({
    required SaleFilter filter,
  }) {
    return remoteDataSource
        .getRecentSales(filter: filter)
        .map((sales) => Right<Failure, List<SaleEntity>>(sales))
        .handleError(
          (error) => Left<Failure, List<SaleEntity>>(
            error is FirebaseException
                ? ServerFailure.fromFirebaseFirestore(error)
                : ServerFailure(errMessage: error.toString()),
          ),
        );
  }

  @override
  Future<Either<Failure, SaleEntity>> getSaleById({
    required String saleId,
  }) async {
    try {
      final result = await remoteDataSource.getSaleById(saleId: saleId);
      return Right(result);
    } on FirebaseException catch (e) {
      return Left(ServerFailure.fromFirebaseFirestore(e));
    } catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }
}
