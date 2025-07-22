import 'package:dartz/dartz.dart';
import 'package:myco_flutter/core/error/failure.dart';
import 'package:myco_flutter/features/asset/domain/entities/all_assets_entity.dart';
import 'package:myco_flutter/features/asset/domain/repositories/all_assets_repository.dart';

class AllAssetsUseCases {
  final AllAssetsRepository repository;

  AllAssetsUseCases({required this.repository});

  Future<Either<Failure, AllAssetsEntity>> getAllAssets(
    Map<String, dynamic> dataMap,
  ) => repository.getAllAssets(dataMap);
}
