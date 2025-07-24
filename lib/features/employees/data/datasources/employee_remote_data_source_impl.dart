import 'dart:convert';
import 'package:get_it/get_it.dart';
import 'package:myco_flutter/core/network/api_client.dart';
import 'package:myco_flutter/core/services/preference_manager.dart';
import 'package:myco_flutter/features/employees/data/datasources/employees_remote_data_source.dart';
import 'package:myco_flutter/features/employees/data/models/branch_model/branch_model.dart';
import 'package:myco_flutter/features/employees/data/models/department_model/department_model.dart';
import 'package:myco_flutter/features/employees/data/models/employee_model/employee_model.dart';

class EmployeeRemoteDataSourceImpl implements EmployeeRemoteDataSource {
  final ApiClient _apiClient;
  final PreferenceManager _prefs = GetIt.I<PreferenceManager>();

  EmployeeRemoteDataSourceImpl(this._apiClient);

  Future<Map<String, dynamic>> _postAll({
    required String userId,
    required String societyId,
    String? blockId,
    String? floorId,
  }) async {
    // ✅ Step 1: Try to load from cache
    final cachedJsonString = await _prefs.getCachedEmployeeResponse();
    if (cachedJsonString != null && cachedJsonString.isNotEmpty) {
      final cachedMap = json.decode(cachedJsonString);
      print('🗂️ Loaded employee data from cache.');
      _logJsonSize(cachedJsonString, from: '📂 Cache');
      return cachedMap;
    }

    // ✅ Step 2: No cache, call API
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
    final jsonString = jsonEncode(decoded);

    print('📦 API RAW RESPONSE: $jsonString');

    // ✅ Step 3: Save to cache
    await _prefs.setCachedEmployeeResponse(jsonString);

    // ✅ Step 4: Log size
    _logJsonSize(jsonString, from: '🛰️ API');

    return decoded;
  }

  // 🔎 Log JSON size in bytes, KB, and MB
  void _logJsonSize(String jsonString, {String from = ''}) {
    final bytes = utf8.encode(jsonString);
    final sizeInBytes = bytes.length;
    final sizeInKB = sizeInBytes / 1024;
    final sizeInMB = sizeInKB / 1024;

    print(
      '$from 📏 JSON Size: $sizeInBytes bytes | ${sizeInKB.toStringAsFixed(2)} KB | ${sizeInMB.toStringAsFixed(4)} MB',
    );
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

  Future<void> clearCachedEmployeeData() async {
    await _prefs.clearCachedEmployeeResponse();
  }
}
