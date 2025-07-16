import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:myco_flutter/constants/constants.dart';
import 'package:myco_flutter/core/models/common_response.dart';
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

    final response = await GetIt.I<ApiClient>(
      instanceName: VariableBag.residentApiNew,
    ).postFormDynamic('leave_controller.php', dataMap);

    return LeaveHistoryResponseModel.fromJson(json.decode(response));
  }

  @override
  Future<MyTeamResponseModel> getMyTeamLeaves() async {
    final dataMap = {
      'getMyTeamLeaves':'getMyTeamLeaves',
      'society_id':'1',
      'user_id':'1365',
      'language_id':'1',
      'limit':'',
      'level_id':'26'
    };

    final response = await GetIt.I<ApiClient>(
      instanceName: VariableBag.residentApiNew,
    ).postFormDynamic('team_controller.php', dataMap);

    return MyTeamResponseModel.fromJson(json.decode(response));
  }

  @override
  Future<LeaveHistoryResponseModel> getLeaveHistoryNew(String monthName, String year) async {
    final dataMap = {
      'getLeaveHistoryNew':'getLeaveHistoryNew',
      'society_id':'1',
      'unit_id':'1387',
      'user_id':'1365',
      'floor_id':'1',
      'level_id':'26',
      'language_id':'1',
      'month':monthName,
      'year':year,
    };

    final response = await GetIt.I<ApiClient>(
      instanceName: VariableBag.residentApiNew,
    ).postFormDynamic('leave_controller.php', dataMap);

    return LeaveHistoryResponseModel.fromJson(json.decode(response));
  }

  @override
  Future<CommonResponse> addShortLeave(String date, String time, String reason) async {
    final dataMap = {
      'addShortLeave':'addShortLeave',
      'society_id':'1',
      'user_id':'1365',
      'user_name':'Lucky Katre',
      'language_id':'1',
      'short_leave_date':date,
      'short_leave_time':time,
      'short_leave_apply_reason':reason,
    };

    final response = await GetIt.I<ApiClient>(
      instanceName: VariableBag.residentApiNew,
    ).postFormDynamic('leave_controller.php', dataMap);
    return CommonResponse.fromJson(json.decode(response));
  }

  @override
  Future<CommonResponse> deleteShortLeave(String shortLeaveId, String shortLeaveDate, String otherUserId, String otherUserName) async {
    final dataMap = {
      'deleteShortLeave':'deleteShortLeave',
      'society_id':'1',
      'user_id':'1365',
      'user_name':'Lucky Katre',
      'language_id':'1',
      'short_leave_id':shortLeaveId,
      'short_leave_date':shortLeaveDate,
      'other_user_id':otherUserId,
      'short_leave_apply_reason':otherUserName,
    };

    final response = await GetIt.I<ApiClient>(
      instanceName: VariableBag.residentApiNew,
    ).postFormDynamic('leave_controller.php', dataMap);
    return CommonResponse.fromJson(json.decode(response));
  }



}
