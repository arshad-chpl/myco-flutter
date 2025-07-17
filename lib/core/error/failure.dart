abstract class Failure {
  final String message;
  const Failure(this.message);
}

class ServerFailure extends Failure {
  const ServerFailure(super.message);
}

class NetworkFailure extends Failure {
  const NetworkFailure() : super("No internet connection");
}

class TimeoutFailure extends Failure {
  const TimeoutFailure() : super("Request timed out. Try again.");
}

class UnauthorizedFailure extends Failure {
  const UnauthorizedFailure()
    : super("Unauthorized request. Please login again.");
}

class ForbiddenFailure extends Failure {
  const ForbiddenFailure() : super("You don't have permission to access this.");
}

class NotFoundFailure extends Failure {
  const NotFoundFailure() : super("Requested resource not found.");
}

class ConflictFailure extends Failure {
  const ConflictFailure() : super("Request conflict occurred.");
}

class CancelledFailure extends Failure {
  const CancelledFailure() : super("Request was cancelled.");
}

class UnknownFailure extends Failure {
  const UnknownFailure([String message = "Unknown error occurred"])
    : super(message);
}

class ValidationFailure extends Failure {
  const ValidationFailure(String message) : super(message);
}

class CacheFailure extends Failure {
  const CacheFailure(super.message);
}
