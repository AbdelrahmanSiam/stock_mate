abstract class Failure {
  final String errMessage;

  const Failure({required this.errMessage});
}

class ServerFailure extends Failure{
  const ServerFailure({required super.errMessage});

  factory ServerFailure.fromFirebaseAuth(String code) {
    switch (code) {
      // ── Authentication Errors ──────────────────
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
      
      // ── Registration Errors ────────────────────
      case 'email-already-in-use':
        return const ServerFailure(errMessage: 'Email already registered');
      case 'weak-password':
        return const ServerFailure(errMessage: 'Password is too weak. Use at least 8 characters with uppercase, lowercase, and numbers');
      case 'operation-not-allowed':
        return const ServerFailure(errMessage: 'Email sign-up is currently disabled');
      
      // ── Google Sign-In Errors ──────────────────
      case 'account-exists-with-different-credential':
        return const ServerFailure(errMessage: 'Account exists with different sign-in method');
      case 'invalid-credential':
        return const ServerFailure(errMessage: 'Invalid credentials provided');
      
      // ── Validation Errors ──────────────────────
      case 'missing-email':
        return const ServerFailure(errMessage: 'Email address is required');
      case 'missing-password':
        return const ServerFailure(errMessage: 'Password is required');
      
      // ── Network Errors ────────────────────────
      case 'network-request-failed':
        return const ServerFailure(errMessage: 'Check your internet connection');
      
      // ── Default Fallback ───────────────────────
      default:
        return ServerFailure(errMessage: 'Error: $code. Please try again');
    }
  }
}