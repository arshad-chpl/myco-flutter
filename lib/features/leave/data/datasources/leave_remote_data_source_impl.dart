import 'dart:convert';

import 'package:get_it/get_it.dart';
import 'package:myco_flutter/constants/constants.dart';
import 'package:myco_flutter/core/models/data/common_response_model.dart';
import 'package:myco_flutter/core/network/api_client.dart';
import 'package:myco_flutter/features/leave/data/datasources/leave_remote_data_source.dart';
import 'package:myco_flutter/features/leave/model/check_leave_balance_response.dart';
import 'package:myco_flutter/features/leave/model/comp_off_leave_response_model.dart';
import 'package:myco_flutter/features/leave/model/leave_history_response_model.dart';
import 'package:myco_flutter/features/leave/model/leave_type_response.dart';
import 'package:myco_flutter/features/leave/model/my_team_response_model.dart';

class LeaveRemoteDataSourceImpl implements LeaveRemoteDataSource {
  @override
  Future<LeaveHistoryResponseModel> getNewLeaveListType(String query) async {
    final dataMap = {
      'getLeaveTypeList': 'getLeaveTypeList',
      'society_id': '1',
      'unit_id': '1387',
      'user_id': '1365',
      'floor_id': '1',
      'currentYear': query,
      'language_id': '1',
    };

    final response = await GetIt.I<ApiClient>(
      instanceName: VariableBag.residentApiNew,
    ).postFormDynamic('leave_controller.php', dataMap);

    return LeaveHistoryResponseModel.fromJson(json.decode(response));
  }

  @override
  Future<MyTeamResponseModel> getMyTeamLeaves() async {
    final dataMap = {
      'getMyTeamLeaves': 'getMyTeamLeaves',
      'society_id': '1',
      'user_id': '1365',
      'language_id': '1',
      'limit': '',
      'level_id': '26',
    };

    final response = await GetIt.I<ApiClient>(
      instanceName: VariableBag.residentApiNew,
    ).postFormDynamic('team_controller.php', dataMap);

    return MyTeamResponseModel.fromJson(json.decode(response));
  }

  @override
  Future<LeaveHistoryResponseModel> getLeaveHistoryNew(
    String monthName,
    String year,
  ) async {
    final dataMap = {
      'getLeaveHistoryNew': 'getLeaveHistoryNew',
      'society_id': '1',
      'unit_id': '1387',
      'user_id': '1365',
      'floor_id': '1',
      'level_id': '26',
      'language_id': '1',
      'month': monthName,
      'year': year,
    };

    final response = await GetIt.I<ApiClient>(
      instanceName: VariableBag.residentApiNew,
    ).postFormDynamic('leave_controller.php', dataMap);

    return LeaveHistoryResponseModel.fromJson(json.decode(response));
  }

  @override
  Future<CommonResponseModel> addShortLeave(
    String date,
    String time,
    String reason,
  ) async {
    final dataMap = {
      'addShortLeave': 'addShortLeave',
      'society_id': '1',
      'user_id': '1365',
      'user_name': 'Lucky Katre',
      'language_id': '1',
      'short_leave_date': date,
      'short_leave_time': time,
      'short_leave_apply_reason': reason,
    };

    final response = await GetIt.I<ApiClient>(
      instanceName: VariableBag.residentApiNew,
    ).postFormDynamic('leave_controller.php', dataMap);
    return CommonResponseModel.fromJson(json.decode(response));
  }

  @override
  Future<CommonResponseModel> deleteShortLeave(
    String shortLeaveId,
    String shortLeaveDate,
    String otherUserId,
    String otherUserName,
  ) async {
    final dataMap = {
      'deleteShortLeave': 'deleteShortLeave',
      'society_id': '1',
      'user_id': '1365',
      'user_name': 'Lucky Katre',
      'language_id': '1',
      'short_leave_id': shortLeaveId,
      'short_leave_date': shortLeaveDate,
      'other_user_id': otherUserId,
      'other_user_name': otherUserName,
    };

    final response = await GetIt.I<ApiClient>(
      instanceName: VariableBag.residentApiNew,
    ).postFormDynamic('leave_controller.php', dataMap);
    return CommonResponseModel.fromJson(json.decode(response));
  }

  @override
  Future<LeaveTypeResponse> getLeaveTypesWithData(
    String unitId,
    String useId,
    String userName,
    String currentYear,
    String appliedLeaveDate,
  ) async {
    final dataMap = {
      'getLeaveTypesWithData': 'getLeaveTypesWithData',
      'society_id': '1',
      'unit_id': unitId,
      'user_id': useId,
      'user_name': userName,
      'language_id': '1',
      'currentYear': currentYear,
      'applied_leave_date': appliedLeaveDate,
    };
    final response = await GetIt.I<ApiClient>(
      instanceName: VariableBag.residentApiNew,
    ).postFormDynamic('leave_controller.php', dataMap);
    return LeaveTypeResponse.fromJson(json.decode(response));
  }

