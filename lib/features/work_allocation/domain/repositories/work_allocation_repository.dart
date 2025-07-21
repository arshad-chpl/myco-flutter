import 'package:dartz/dartz.dart';
import 'package:myco_flutter/core/error/failure.dart';
import 'package:myco_flutter/core/models/domain/common_response_entity.dart';
import 'package:myco_flutter/features/work_allocation/data/models/request/add_work_allocation_requset.dart';
import 'package:myco_flutter/features/work_allocation/data/models/request/get_assignee_%20details_request.dart';
import 'package:myco_flutter/features/work_allocation/data/models/request/get_work_category_request.dart';
import 'package:myco_flutter/features/work_allocation/data/models/request/hod_approval_request.dart';
import 'package:myco_flutter/features/work_allocation/data/models/request/re_assign_engineer_request.dart';
import 'package:myco_flutter/features/work_allocation/data/models/request/task_approval_request.dart';
import 'package:myco_flutter/features/work_allocation/data/models/request/task_completion_request.dart';
import 'package:myco_flutter/features/work_allocation/data/models/work_allocation_request.dart';
import 'package:myco_flutter/features/work_allocation/domain/entities/get_assignee_entity.dart';
import 'package:myco_flutter/features/work_allocation/domain/entities/get_work_category_entity.dart';
import 'package:myco_flutter/features/work_allocation/domain/entities/hod_approval_entity.dart';
import 'package:myco_flutter/features/work_allocation/domain/entities/re_assign_engineer_entity.dart';
import 'package:myco_flutter/features/work_allocation/domain/entities/work_allocation_entity.dart';

abstract class WorkAllocationRepository {
  Future<Either<Failure, WorkAllocationResponseEntity>> pendingWorkAllocation(
    WorkAllocationRequest request,
  );

  Future<Either<Failure, GetWorkCategoryResponseEntity>> getWorkCategoryList(
      GetWorkCategoryRequest request,
      );

  Future<Either<Failure, CommonResponseModelEntity>> reAssignEngineer(
      ReAssignEngineerRequest request,
      );

  Future<Either<Failure, CommonResponseModelEntity>> addWorkAllocation(
      AddWorkAllocationRequest request,
      );

  Future<Either<Failure, GetAssigneeResponseEntity>> getAssigneeDetails(
      GetAssigneeDetailsRequest request,
      );

  Future<Either<Failure, CommonResponseModelEntity>> hodApproval(
      HodApprovalRequest request,
      );

  Future<Either<Failure, CommonResponseModelEntity>> taskApproval(
      TaskApprovalRequest request,
      );

  Future<Either<Failure, CommonResponseModelEntity>> taskCompletion(
      TaskCompletionRequest request,
      );
}
