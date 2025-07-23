import 'package:dartz/dartz.dart';
import 'package:myco_flutter/core/error/failure.dart';
import 'package:myco_flutter/core/models/domain/common_response_entity.dart';
import 'package:myco_flutter/features/appointments/data/models/request/add_appointment_request_model.dart';
import 'package:myco_flutter/features/appointments/data/models/request/approve_appointment_entity_model.dart';
import 'package:myco_flutter/features/appointments/data/models/request/delete_appointment_request_model.dart';
import 'package:myco_flutter/features/appointments/data/models/request/get_appointment_request_model.dart';
import 'package:myco_flutter/features/appointments/data/models/request/get_my_appointments_request_model.dart';
import 'package:myco_flutter/features/appointments/data/models/request/reject_appointment_request_model.dart';
import 'package:myco_flutter/features/appointments/data/models/request/send_appointment_reminder_request_model.dart';
import 'package:myco_flutter/features/appointments/domain/entities/appointment_entities_model.dart';

abstract class AppointmentRepository {
  Future<Either<Failure, AppointmentEntityModel>> getAppointment(
    GetAppointmentRequestModel request,
  );

  Future<Either<Failure, CommonResponseModelEntity>> rejectAppointment(
    RejectAppointmentRequestModel request,
  );

  Future<Either<Failure, AppointmentEntityModel>> getMyAppointment(
    GetMyAppointmentsRequestModel request,
  );

  Future<Either<Failure, CommonResponseModelEntity>> deleteAppointmentRequest(
    DeleteAppointmentRequestModel request,
  );

  Future<Either<Failure, CommonResponseModelEntity>> sendAppointmentReminder(
    SendAppointmentReminderRequestModel request,
  );

  Future<Either<Failure, CommonResponseModelEntity>> addAppointment(
    AddAppointmentRequestModel request,
  );

  Future<Either<Failure, CommonResponseModelEntity>> approveAppointment(
    ApproveAppointmentRequestModel request,
  );
}
