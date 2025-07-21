import 'dart:convert';

import 'package:get_it/get_it.dart';
import 'package:myco_flutter/constants/constants.dart';
import 'package:myco_flutter/core/encryption/gzip_util.dart';
import 'package:myco_flutter/core/models/data/common_response_model.dart';
import 'package:myco_flutter/core/network/api_client.dart';
import 'package:myco_flutter/features/appointments/data/data_source/appointment_remote_data_source.dart';
import 'package:myco_flutter/features/appointments/data/models/request/approve_appointment_entity_model.dart';
import 'package:myco_flutter/features/appointments/data/models/request/delete_appointment_request_model.dart';
import 'package:myco_flutter/features/appointments/data/models/request/get_appointment_request_model.dart';
import 'package:myco_flutter/features/appointments/data/models/request/get_my_apppointments_request_model.dart';
import 'package:myco_flutter/features/appointments/data/models/request/reject_appointment_request_model.dart';
import 'package:myco_flutter/features/appointments/data/models/request/send_appointment_reminder_request_model.dart';
import 'package:myco_flutter/features/appointments/data/models/response/appointment_response_model.dart';

class AppointmentRemoteDataSourceImpl extends AppointmentRemoteDataSource {
  @override
  Future<AppointmentResponseModel> getAppointment(
    GetAppointmentRequestModel request,
  ) async {
    final encryptedBody = GzipUtil.encryptAES(jsonEncode(request));
    final response = await GetIt.I<ApiClient>(
      instanceName: VariableBag.employeeMobileApi,
    ).postDynamic('appointment_controller.php', encryptedBody);
    return AppointmentResponseModel.fromJson(
      json.decode(GzipUtil.decryptAES(response)),
    );
  }

  @override
  Future<CommonResponseModel> rejectAppointment(
    RejectAppointmentRequestModel request,
  ) async {
    final encryptedBody = GzipUtil.encryptAES(jsonEncode(request));
    final response = await GetIt.I<ApiClient>(
      instanceName: VariableBag.employeeMobileApi,
    ).postDynamic('appointment_controller.php', encryptedBody);
    return CommonResponseModel.fromJson(
      json.decode(GzipUtil.decryptAES(response)),
    );
  }

  @override
  Future<CommonResponseModel> getMyAppointments(
    GetMyAppointmentsRequestModel getMyAppointmentRequest,
  ) async {
    final encryptedBody = GzipUtil.encryptAES(
      jsonEncode(getMyAppointmentRequest),
    );
    final response = await GetIt.I<ApiClient>(
      instanceName: VariableBag.employeeMobileApi,
    ).postDynamic('admin_view_controller.php', encryptedBody);
    return CommonResponseModel.fromJson(
      json.decode(GzipUtil.decryptAES(response)),
    );
  }

  @override
  Future<CommonResponseModel> deleteAppointment(
    DeleteAppointmentRequestModel deleteAppointmentRequest,
  ) async {
    final encryptedBody = GzipUtil.encryptAES(
      jsonEncode(deleteAppointmentRequest),
    );
    final response = await GetIt.I<ApiClient>(
      instanceName: VariableBag.employeeMobileApi,
    ).postDynamic('admin_view_controller.php', encryptedBody);
    return CommonResponseModel.fromJson(
      json.decode(GzipUtil.decryptAES(response)),
    );
  }

  @override
  Future<CommonResponseModel> sendAppointmentReminder(
    SendAppointmentReminderRequestModel request,
  ) async {
    final encryptedBody = GzipUtil.encryptAES(jsonEncode(request));
    final response = await GetIt.I<ApiClient>(
      instanceName: VariableBag.employeeMobileApi,
    ).postDynamic('appointment_controller.php', encryptedBody);
    return CommonResponseModel.fromJson(
      json.decode(GzipUtil.decryptAES(response)),
    );
  }

  @override
  Future<CommonResponseModel> approveAppointment(
    ApproveAppointmentRequestModel approveAppointmentRequest,
  ) async {
    final encryptedBody = GzipUtil.encryptAES(
      jsonEncode(approveAppointmentRequest),
    );
    final response = await GetIt.I<ApiClient>(
      instanceName: VariableBag.employeeMobileApi,
    ).postDynamic('appointment_controller.php', encryptedBody);
    return CommonResponseModel.fromJson(
      json.decode(GzipUtil.decryptAES(response)),
    );
  }
}
