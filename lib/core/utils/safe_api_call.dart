import 'package:dartz/dartz.dart';
import '../error/failure.dart';
import '../network/network_info.dart';
import 'package:dio/dio.dart';

typedef RemoteCall<T> = Future<T> Function();

class SafeApiCall {
  final NetworkInfo networkInfo;

  SafeApiCall(this.networkInfo);

  Future<Either<Failure, T>> execute<T>(RemoteCall<T> call) async {
    if (!await networkInfo.isConnected) {
      return const Left(NetworkFailure());
    }

    try {
      final result = await call();
      return Right(result);
    } on DioException catch (e) { 
      final message = e.response?.data['message'] ?? e.message ?? "Server error";
      return Left(ServerFailure(message));
    } catch (e) {
      return Left(ServerFailure("Unexpected error"));
    }
  }
}
