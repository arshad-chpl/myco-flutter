import 'package:dartz/dartz.dart';
import 'package:myco_flutter/core/error/failure.dart';
import 'package:myco_flutter/core/models/domain/common_response_entity.dart';
import 'package:myco_flutter/features/work_allocation/data/models/request/add_work_allocation_requset.dart';
import 'package:myco_flutter/features/work_allocation/data/models/request/get_assignee_details_request.dart';
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

/// A single use case class to handle all business logic for the Work Allocation feature.
/// This acts as a facade over the WorkAllocationRepository.
class WorkAllocationUseCase {
  final WorkAllocationRepository repository;

  WorkAllocationUseCase({required this.repository});

  /// Executes the logic to fetch pending work allocations.
  Future<Either<Failure, WorkAllocationResponseEntity>> getPendingWorkAllocations(
      WorkAllocationRequest params,
      ) async => await repository.pendingWorkAllocation(params);

  /// Executes the logic to fetch the list of work categories.
  Future<Either<Failure, GetWorkCategoryResponseEntity>> getWorkCategoryList(
      GetWorkCategoryRequest params,
      ) async => await repository.getWorkCategoryList(params);

  /// Executes the logic to re-assign an engineer to a task.
  Future<Either<Failure, CommonResponseModelEntity>> reAssignEngineer(
      ReAssignEngineerRequest params,
      ) async => await repository.reAssignEngineer(params);

  /// Executes the logic to add a new work allocation.
  Future<Either<Failure, CommonResponseModelEntity>> addWorkAllocation(
      AddWorkAllocationRequest params,
      ) async => await repository.addWorkAllocation(params);

  /// Executes the logic to fetch details of an assignee.
  Future<Either<Failure, GetAssigneeResponseEntity>> getAssigneeDetails(
      GetAssigneeDetailsRequest params,
      ) async => await repository.getAssigneeDetails(params);

  /// Executes the logic for HOD approval of a task.
  Future<Either<Failure, CommonResponseModelEntity>> approveByHod(
      HodApprovalRequest params,
      ) async => await repository.hodApproval(params);

  /// Executes the logic for general task approval.
  Future<Either<Failure, CommonResponseModelEntity>> approveTask(
      TaskApprovalRequest params,
      ) async => await repository.taskApproval(params);

  /// Executes the logic for marking a task as complete.
  Future<Either<Failure, CommonResponseModelEntity>> completeTask(
      TaskCompletionRequest params,
      ) async => await repository.taskCompletion(params);
}