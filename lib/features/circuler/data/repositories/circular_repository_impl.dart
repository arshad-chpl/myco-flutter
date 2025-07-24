import 'package:dartz/dartz.dart';
import 'package:myco_flutter/core/error/failure.dart';
import 'package:myco_flutter/core/utils/safe_api_call.dart';
import 'package:myco_flutter/features/circuler/data/data_source/circular_data_source.dart';
import 'package:myco_flutter/features/circuler/domain/entity/notice_board_response_entity.dart';
import 'package:myco_flutter/features/circuler/domain/repositories/circular_repository.dart';

class CircularRepositoryImpl implements CircularRepository {
  final CircularDataSource remoteDataSource;
  final SafeApiCall safeApiCall;

  CircularRepositoryImpl(this.remoteDataSource, this.safeApiCall);

  @override
  Future<Either<Failure, NoticeBoardResponseEntity>> getNoticeFilter() async => safeApiCall.execute(() async {
        final responseModel = await remoteDataSource.getNoticeFilter();
        return responseModel.toEntity();
      });
}