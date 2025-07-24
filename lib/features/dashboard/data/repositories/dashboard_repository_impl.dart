import 'package:dartz/dartz.dart';
import 'package:myco_flutter/core/error/failure.dart';
import 'package:myco_flutter/core/network/network_info.dart';
import 'package:myco_flutter/features/dashboard/data/datasources/dashboard_local_data_source.dart';
import 'package:myco_flutter/features/dashboard/data/datasources/dashboard_remote_data_source.dart';
import 'package:myco_flutter/features/dashboard/domain/entites/home_menu_response_entity.dart';
import 'package:myco_flutter/features/dashboard/domain/entites/id_card_entity.dart';
import 'package:myco_flutter/features/dashboard/domain/entites/my_unit_response_entity.dart';
import 'package:myco_flutter/features/dashboard/domain/repositories/dashboard_repository.dart';

class DashboardRepositoryImpl implements DashboardRepository {
  final DashboardRemoteDataSource remoteDataSource;
  final DashboardLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  DashboardRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, IdCardEntity>> getIDCardDetails(
    Map<String, dynamic> dataMap,
  ) async {
    // 1. Get the result from the data source, which is already an Either.
    final result = await remoteDataSource.getIDCardDetails(dataMap);

    // 2. Use .map() to transform the Right side (the model) into an entity.
    // This correctly handles the Either type.
    return result.fold(
      (failure) => Left(failure),
      (idCardData) => Right(idCardData.toEntity()),
    );
  }

  @override
  Future<Either<Failure, HomeMenuResponseEntity>> getAppMenuGridWithCategory(
    Map<String, dynamic> dataMap,
  ) async {
    bool isConnected = await networkInfo.isConnected;
    if (isConnected) {
      // If online, fetch from the remote source.
      final remoteResult = await remoteDataSource.getAppMenuGridWithCategory(
        dataMap,
      );

      // Use .fold() to handle both success (Right) and failure (Left) cases.
      return remoteResult.fold(
        (failure) {
          // If the remote call fails, return the failure.
          // (A more advanced implementation could try the cache here as a fallback)
          return Left(failure);
        },
        (menuModel) {
          // If the remote call succeeds, cache the data...
          localDataSource.cacheHomeMenu(menuModel);
          // ...and return the mapped entity.
          return Right(menuModel.toEntity());
        },
      );
    } else {
      // If offline, try to get data from the local cache.
      final localMenu = await localDataSource.getHomeMenu();
      if (localMenu != null) {
        return Right(localMenu.toEntity());
      } else {
        // If there's no internet and no cache, return a network failure.
        return Left(
          NetworkFailure('No Internet Connection and no cache available.'),
        );
      }
    }
  }

  @override
  Future<Either<Failure, MyUnitResponseEntity>> getMyUnits(Map<String, dynamic> dataMap) async{
    bool isConnected = await networkInfo.isConnected;
    if (isConnected) {
      // If online, fetch from the remote source.
      final remoteResult = await remoteDataSource.getMyUnits(
        dataMap,
      );

      // Use .fold() to handle both success (Right) and failure (Left) cases.
      return remoteResult.fold(
        (failure) {
          // If the remote call fails, return the failure.
          // (A more advanced implementation could try the cache here as a fallback)
          return Left(failure);
        },
        (menuModel) {
          // If the remote call succeeds, cache the data...
          localDataSource.cacheMyUnits(menuModel);
          // ...and return the mapped entity.
          return Right(menuModel.toEntity());
        },
      );
    } else {
      // If offline, try to get data from the local cache.
      final localMenu = await localDataSource.getMyUnits();
      if (localMenu != null) {
        return Right(localMenu.toEntity());
      } else {
        // If there's no internet and no cache, return a network failure.
        return Left(
          NetworkFailure('No Internet Connection and no cache available.'),
        );
      }
    }
  }
}
