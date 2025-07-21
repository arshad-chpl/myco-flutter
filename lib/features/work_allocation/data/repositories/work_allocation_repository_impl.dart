import 'package:dartz/dartz.dart';
import 'package:myco_flutter/core/error/failure.dart';
import 'package:myco_flutter/core/models/domain/common_response_entity.dart';
import 'package:myco_flutter/core/utils/safe_api_call.dart';
import 'package:myco_flutter/features/work_allocation/data/data_source/work_allocation_remote_data_source.dart';
import 'package:myco_flutter/features/work_allocation/data/models/request/add_work_allocation_requset.dart';
import 'package:myco_flutter/features/work_allocation/data/models/request/get_assignee_%20details_request.dart';
import 'package:myco_flutter/features/work_allocation/data/models/request/get_work_category_request.dart';
import 'package:myco_flutter/features/work_allocation/data/models/request/hod_approval_request.dart';
import 'package:myco_flutter/features/work_allocation/data/models/request/re_assign_engineer_request.dart';
import 'package:myco_flutter/features/work_allocation/data/models/request/task_approval_request.dart';
import 'package:myco_flutter/features/work_allocation/data/models/request/task_completion_request.dart';
import 'package:myco_flutter/features/work_allocation/data/models/request/work_allocation_request.dart';
import 'package:myco_flutter/features/work_allocation/domain/entities/get_assignee_entity.dart';
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
    GetWorkCategoryRequest request,
  ) async => safeApiCall.execute(() async {
    final responseModel = await remoteDataSource.getWorkCategoryList(request);
    return responseModel.toEntity();
  });

  @override
  Future<Either<Failure, CommonResponseModelEntity>> reAssignEngineer(
    ReAssignEngineerRequest request,
  ) async => safeApiCall.execute(() async {
    final responseModel = await remoteDataSource.reAssignEngineer(request);
    return responseModel.toEntity();
  });

  @override
  Future<Either<Failure, CommonResponseModelEntity>> addWorkAllocation(
    AddWorkAllocationRequest request,
  ) async => safeApiCall.execute(() async {
    final responseModel = await remoteDataSource.addWorkAllocation(request);
    return responseModel.toEntity();
  });

  @override
  Future<Either<Failure, GetAssigneeResponseEntity>> getAssigneeDetails(
    GetAssigneeDetailsRequest request,
  ) async => safeApiCall.execute(() async {
    final responseModel = await remoteDataSource.getAssigneeDetails(request);
    return responseModel.toEntity();
  });

  @override
  Future<Either<Failure, CommonResponseModelEntity>> hodApproval(
    HodApprovalRequest request,
  ) async => safeApiCall.execute(() async {
    final responseModel = await remoteDataSource.hodApproval(request);
    return responseModel.toEntity();
  });

  @override
  Future<Either<Failure, CommonResponseModelEntity>> taskApproval(
    TaskApprovalRequest request,
  ) async => safeApiCall.execute(() async {
    final responseModel = await remoteDataSource.taskApproval(request);
    return responseModel.toEntity();
  });

  @override
  Future<Either<Failure, CommonResponseModelEntity>> taskCompletion(
    TaskCompletionRequest request,
  ) async => safeApiCall.execute(() async {
    final responseModel = await remoteDataSource.taskCompletion(request);
    return responseModel.toEntity();
  });
}
