import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:stock_mate/core/errors/failure.dart';

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