import 'package:dartz/dartz.dart';
import 'package:myco_flutter/core/error/failure.dart';
import 'package:myco_flutter/core/utils/safe_api_call.dart';
import 'package:myco_flutter/features/work_allocation/data/data_source/work_allocation_remote_data_source.dart';
import 'package:myco_flutter/features/work_allocation/data/models/get_work_category_request.dart';
import 'package:myco_flutter/features/work_allocation/data/models/work_allocation_request.dart';
import 'package:myco_flutter/features/work_allocation/domain/entities/get_work_category_entity.dart';
import 'package:myco_flutter/features/work_allocation/domain/entities/work_allocation_entity.dart';
import 'package:myco_flutter/features/work_allocation/domain/repositories/work_allocation_repository.dart';

class WorkAllocationRepositoryImpl extends WorkAllocationRepository {
  final WorkAllocationRemoteDataSource remoteDataSource;
  final SafeApiCall safeApiCall;

  WorkAllocationRepositoryImpl(this.safeApiCall, this.remoteDataSource);

  @override
  Future<Either<Failure, WorkAllocationResponseEntity>> pendingWorkAllocation(
    WorkAllocationRequest request,
  ) async => safeApiCall.execute(() async {
    final responseModel = await remoteDataSource.pendingWorkAllocation(request);
    return responseModel.toEntity();
  });

  @override
  Future<Either<Failure, GetWorkCategoryResponseEntity>> getWorkCategoryList(
      GetWorkCategoryRequest request
  ) async => safeApiCall.execute(() async {
    final responseModel = await remoteDataSource.getWorkCategoryList(request);
    return responseModel.toEntity();
  });
}
