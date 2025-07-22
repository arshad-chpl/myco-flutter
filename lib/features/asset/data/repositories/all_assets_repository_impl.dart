import 'package:dartz/dartz.dart';
import 'package:myco_flutter/core/error/failure.dart';
import 'package:myco_flutter/core/utils/safe_api_call.dart';
import 'package:myco_flutter/features/asset/data/datasource/allasset/all_asset_data_source.dart';
import 'package:myco_flutter/features/asset/data/models/all_assets_model.dart';
import 'package:myco_flutter/features/asset/domain/entities/all_assets_entity.dart';
import 'package:myco_flutter/features/asset/domain/repositories/all_assets_repository.dart';

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
