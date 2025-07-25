import 'package:dartz/dartz.dart';
import 'package:myco_flutter/core/error/failure.dart';
import 'package:myco_flutter/features/asset/domain/entities/add_asset_entity.dart';
import 'package:myco_flutter/features/asset/domain/entities/all_assets_entity.dart';
import 'package:myco_flutter/features/asset/domain/entities/asset_entity.dart';
import 'package:myco_flutter/features/asset/domain/repositories/asset_repository.dart';

class AssetsUseCases {
  final AssetsRepository repository;

  AssetsUseCases({required this.repository});

  Future<Either<Failure, AssetsEntity>> getAssets(
    Map<String, dynamic> dataMap,
  ) => repository.getAssets(dataMap);
}

class AllAssetsUseCases {
  final AllAssetsRepository repository;

  AllAssetsUseCases({required this.repository});

  Future<Either<Failure, AllAssetsEntity>> getAllAssets(
    Map<String, dynamic> dataMap,
  ) => repository.getAllAssets(dataMap);
}

class AddAssetUseCases {
  final AddAssetRepository repository;

  AddAssetUseCases({required this.repository});

  Future<Either<Failure, AddAssetEntity>> getAllAssets(
    Map<String, dynamic> dataMap,
  ) => repository.getAddAsset(dataMap);
}
