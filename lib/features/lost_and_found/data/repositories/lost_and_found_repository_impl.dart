// import 'package:dartz/dartz.dart';
// import 'package:myco_flutter/core/error/failure.dart';
// import 'package:myco_flutter/features/lost_and_found/data/datasources/lost_and_found_data_source.dart';
// import 'package:myco_flutter/features/lost_and_found/data/model/lost_and_found_item_model.dart';
// import 'package:myco_flutter/features/lost_and_found/domain/entities/lost_and_found_entity.dart';
// import 'package:myco_flutter/features/lost_and_found/domain/repositories/lost_and_found_repository.dart';
//
// class LostAndFoundRepositoryImpl implements LostAndFoundRepository {
//   final LostAndFoundDataSource dataSource;
//
//   LostAndFoundRepositoryImpl(this.dataSource);
//
//   @override
//   Future<Either<Failure, List<LostFoundEntity>>> getLostAndFoundItems(
//     Map<String, dynamic> request,
//   ) async {
//     return await safeApiCall<List<LostFoundEntity>>(() async {
//       final model = await dataSource.getLostAndFoundItems(request);
//       return model.lostfound?.map((e) => e.toEntity()).toList() ?? [];
//     });
//   }
// }
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:myco_flutter/core/error/failure.dart';
import 'package:myco_flutter/features/lost_and_found/data/datasources/lost_and_found_data_source.dart';
import 'package:myco_flutter/features/lost_and_found/data/model/lost_and_found_item_model.dart';
import 'package:myco_flutter/features/lost_and_found/domain/entities/lost_and_found_entity.dart';
import 'package:myco_flutter/features/lost_and_found/domain/repositories/lost_and_found_repository.dart';

class LostAndFoundRepositoryImpl implements LostAndFoundRepository {
  final LostAndFoundDataSource dataSource;

  LostAndFoundRepositoryImpl(this.dataSource);

  @override
  Future<Either<Failure, List<LostFoundEntity>>> getLostAndFoundItems(
    Map<String, dynamic> request,
  ) async {
    try {
      final model = await dataSource.getLostAndFoundItems(request);
      final entities = model.lostfound?.map((e) => e.toEntity()).toList() ?? [];
      return Right(entities);
    } on Failure catch (failure) {
      return Left(failure);
    } catch (e) {
      return Left(UnknownFailure(e.toString()));
    }
  }
}
