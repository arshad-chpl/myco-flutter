import 'package:myco_flutter/core/models/data/common_response_model.dart';
import 'package:myco_flutter/features/appointments/data/models/request/delete_appointment_request_model.dart';
import 'package:myco_flutter/features/appointments/data/models/request/get_appointment_request_model.dart';
import 'package:myco_flutter/features/appointments/data/models/request/get_my_apppointments_request_model.dart';
import 'package:myco_flutter/features/appointments/data/models/request/reject_appointment_request_model.dart';
import 'package:myco_flutter/features/appointments/data/models/request/send_appointment_reminder_request_model.dart';
import 'package:myco_flutter/features/appointments/data/models/response/appointment_response_model.dart';

abstract class AppointmentRemoteDataSource {
  Future<AppointmentResponseModel> getAppointment(
    GetAppointmentRequestModel request,
  );

  Future<CommonResponseModel> rejectAppointment(
    RejectAppointmentRequestModel request,
  );

  Future<CommonResponseModel> getMyAppointments(
    GetMyAppointmentsRequestModel getMyAppointmentRequest,
  );

  Future<CommonResponseModel> deleteAppointment(
    DeleteAppointmentRequestModel deleteAppointmentRequest,
  );

  Future<CommonResponseModel> sendAppointmentReminder(
    SendAppointmentReminderRequestModel request,
  );
}
