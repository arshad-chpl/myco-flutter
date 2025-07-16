import 'package:dartz/dartz.dart';
import 'package:myco_flutter/core/error/failure.dart';
import 'package:myco_flutter/core/utils/safe_api_call.dart';
import 'package:myco_flutter/features/holiday/data/data_sources/holiday_remote_data_source.dart';
import 'package:myco_flutter/features/holiday/domain/repositories/holiday_repository.dart';
import 'package:myco_flutter/features/holiday/model/holiday_list_response.dart';

class HolidayRepositoryImpl implements HolidayRepository {
  final HolidayRemoteDataSource remoteDataSource;
  final SafeApiCall safeApiCall;

  HolidayRepositoryImpl(this.remoteDataSource, this.safeApiCall);

  @override
  Future<Either<Failure, HolidayListResponse>> fetchHolidays(
    String year,
  ) async => safeApiCall.execute(() => remoteDataSource.fetchHolidays(year));

  @override
  Future<Either<Failure, void>> applyHoliday(String holidayId) async =>
      safeApiCall.execute(() => remoteDataSource.applyHoliday(holidayId));

  @override
  Future<Either<Failure, void>> deleteHoliday(String holidayAssignId) async =>
      safeApiCall.execute(
        () => remoteDataSource.deleteHoliday(holidayAssignId),
      );
}