  @override
  Future<CheckLeaveBalanceResponse> getLeaveBalanceForAutoLeave(
    String userId,
    String leaveDate,
    String leaveId,
  ) async {
    final dataMap = {
      'getLeaveBalanceForAutoLeave': 'getLeaveBalanceForAutoLeave',
      'society_id': '1',
      'user_id': userId,
      'language_id': '1',
      'leave_date': leaveDate,
      'leave_type_id': leaveId,
      'leave_status': '0',
    };
    final response = await GetIt.I<ApiClient>(
      instanceName: VariableBag.residentApiNew,
    ).postFormDynamic('leave_controller.php', dataMap);
    return CheckLeaveBalanceResponse.fromJson(json.decode(response));
  }

  @override
  Future<CommonResponseModel> deleteLeaveRequest(String leaveId) async {
    final dataMap = {
      'deleteLeaveRequest': 'deleteLeaveRequest',
      'society_id': '1',
      'user_id': '1365',
      'language_id': '1',
      'other_user_name': 'Lucky Katre',
      'user_name': 'Lucky Katre',
      'leave_id': leaveId,
      'my_user_id': '1365',
      'delete_restrict': '1',
      'remove_late_in': '',
      'remove_early_out': '',
    };

    final response = await GetIt.I<ApiClient>(
      instanceName: VariableBag.residentApiNew,
    ).postFormDynamic('leave_controller.php', dataMap);
    return CommonResponseModel.fromJson(json.decode(response));
  }

  @override
  Future<CommonResponseModel> changeAutoLeave(
    String userId,
    String paid,
    String leaveTypeId,
    String leaveDate,
    String leaveDay,
    String extraDay,
    String isSpecialDay,
    String attendanceId,
    String leaveId,
    String leavePercentage,
  ) async {
    final dataMap = {
      'changeAutoLeave': 'changeAutoLeave',
      'society_id': '1',
      'user_id': userId,
      'language_id': '1',
      'paid_unpaid': paid,
      'leave_type_id': leaveTypeId,
      'leave_date': leaveDate,
      'leave_day_type': leaveDay,
      'is_extra_day': extraDay,
      'is_special_leave': isSpecialDay,
      'attendance_id': attendanceId,
      'user_name': 'Lucky Katre',
      'leave_id': leaveId,
      'leave_percentage': leavePercentage,
      'is_from_admin': '0',
    };
    final response = await GetIt.I<ApiClient>(
      instanceName: VariableBag.residentApiNew,
    ).postFormDynamic('leave_controller.php', dataMap);
    return CommonResponseModel.fromJson(json.decode(response));
  }

  @override
  Future<CommonResponseModel> changeSandwichLeave(
    String userId,
    String paid,
    String leaveTypeId,
    String leaveName,
    String sandwichId,
    String unitId,
    String userFullName,
    String leavePercentage,
  ) async {
    final dataMap = {
      'changeSandwichLeave': 'changeSandwichLeave',
      'society_id': '1',
      'leave_user_id': userId,
      'language_id': '1',
      'paid_unpaid': paid,
      'leave_type_id': leaveTypeId,
      'leave_type_name': leaveName,
      'sandwich_leave_id': sandwichId,
      'user_name': 'Lucky Katre',
      'user_id': '1365',
      'isWeb': '0',
      'unit_id': unitId,
      'my_leave': '1',
      'leave_user_name': userFullName,
      'leave_percentage': leavePercentage,
    };
    final response = await GetIt.I<ApiClient>(
      instanceName: VariableBag.residentApiNew,
    ).postFormDynamic('leave_controller.php', dataMap);
    return CommonResponseModel.fromJson(json.decode(response));
  }

  @override
  Future<CompOffLeaveResponseModel> getCompOffLeaves(String startDate, String endDate) {
    final dataMap = {
      'getCompOffLeaves': 'getCompOffLeaves',
      'society_id': '1',
      'user_id': '1365',
      'language_id': '1',
      'start_date': startDate,
      'end_date': endDate,
    };
    return GetIt.I<ApiClient>(
      instanceName: VariableBag.residentApiNew,
    ).postFormDynamic('leave_controller.php', dataMap).then((value) => CompOffLeaveResponseModel.fromJson(json.decode(value)));
  }
}
