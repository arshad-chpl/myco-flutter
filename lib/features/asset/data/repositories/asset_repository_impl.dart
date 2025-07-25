import 'package:dartz/dartz.dart';
import 'package:myco_flutter/core/error/failure.dart';
import 'package:myco_flutter/core/utils/safe_api_call.dart';
import 'package:myco_flutter/features/asset/data/datasource/asset_data_source.dart';
import 'package:myco_flutter/features/asset/data/models/add_asset_model.dart';
import 'package:myco_flutter/features/asset/data/models/all_assets_model.dart';
import 'package:myco_flutter/features/asset/data/models/asset_model.dart';
import 'package:myco_flutter/features/asset/domain/entities/add_asset_entity.dart';
import 'package:myco_flutter/features/asset/domain/entities/all_assets_entity.dart';
import 'package:myco_flutter/features/asset/domain/entities/asset_entity.dart';
import 'package:myco_flutter/features/asset/domain/repositories/asset_repository.dart';

class AssetsRepositoryImpl extends AssetsRepository {
  final AssetsRemoteDataSource remoteDataSource;
  final SafeApiCall safeApiCall;

  AssetsRepositoryImpl(this.safeApiCall, {required this.remoteDataSource});

  @override
  Future<Either<Failure, AssetsEntity>> getAssets(
    Map<String, dynamic> dataMap,
  ) async {
    final result = await safeApiCall.execute(
      () => remoteDataSource.getAssets(dataMap),
    );
    return result.map((model) => model.toEntity());
  }
}



class AllAssetsRepositoryImpl extends AllAssetsRepository {
  final AllAssetsRemoteDataSource remoteDataSource;
  final SafeApiCall safeApiCall;

  AllAssetsRepositoryImpl(this.safeApiCall, {required this.remoteDataSource});

  @override
  Future<Either<Failure, AllAssetsEntity>> getAllAssets(
    Map<String, dynamic> dataMap,
  ) async {
    final result = await safeApiCall.execute(
      () => remoteDataSource.getAllAssets(dataMap),
    );
    return result.map((model) => model.toEntity());
  }
}


class AddAssetRepositoryImpl extends AddAssetRepository {
  final AddAssetDataSource remoteDataSource;
  final SafeApiCall safeApiCall;

  AddAssetRepositoryImpl(this.safeApiCall, {required this.remoteDataSource});

  @override
  Future<Either<Failure, AddAssetEntity>> getAddAsset(
    Map<String, dynamic> dataMap,
  ) async {
    final result = await safeApiCall.execute(
      () => remoteDataSource.getAddAsset(dataMap),
    );
    return result.map((model) => model.toEntity());
  }
}
