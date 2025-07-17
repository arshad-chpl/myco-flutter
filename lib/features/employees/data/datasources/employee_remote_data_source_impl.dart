import 'dart:convert';
import 'package:myco_flutter/core/network/api_client.dart';
import 'package:myco_flutter/features/employees/data/datasources/employees_remote_data_source.dart';
import 'package:myco_flutter/features/employees/data/models/branch_model/branch_model.dart';
import 'package:myco_flutter/features/employees/data/models/department_model/department_model.dart';
import 'package:myco_flutter/features/employees/data/models/employee_model/employee_model.dart';

class EmployeeRemoteDataSourceImpl implements EmployeeRemoteDataSource {
  final ApiClient _apiClient;

  EmployeeRemoteDataSourceImpl(this._apiClient);

  Future<Map<String, dynamic>> _postAll({
    required String userId,
    required String societyId,
    String? blockId,
    String? floorId,
  }) async {
    final requestMap = {
      'getEmployees': 'getEmployees',
      'language_id': '1',
      'user_id': userId,
      'society_id': societyId,
      if (blockId != null) 'block_id': blockId,
      if (floorId != null) 'floor_id': floorId,
    };

    final response = await _apiClient.postFormDynamic(
      'employee_controller.php',
      requestMap,
    );

    final decoded = response is String ? json.decode(response) : response;

    // 🔍 Log to check what is coming from API
    print('📦 API RAW RESPONSE: ${jsonEncode(decoded)}');

    // Optional: Print specific keys
    print('✅ Keys in response: ${decoded.keys.join(', ')}');

    return decoded;
  }

  @override
  Future<List<BranchModel>> fetchBranches(
    String userId,
    String societyId,
  ) async {
    final data = await _postAll(userId: userId, societyId: societyId);
    final list = data['branch_list'] as List<dynamic>? ?? [];
    return list.map((e) => BranchModel.fromJson(e)).toList();
  }

  @override
  Future<List<DepartmentModel>> fetchDepartments(
    String userId,
    String societyId,
  ) async {
    final data = await _postAll(userId: userId, societyId: societyId);
    final list = data['departments'] as List<dynamic>? ?? [];
    return list.map((e) => DepartmentModel.fromJson(e)).toList();
  }

  @override
  Future<List<EmployeeModel>> fetchEmployees({
    required String userId,
    required String societyId,
    String? blockId,
    String? floorId,
  }) async {
    final data = await _postAll(
      userId: userId,
      societyId: societyId,
      blockId: blockId,
      floorId: floorId,
    );
    final list = data['employees'] as List<dynamic>? ?? [];
    return list.map((e) => EmployeeModel.fromJson(e)).toList();
  }
}
