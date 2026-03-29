abstract class Failure {
  final String errMessage;

  const Failure({required this.errMessage});
}
class ServerFailure extends Failure{
  const ServerFailure({required super.errMessage});

  factory ServerFailure.fromFirebaseAuth(String code) {
    switch (code) {
      case 'user-not-found':
        return const ServerFailure(errMessage: 'No account with this email');
      case 'wrong-password':
        return const ServerFailure(errMessage: 'Incorrect password');
      case 'invalid-email':
        return const ServerFailure(errMessage: 'Email format invalid');
      case 'too-many-requests':
        return const ServerFailure(errMessage: 'Too many attempts, try later');
      case 'network-request-failed':
        return const ServerFailure(errMessage: 'Check your connection');
      default:
        return const ServerFailure(errMessage: 'Something went wrong');
    }
  }
}