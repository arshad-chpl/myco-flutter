import 'package:dartz/dartz.dart';
import 'package:myco_flutter/core/error/failure.dart';
import 'package:myco_flutter/features/asset/domain/entities/all_assets_entity.dart';
import 'package:myco_flutter/features/asset/domain/entities/asset_entity.dart';

abstract class AssetsRepository {
  /// Retrieves asset data.
  ///
  /// Returns [Either<Failure, AssetsEntity>] on success/failure.
  Future<Either<Failure, AssetsEntity>> getAssets(Map<String, dynamic> dataMap);
}



abstract class AllAssetsRepository {
  /// Retrieves all assets data including categories, brands, and assets list.
  ///
  /// Returns [Either<Failure, AllAssetsEntity>] on success/failure.
  Future<Either<Failure, AllAssetsEntity>> getAllAssets(Map<String, dynamic> dataMap);
}