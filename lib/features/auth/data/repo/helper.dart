import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:stock_mate/core/errors/failure.dart';

Future<Either<Failure, T>> handleRequest<T>(
  Future<T> Function() request,
) async {
  try {
    final result = await request();
    return Right(result);
  } on FirebaseAuthException catch (e) {
    return Left(ServerFailure.fromFirebaseAuth(e.code));
  } catch (e) {
    return Left(ServerFailure(errMessage: e.toString()));
  }
}
