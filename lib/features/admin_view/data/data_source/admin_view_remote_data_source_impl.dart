import 'dart:convert';

import 'package:get_it/get_it.dart';
import 'package:myco_flutter/constants/constants.dart';
import 'package:myco_flutter/core/encryption/gzip_util.dart';
import 'package:myco_flutter/core/network/api_client.dart';
import 'package:myco_flutter/features/admin_view/data/data_source/admin_view_remote_data_source.dart';
import 'package:myco_flutter/features/admin_view/data/models/admin_view_request.dart';
import 'package:myco_flutter/features/admin_view/data/models/admin_view_response_model.dart';

class AdminViewRemoteDataSourceImpl extends AdminViewRemoteDataSource {
  ApiClient apiClient;
  AdminViewRemoteDataSourceImpl({required this.apiClient});

  @override
  Future<AdminViewResponseModel> getAdminViewNew(AdminViewRequest request)

  async {
    final encryptedBody = GzipUtil.encryptAES(jsonEncode(request));
    final response = await GetIt.I<ApiClient>(instanceName: VariableBag.employeeMobileApi).postDynamic('admin_view_controller.php', encryptedBody);
    return AdminViewResponseModel.fromJson(json.decode(GzipUtil.decryptAES(response)));
  }
}
