import 'dart:convert';
import 'dart:developer';

import 'package:get_it/get_it.dart';
import 'package:myco_flutter/constants/constants.dart';
import 'package:myco_flutter/core/encryption/gzip_util.dart';
import 'package:myco_flutter/core/network/api_client.dart';
import 'package:myco_flutter/features/employees/data/datasources/employees_remote_data_source.dart';
import 'package:myco_flutter/features/employees/data/models/employee_response_model.dart';

class EmployeesRemoteDataSourceImpl extends EmployeesRemoteDataSource {
  @override
  Future<EmployeeResponseModel> fetchEmployees() async {
    final dataMap = {
      'getSocietyEmployee': 'getSocietyEmployee',
      'language_id': '1',
      'user_id': '21',
      'society_id': '1',
      'floor_id': '151',
      'block_id': '30',
    };

    final encryptedBody = GzipUtil.encryptAES(jsonEncode(dataMap));

    final response = await GetIt.I<ApiClient>(
      instanceName: VariableBag.masterAPICall,
    ).postDynamic('employee_controller.php', encryptedBody);

    return EmployeeResponseModel.fromJson(
      json.decode(GzipUtil.decryptAES(response)),
    );
  }
}
