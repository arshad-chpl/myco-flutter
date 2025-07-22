// import 'package:dartz/dartz.dart';
// import 'package:myco_flutter/core/error/failure.dart';
// import 'package:myco_flutter/core/utils/safe_api_call.dart';
// import 'package:myco_flutter/features/lost_and_found/data/datasources/lost_and_found_data_source.dart';
// import 'package:myco_flutter/features/lost_and_found/data/model/lost_and_found_item_model.dart';
// import 'package:myco_flutter/features/lost_and_found/domain/entities/lost_and_found_entity.dart';
// import 'package:myco_flutter/features/lost_and_found/domain/repositories/lost_and_found_repository.dart';
//
// class LostAndFoundRepositoryImpl implements LostAndFoundRepository {
//   final LostAndFoundDataSource dataSource;
//   final SafeApiCall safeApiCall;
//
//   LostAndFoundRepositoryImpl(this.dataSource, this.safeApiCall);
//
//   @override
//   Future<Either<Failure, LostFoundEntity>> getLostAndFoundItems(
//     // Map<String, dynamic> request,
//   ) async => safeApiCall.execute(() async {
//     final responseModel = await dataSource.getLostAndFoundItems();
//
//     return responseModel.toEntity();
//   });
//
//   //   await safeApiCall.execute<List<LostFoundEntity>>(() async {
//   // final model = await dataSource.getLostAndFoundItems();
//   // return model.lostfound?.map((e) => e.toEntity()).toList() ?? [];
//   // });
// }
import 'package:dartz/dartz.dart';
import 'package:myco_flutter/core/error/failure.dart';
import 'package:myco_flutter/core/utils/safe_api_call.dart';
import 'package:myco_flutter/features/lost_and_found/data/datasources/lost_and_found_data_source.dart';
import 'package:myco_flutter/features/lost_and_found/domain/entities/lost_and_found_entity.dart';
import 'package:myco_flutter/features/lost_and_found/domain/repositories/lost_and_found_repository.dart';

class LostAndFoundRepositoryImpl implements LostAndFoundRepository {
  final LostAndFoundDataSource dataSource;
  final SafeApiCall safeApiCall;

  LostAndFoundRepositoryImpl(this.dataSource, this.safeApiCall);

  @override
  Future<Either<Failure, List<LostFoundEntity>>> getLostAndFoundItems() async =>
      await safeApiCall.execute(() async {
        final responseModel = await dataSource.getLostAndFoundItems();

        return responseModel.lostfound
                ?.map((item) => item.toEntity())
                .toList() ??
            [];
      });
}
