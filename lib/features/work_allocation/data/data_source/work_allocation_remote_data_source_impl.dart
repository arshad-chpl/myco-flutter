import 'dart:convert';

import 'package:get_it/get_it.dart';
import 'package:myco_flutter/constants/constants.dart';
import 'package:myco_flutter/core/encryption/gzip_util.dart';
import 'package:myco_flutter/core/models/data/common_response_model.dart';
import 'package:myco_flutter/core/network/api_client.dart';
import 'package:myco_flutter/features/work_allocation/data/data_source/work_allocation_remote_data_source.dart';
import 'package:myco_flutter/features/work_allocation/data/models/request/add_work_allocation_requset.dart';
import 'package:myco_flutter/features/work_allocation/data/models/request/get_assignee_%20details_request.dart';
import 'package:myco_flutter/features/work_allocation/data/models/request/get_work_category_request.dart';
import 'package:myco_flutter/features/work_allocation/data/models/request/hod_approval_request.dart';
import 'package:myco_flutter/features/work_allocation/data/models/request/re_assign_engineer_request.dart';
import 'package:myco_flutter/features/work_allocation/data/models/request/task_approval_request.dart';
import 'package:myco_flutter/features/work_allocation/data/models/request/task_completion_request.dart';
import 'package:myco_flutter/features/work_allocation/data/models/request/work_allocation_request.dart';
import 'package:myco_flutter/features/work_allocation/data/models/response/get_assignee_details_response.dart';
import 'package:myco_flutter/features/work_allocation/data/models/response/get_work_category_response.dart';
import 'package:myco_flutter/features/work_allocation/data/models/response/work_allocation_response.dart';

class WorkAllocationRemoteDataSourceImpl
    extends WorkAllocationRemoteDataSource {
  @override
  Future<WorkAllocationResponseModel> pendingWorkAllocation(
    WorkAllocationRequest request,
  ) async {
    final encryptedBody = GzipUtil.encryptAES(jsonEncode(request));
    final response = await GetIt.I<ApiClient>(
      instanceName: VariableBag.employeeMobileApi,
    ).postDynamic('workAllocationController.php', encryptedBody);
    return WorkAllocationResponseModel.fromJson(
      json.decode(GzipUtil.decryptAES(response)),
    );
  }

  @override
  Future<GetWorkCategoryResponseModel> getWorkCategoryList(
    GetWorkCategoryRequest request,
  ) async {
    final encryptedBody = GzipUtil.encryptAES(jsonEncode(request));
    final response = await GetIt.I<ApiClient>(
      instanceName: VariableBag.employeeMobileApi,
    ).postDynamic('workAllocationController.php', encryptedBody);
    return GetWorkCategoryResponseModel.fromJson(
      json.decode(GzipUtil.decryptAES(response)),
    );
  }

  @override
  Future<CommonResponseModel> reAssignEngineer(
    ReAssignEngineerRequest request,
  ) async {
    final encryptedBody = GzipUtil.encryptAES(jsonEncode(request));
    final response = await GetIt.I<ApiClient>(
      instanceName: VariableBag.employeeMobileApi,
    ).postDynamic('workAllocationController.php', encryptedBody);
    return CommonResponseModel.fromJson(
      json.decode(GzipUtil.decryptAES(response)),
    );
  }

  @override
  Future<CommonResponseModel> addWorkAllocation(
    AddWorkAllocationRequest request,
  ) async {
    final encryptedBody = GzipUtil.encryptAES(jsonEncode(request));
    final response = await GetIt.I<ApiClient>(
      instanceName: VariableBag.employeeMobileApi,
    ).postDynamic('workAllocationController.php', encryptedBody);
    return CommonResponseModel.fromJson(
      json.decode(GzipUtil.decryptAES(response)),
    );
  }

  @override
  Future<GetAssigneeResponseModel> getAssigneeDetails(
    GetAssigneeDetailsRequest request,
  ) async {
    final encryptedBody = GzipUtil.encryptAES(jsonEncode(request));
    final response = await GetIt.I<ApiClient>(
      instanceName: VariableBag.employeeMobileApi,
    ).postDynamic('workAllocationController.php', encryptedBody);
    return GetAssigneeResponseModel.fromJson(
      json.decode(GzipUtil.decryptAES(response)),
    );
  }

  @override
  Future<CommonResponseModel> hodApproval(HodApprovalRequest request) async {
    final encryptedBody = GzipUtil.encryptAES(jsonEncode(request));
    final response = await GetIt.I<ApiClient>(
      instanceName: VariableBag.employeeMobileApi,
    ).postDynamic('workAllocationController.php', encryptedBody);
    return CommonResponseModel.fromJson(
      json.decode(GzipUtil.decryptAES(response)),
    );
  }

  @override
  Future<CommonResponseModel> taskApproval(TaskApprovalRequest request) async {
    final encryptedBody = GzipUtil.encryptAES(jsonEncode(request));
    final response = await GetIt.I<ApiClient>(
      instanceName: VariableBag.employeeMobileApi,
    ).postDynamic('workAllocationController.php', encryptedBody);
    return CommonResponseModel.fromJson(
      json.decode(GzipUtil.decryptAES(response)),
    );
  }

  @override
  Future<CommonResponseModel> taskCompletion(
    TaskCompletionRequest request,
  ) async {
    final encryptedBody = GzipUtil.encryptAES(jsonEncode(request));
    final response = await GetIt.I<ApiClient>(
      instanceName: VariableBag.employeeMobileApi,
    ).postDynamic('workAllocationController.php', encryptedBody);
    return CommonResponseModel.fromJson(
      json.decode(GzipUtil.decryptAES(response)),
    );
  }
}
