import 'dart:convert';

import 'package:get_it/get_it.dart';
import 'package:myco_flutter/constants/constants.dart';
import 'package:myco_flutter/core/encryption/gzip_util.dart';
import 'package:myco_flutter/core/network/api_client.dart';
import 'package:myco_flutter/features/leave/data/datasources/leave_remote_data_source.dart';
import 'package:myco_flutter/features/leave/model/get_new_list_type_response.dart';

class LeaveRemoteDataSourceImpl implements LeaveRemoteDataSource {
  @override
  Future<GetNewListTypeResponse> getNewLeaveListType(String query) async {
    final dataMap = {
      'getLeaveTypeList': 'getLeaveTypeList',
      'society_id': '1',
      'unit_id': '1387',
      'user_id': '1365',
      'floor_id': '1',
      'currentYear': query,
      'language_id': '1',
    };

    final encryptedBody = (jsonEncode(dataMap));
    final response = await GetIt.I<ApiClient>(
      instanceName: VariableBag.residentApiNew,
    ).postDynamic('leave_controller.php', encryptedBody);
    return GetNewListTypeResponse.fromJson(
      json.decode((response)),
    );
  }

}
