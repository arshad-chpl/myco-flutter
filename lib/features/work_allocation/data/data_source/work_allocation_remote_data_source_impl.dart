import 'dart:convert';

import 'package:get_it/get_it.dart';
import 'package:myco_flutter/constants/constants.dart';
import 'package:myco_flutter/core/encryption/gzip_util.dart';
import 'package:myco_flutter/core/network/api_client.dart';
import 'package:myco_flutter/features/admin_view/data/models/admin_view_request.dart';
import 'package:myco_flutter/features/admin_view/data/models/admin_view_response_model.dart';
import 'package:myco_flutter/features/work_allocation/data/data_source/work_allocation_remote_data_source.dart';
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

}
