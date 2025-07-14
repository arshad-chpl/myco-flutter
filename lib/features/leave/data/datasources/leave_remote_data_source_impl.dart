import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:myco_flutter/constants/constants.dart';
import 'package:myco_flutter/core/network/api_client.dart';
import 'package:myco_flutter/features/leave/data/datasources/leave_remote_data_source.dart';
import 'package:myco_flutter/features/leave/model/leave_history_response_model.dart';
import 'package:myco_flutter/features/leave/model/my_team_response_model.dart';

class LeaveRemoteDataSourceImpl implements LeaveRemoteDataSource {
  @override
  Future<LeaveHistoryResponseModel> getNewLeaveListType(String query) async {
    final dataMap = {
      'getLeaveTypeList':'getLeaveTypeList',
      'society_id':'1',
      'unit_id':'1387',
      'user_id':'1365',
      'floor_id':'1',
      'currentYear':query,
      'language_id':'1',
    };

    try {
      final response = await GetIt.I<ApiClient>(
        instanceName: VariableBag.residentApiNew,
      ).postFormDynamic('leave_controller.php', dataMap);

      print('Response: $response');
      return LeaveHistoryResponseModel.fromJson(json.decode(response));
    } catch (e) {
      print('Error in getNewLeaveListType: $e');
      if (e is DioException) {
        print('Dio error: ${e.response?.data}');
      }
      rethrow;
    }
  }

  Future<MyTeamResponseModel> getMyTeamLeaves() async {
    final dataMap = {
      'getMyTeamLeaves':'getMyTeamLeaves',
      'society_id':'1',
      'user_id':'1365',
      'language_id':'1',
      'limit':'',
      'level_id':'26'
    };

    try {
      final response = await GetIt.I<ApiClient>(
        instanceName: VariableBag.residentApiNew,
      ).postFormDynamic('team_controller.php', dataMap);

      return MyTeamResponseModel.fromJson(json.decode(response));
    } catch (e) {
      if (e is DioException) {
        print('Dio error: ${e.response?.data}');
      }
      rethrow;
    }
  }

}
