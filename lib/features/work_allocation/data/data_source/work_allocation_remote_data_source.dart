import 'package:myco_flutter/core/models/data/common_response_model.dart';
import 'package:myco_flutter/features/work_allocation/data/models/request/add_work_allocation_requset.dart';
import 'package:myco_flutter/features/work_allocation/data/models/request/get_assignee_%20details_request.dart';
import 'package:myco_flutter/features/work_allocation/data/models/request/get_work_category_request.dart';
import 'package:myco_flutter/features/work_allocation/data/models/get_work_category_response.dart';
import 'package:myco_flutter/features/work_allocation/data/models/request/hod_approval_request.dart';
import 'package:myco_flutter/features/work_allocation/data/models/request/re_assign_engineer_request.dart';
import 'package:myco_flutter/features/work_allocation/data/models/request/task_approval_request.dart';
import 'package:myco_flutter/features/work_allocation/data/models/request/task_completion_request.dart';
import 'package:myco_flutter/features/work_allocation/data/models/response/get_assignee_details_response.dart';
import 'package:myco_flutter/features/work_allocation/data/models/work_allocation_request.dart';
import 'package:myco_flutter/features/work_allocation/data/models/work_allocation_response.dart';

abstract class WorkAllocationRemoteDataSource {
  Future<WorkAllocationResponseModel> pendingWorkAllocation(
    WorkAllocationRequest request,
  );

  Future<GetWorkCategoryResponseModel> getWorkCategoryList(
      GetWorkCategoryRequest request,
      );

  Future<CommonResponseModel> reAssignEngineer(
      ReAssignEngineerRequest request,
      );

  Future<CommonResponseModel> addWorkAllocation(
      AddWorkAllocationRequest request
      );

  Future<GetAssigneeResponseModel> getAssigneeDetails(
      GetAssigneeDetailsRequest request,
      );

  Future<CommonResponseModel> hodApproval(
      HodApprovalRequest request,
      );

  Future<CommonResponseModel> taskApproval(
      TaskApprovalRequest request,
      );

  Future<CommonResponseModel> taskCompletion(
      TaskCompletionRequest request,
      );
}
