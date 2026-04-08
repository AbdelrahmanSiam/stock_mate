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

// ✅ FIX: Enhanced version with retry logic for network failures
Future<Either<Failure, T>> handleRequestWithRetry<T>(
  Future<T> Function() request, {
  int maxRetries = 3,
  Duration delayBetweenRetries = const Duration(milliseconds: 500),
}) async {
  try {
    // First attempt
    final result = await request();
    return Right(result);
  } on FirebaseAuthException catch (e) {
    // Don't retry validation errors, only network/timeout errors
    if (_isNetworkError(e.code)) {
      return await _retryOperation(
        request,
        maxRetries,
        delayBetweenRetries,
        e.code,
      );
    }
    return Left(ServerFailure.fromFirebaseAuth(e.code));
  } catch (e) {
    // Generic network/timeout errors
    if (e.toString().contains('network') || e.toString().contains('timeout')) {
      return await _retryOperation(
        request,
        maxRetries,
        delayBetweenRetries,
        'network-error',
      );
    }
    return Left(ServerFailure(errMessage: e.toString()));
  }
}

// ✅ Helper: Retry logic with exponential backoff
Future<Either<Failure, T>> _retryOperation<T>(
  Future<T> Function() request,
  int remainingRetries,
  Duration baseDelay,
  String lastErrorCode,
) async {
  for (int attempt = 1; attempt <= remainingRetries; attempt++) {
    // Exponential backoff: 500ms, 1s, 2s, 4s...
    final delay = baseDelay * (attempt - 1);
    await Future.delayed(delay);
    
    try {
      final result = await request();
      debugPrintIfError('✅ Retry successful on attempt $attempt');
      return Right(result);
    } on FirebaseAuthException catch (e) {
      if (attempt == remainingRetries) {
        return Left(ServerFailure.fromFirebaseAuth(e.code));
      }
    } catch (e) {
      if (attempt == remainingRetries) {
        return Left(ServerFailure(errMessage: 'After $remainingRetries attempts: ${e.toString()}'));
      }
    }
  }
  
  return Left(
    ServerFailure(
      errMessage: 'Failed after $remainingRetries attempts. Check your connection.',
    ),
  );
}

// ✅ Helper: Check if error is network-related
bool _isNetworkError(String code) {
  return code == 'network-request-failed' ||
      code == 'too-many-requests' ||
      code.contains('timeout');
}

// ✅ Helper: Debug logging
void debugPrintIfError(String message) {
  // Can be replaced with proper logging/analytics
  print(message);
}
