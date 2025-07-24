import 'package:dartz/dartz.dart';
import 'package:myco_flutter/core/error/failure.dart';
import 'package:myco_flutter/core/network/network_info.dart';
import 'package:myco_flutter/features/admin_view/data/data_source/admin_view_local_data_source.dart';
import 'package:myco_flutter/features/admin_view/data/data_source/admin_view_remote_data_source.dart';
import 'package:myco_flutter/features/admin_view/data/models/admin_view_request.dart';
import 'package:myco_flutter/features/admin_view/domain/entities/admin_view_entity.dart';
import 'package:myco_flutter/features/admin_view/domain/repositories/admin_view_repository.dart';

class AdminViewRepositoryImpl extends AdminViewRepository {
  final AdminViewRemoteDataSource remoteDataSource;
  final AdminViewLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  AdminViewRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, AdminViewResponseEntity>> getAdminView(
    AdminViewRequest request,
  ) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteModel = await remoteDataSource.getAdminViewNew(request);
        if (request.shouldCache && request.companyId != null) {
          await localDataSource.cacheAdminView(request.companyId!, remoteModel);
        }
        return Right(remoteModel.toEntity());
      } on Exception catch (e) {
        return Left(ServerFailure(e.toString()));
      }
    } else {
      return getCachedAdminView(request.companyId ?? '');
    }
  }

  @override
  Future<Either<Failure, AdminViewResponseEntity>> getCachedAdminView(
    String companyId,
  ) async {
    try {
      final localModel = await localDataSource.getLastAdminView(companyId);
      return Right(localModel.toEntity());
    } on CacheException {
      // Catch the specific CacheException from the local data source.
      return const Left(CacheFailure('No cached data found.'));
    }
  }
}
