import 'package:dartz/dartz.dart';
import 'package:myco_flutter/core/error/failure.dart';
import 'package:myco_flutter/features/time_sheet/data/models/request/attendence_month_request_model.dart';
import 'package:myco_flutter/features/time_sheet/domain/entities/attendence_month_entity.dart';

abstract class TimeSheetRepository {
  Future<Either<Failure, AttendanceMonthEntity>> monthlyAttendance(
    MonthlyAttendanceRequestModel request,
  );
}
