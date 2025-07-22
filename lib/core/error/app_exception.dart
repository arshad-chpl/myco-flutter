class AppException implements Exception {
  final String message;
  final int? statusCode;

  AppException({required this.message, this.statusCode});

  @override
  String toString() {
    return 'StatusCode: $statusCode, Message: $message';
  }
}
