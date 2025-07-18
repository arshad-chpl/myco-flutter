import 'package:dartz/dartz.dart';
import 'package:myco_flutter/core/error/failure.dart';
import 'package:myco_flutter/core/utils/safe_api_call.dart';
import 'package:myco_flutter/features/holiday/data/data_sources/holiday_remote_data_source.dart';
import 'package:myco_flutter/features/holiday/domain/repositories/holiday_repository.dart';
import 'package:myco_flutter/features/holiday/model/holiday_list_response.dart';
import 'package:myco_flutter/features/holiday/model/request/apply_optional_holiday.dart';
import 'package:myco_flutter/features/holiday/model/request/delete_optional_holiday.dart';
import 'package:myco_flutter/features/holiday/model/request/holiday_list_request_model.dart';

class HolidayRepositoryImpl implements HolidayRepository {
  final HolidayRemoteDataSource remoteDataSource;
  final SafeApiCall safeApiCall;

  HolidayRepositoryImpl(this.remoteDataSource, this.safeApiCall);

  @override
  Future<Either<Failure, HolidayListResponse>> fetchHolidays(
      HolidayListRequestModel model,
  ) async => safeApiCall.execute(() => remoteDataSource.fetchHolidays(model));

  @override
  Future<Either<Failure, HolidayListResponse>> applyHoliday(ApplyOptionalHoliday model) async =>
      safeApiCall.execute(() => remoteDataSource.applyHoliday(model));

  @override
  Future<Either<Failure, HolidayListResponse>> deleteHoliday(DeleteOptionalHoliday model,) async =>
      safeApiCall.execute(
        () => remoteDataSource.deleteHoliday(model),
      );
}
