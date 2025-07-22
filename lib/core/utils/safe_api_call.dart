// lib/core/utils/safe_api_call.dart

import 'package:dartz/dartz.dart';
import 'package:myco_flutter/core/error/app_exception.dart';
import 'package:myco_flutter/core/error/failure.dart';
import 'package:myco_flutter/core/network/network_info.dart';
import 'package:dio/dio.dart';

typedef RemoteCall<T> = Future<T> Function();

class SafeApiCall {
  final NetworkInfo networkInfo;

  SafeApiCall(this.networkInfo);

  Future<Either<Failure, T>> execute<T>(RemoteCall<T> call) async {
    // 1. Check for internet connectivity first
    if (!await networkInfo.isConnected) {
      return const Left(NetworkFailure('No Internet Connection. Please check your network and try again.'));
    }

    // 2. Execute the API call in a try-catch block
    try {
      final result = await call();
      return Right(result);
    } on DioException catch (e) {
      // 3. Handle Dio-specific errors
      // Check if the error is our custom AppException from the interceptor
      if (e.error is AppException) {
        final appException = e.error as AppException;
        return Left(ServerFailure(appException.message));
      }
      // Fallback for other Dio errors that might not be caught by the interceptor
      final message = e.response?.data['message'] ?? e.message ?? "An unexpected server error occurred.";
      return Left(ServerFailure(message));
    } catch (e) {
      // 4. Handle any other unexpected errors
      return Left(ServerFailure("An unexpected error occurred: ${e.toString()}"));
    }
  }
}
