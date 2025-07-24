import 'package:dartz/dartz.dart';
import 'package:myco_flutter/core/error/failure.dart';
import 'package:myco_flutter/core/utils/safe_api_call.dart';
import 'package:myco_flutter/features/holiday/data/data_sources/holiday_remote_data_source.dart';
import 'package:myco_flutter/features/holiday/domain/entities/holiday_list_response_entity.dart';
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
  Future<Either<Failure, HolidayListResponseEntity>> fetchHolidays(
    HolidayListRequestModel model,
  ) async => safeApiCall.execute(() async {
    // Await the response from the data source
    final responseModel = await remoteDataSource.fetchHolidays(model);
    // Convert the Model to an Entity before returning
    return responseModel.toEntity();
  });

  @override
  Future<Either<Failure, HolidayListResponseEntity>> applyHoliday(
    ApplyOptionalHoliday model,
  ) async => safeApiCall.execute(() async {
    // Await the response from the data source
    final responseModel = await remoteDataSource.applyHoliday(model);
    // Convert the Model to an Entity before returning
    return responseModel.toEntity();
  });

  @override
  Future<Either<Failure, HolidayListResponseEntity>> deleteHoliday(
    DeleteOptionalHoliday model,
  ) async => safeApiCall.execute(() async {
    // Await the response from the data source
    final responseModel = await remoteDataSource.deleteHoliday(model);
    // Convert the Model to an Entity before returning
    return responseModel.toEntity();
  });
}
