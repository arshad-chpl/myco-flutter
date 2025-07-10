import 'package:dartz/dartz.dart';
import 'package:myco_flutter/core/error/failure.dart';
import 'package:myco_flutter/core/utils/safe_api_call.dart';
import 'package:myco_flutter/features/leave/data/datasources/leave_remote_data_source.dart';
import 'package:myco_flutter/features/leave/domain/repositories/leave_repository.dart';
import 'package:myco_flutter/features/leave/model/get_new_list_type_response.dart';

class LeaveRepositoryImpl implements LeaveRepository{
  final LeaveRemoteDataSource remoteDataSource;
  final SafeApiCall safeApiCall;

  LeaveRepositoryImpl(this.remoteDataSource, this.safeApiCall);
  @override
  Future<Either<Failure, GetNewListTypeResponse>> getNewListType( String query,
      ) async =>
   safeApiCall.execute(() => remoteDataSource.getNewLeaveListType(query));

}