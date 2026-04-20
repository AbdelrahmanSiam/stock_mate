import 'package:firebase_auth/firebase_auth.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class Failure {
  final String errMessage;
  const Failure({required this.errMessage});
}

class ServerFailure extends Failure {
  const ServerFailure({required super.errMessage});

  // ── Firebase Auth ─────────────────────────────────────
  factory ServerFailure.fromFirebaseAuth(FirebaseAuthException e) {
    switch (e.code) {
      case 'user-not-found':
        return const ServerFailure(errMessage: 'No account with this email');
      case 'wrong-password':
        return const ServerFailure(errMessage: 'Incorrect password');
      case 'invalid-email':
        return const ServerFailure(errMessage: 'Email format invalid');
      case 'user-disabled':
        return const ServerFailure(errMessage: 'This account has been disabled');
      case 'too-many-requests':
        return const ServerFailure(errMessage: 'Too many attempts, try later');
      case 'email-already-in-use':
        return const ServerFailure(errMessage: 'Email already registered');
      case 'weak-password':
        return const ServerFailure(
          errMessage: 'Password too weak. Use 8+ chars with uppercase & numbers',
        );
      case 'operation-not-allowed':
        return const ServerFailure(errMessage: 'Email sign-up is currently disabled');
      case 'account-exists-with-different-credential':
        return const ServerFailure(errMessage: 'Account exists with different sign-in method');
      case 'invalid-credential':
        return const ServerFailure(errMessage: 'Invalid credentials provided');
      case 'google-sign-in-cancelled':
        return const ServerFailure(errMessage: 'Google sign in cancelled');
      case 'missing-email':
        return const ServerFailure(errMessage: 'Email address is required');
      case 'missing-password':
        return const ServerFailure(errMessage: 'Password is required');
      case 'network-request-failed':
        return const ServerFailure(errMessage: 'Check your internet connection');
      default:
        return ServerFailure(
          errMessage: 'Error: ${e.message ?? e.code}. Please try again',
        );
    }
  }

  // ── Firestore ─────────────────────────────────────────
  factory ServerFailure.fromFirebaseFirestore(FirebaseException e) {
    switch (e.code) {
      case 'permission-denied':
        return const ServerFailure(errMessage: 'You do not have permission');
      case 'not-found':
        return const ServerFailure(errMessage: 'Requested data was not found');
      case 'already-exists':
        return const ServerFailure(errMessage: 'Data already exists');
      case 'unavailable':
        return const ServerFailure(errMessage: 'Service unavailable, check your connection');
      case 'deadline-exceeded':
        return const ServerFailure(errMessage: 'Request timed out, please try again');
      case 'invalid-argument':
        return const ServerFailure(errMessage: 'Invalid data provided');
      case 'resource-exhausted':
        return const ServerFailure(errMessage: 'Too many requests, please wait');
      case 'cancelled':
        return const ServerFailure(errMessage: 'Operation was cancelled');
      case 'data-loss':
        return const ServerFailure(errMessage: 'Data loss detected, please retry');
      default:
        return ServerFailure(
          errMessage: e.message ?? 'Unexpected Firestore error',
        );
    }
  }

  // ── Supabase Storage ──────────────────────────────────
  factory ServerFailure.fromSupabase(StorageException e) {
    switch (e.statusCode) {
      case '400':
        return const ServerFailure(errMessage: 'Invalid file or request');
      case '401':
        return const ServerFailure(errMessage: 'Unauthorized storage access');
      case '403':
        return const ServerFailure(errMessage: 'Storage access denied');
      case '404':
        return const ServerFailure(errMessage: 'File not found in storage');
      case '413':
        return const ServerFailure(errMessage: 'File too large to upload');
      case '500':
        return const ServerFailure(errMessage: 'Storage server error, try again');
      default:
        return ServerFailure(
          errMessage: e.message ?? 'Unexpected storage error',
        );
    }
  }

  // ── General Catch-all ─────────────────────────────────

  factory ServerFailure.fromException(Object e) {
    if (e is FirebaseAuthException) {
      return ServerFailure.fromFirebaseAuth(e);
    }
    if (e is FirebaseException) {
      return ServerFailure.fromFirebaseFirestore(e);
    }
    if (e is StorageException) {
      return ServerFailure.fromSupabase(e);
    }
    return ServerFailure(errMessage: e.toString());
  }
}