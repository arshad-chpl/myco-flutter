import 'package:dartz/dartz.dart';
import 'package:myco_flutter/core/error/failure.dart';
import 'package:myco_flutter/core/utils/safe_api_call.dart';
import 'package:myco_flutter/features/time_sheet/data/data_source/time_sheet_remote_data_source.dart';
import 'package:myco_flutter/features/time_sheet/data/models/request/attendence_month_request_model.dart';
import 'package:myco_flutter/features/time_sheet/domain/entities/attendence_month_entity.dart';
import 'package:myco_flutter/features/time_sheet/domain/repositories/time_sheet_repository.dart';

class TimeSheetRepositoryImpl extends TimeSheetRepository {
  final TimeSheetRemoteDataSource remoteDataSource;
  final SafeApiCall safeApiCall;

  TimeSheetRepositoryImpl(this.remoteDataSource, this.safeApiCall);

  @override
  Future<Either<Failure, AttendanceMonthEntity>> monthlyAttendance(
    MonthlyAttendanceRequestModel request,
  ) async => safeApiCall.execute(() async {
    final responseModel = await remoteDataSource.monthlyAttendance(request);
    return responseModel.toEntity();
  });
}
