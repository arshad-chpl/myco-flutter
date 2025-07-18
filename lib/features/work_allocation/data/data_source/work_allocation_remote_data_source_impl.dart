import 'dart:convert';

import 'package:get_it/get_it.dart';
import 'package:myco_flutter/constants/constants.dart';
import 'package:myco_flutter/core/encryption/gzip_util.dart';
import 'package:myco_flutter/core/network/api_client.dart';
import 'package:myco_flutter/features/work_allocation/data/data_source/work_allocation_remote_data_source.dart';
import 'package:myco_flutter/features/work_allocation/data/models/get_work_category_request.dart';
import 'package:myco_flutter/features/work_allocation/data/models/get_work_category_response.dart';
import 'package:myco_flutter/features/work_allocation/data/models/work_allocation_request.dart';
import 'package:myco_flutter/features/work_allocation/data/models/work_allocation_response.dart';

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
      GetWorkCategoryRequest request) async {
    final encryptedBody = GzipUtil.decryptAES(jsonEncode(request));
    final response = await GetIt.I<ApiClient>(
      instanceName: VariableBag.employeeMobileApi, // added here for only ref
    ).postDynamic('workAllocationController.php', encryptedBody);
    return GetWorkCategoryResponseModel.fromJson(
      json.decode(GzipUtil.decryptAES(response)),
    );
  }

}
