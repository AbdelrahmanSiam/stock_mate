import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:stock_mate/core/errors/failure.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<Either<Failure, T>> handleSettingsRepository<T>(
  Future<T> Function() fn,
) async {
  try {
    return Right(await fn());
  } on FirebaseException catch (e) {
    return Left(ServerFailure.fromFirebaseFirestore(e));
  } on StorageException catch (e) {
    return Left(ServerFailure.fromSupabase(e));
  } catch (e) {
    return Left(ServerFailure.fromException(e));
  }
}
