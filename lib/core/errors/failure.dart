abstract class Failure {
  final String message;

  const Failure(this.message);
}

class NetworkFailure extends Failure {
  NetworkFailure(super.message);
}
