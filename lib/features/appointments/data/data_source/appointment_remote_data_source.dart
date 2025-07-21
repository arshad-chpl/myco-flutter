import 'package:myco_flutter/features/appointments/data/models/response/appointment_response_model.dart';

abstract class AppointmentRemoteDataSource {
  Future<AppointmentResponseModel> appointment();
}