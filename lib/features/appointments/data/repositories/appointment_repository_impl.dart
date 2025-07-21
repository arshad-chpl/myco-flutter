import 'package:dartz/dartz.dart';
import 'package:myco_flutter/core/error/failure.dart';
import 'package:myco_flutter/core/models/domain/common_response_entity.dart';
import 'package:myco_flutter/core/utils/safe_api_call.dart';
import 'package:myco_flutter/features/appointments/data/data_source/appointment_remote_data_source.dart';
import 'package:myco_flutter/features/appointments/data/models/request/delete_appointment_request_model.dart';
import 'package:myco_flutter/features/appointments/data/models/request/get_appointment_request_model.dart';
import 'package:myco_flutter/features/appointments/data/models/request/get_my_apppointments_request_model.dart';
import 'package:myco_flutter/features/appointments/data/models/request/reject_appointment_request_model.dart';
import 'package:myco_flutter/features/appointments/data/models/request/send_appointment_reminder_request_model.dart';
import 'package:myco_flutter/features/appointments/domain/entities/appointment_entities_model.dart';
import 'package:myco_flutter/features/appointments/domain/repositories/appointment_repository.dart';

class AppointmentRepositoryImpl extends AppointmentRepository {
  final AppointmentRemoteDataSource remoteDataSource;
  final SafeApiCall safeApiCall;

  AppointmentRepositoryImpl(this.safeApiCall, this.remoteDataSource);

  @override
  Future<Either<Failure, AppointmentEntityModel>> getAppointment(
    GetAppointmentRequestModel request,
  ) async => safeApiCall.execute(() async {
    final responseModel = await remoteDataSource.getAppointment(request);
    return responseModel.toEntity();
  });

  @override
  Future<Either<Failure, CommonResponseModelEntity>> rejectAppointment(
    RejectAppointmentRequestModel request,
  ) async => safeApiCall.execute(() async {
    final responseModel = await remoteDataSource.rejectAppointment(request);
    return responseModel.toEntity();
  });

  @override
  Future<Either<Failure, CommonResponseModelEntity>> deleteAppointmentRequest(
    DeleteAppointmentRequestModel request,
  ) async => safeApiCall.execute(() async {
    final responseModel = await remoteDataSource.deleteAppointment(request);
    return responseModel.toEntity();
  });

  @override
  Future<Either<Failure, CommonResponseModelEntity>> getMyAppointment(
    GetMyAppointmentsRequestModel request,
  ) async => safeApiCall.execute(() async {
    final responseModel = await remoteDataSource.getMyAppointments(request);
    return responseModel.toEntity();
  });

  @override
  Future<Either<Failure, CommonResponseModelEntity>> sendAppointmentReminder(
    SendAppointmentReminderRequestModel request,
  ) async => safeApiCall.execute(() async {
    final responseModel = await remoteDataSource.sendAppointmentReminder(
      request,
    );
    return responseModel.toEntity();
  });
}
