import 'package:dartz/dartz.dart';
import 'package:myco_flutter/core/error/failure.dart';
import 'package:myco_flutter/core/utils/safe_api_call.dart';
import 'package:myco_flutter/features/dashboard/data/datasources/dashboard_remote_data_source.dart';
import 'package:myco_flutter/features/dashboard/data/models/id_card_detail_response.dart';
import 'package:myco_flutter/features/dashboard/domain/entites/home_menu_response_entity.dart';
import 'package:myco_flutter/features/dashboard/domain/entites/id_card_entity.dart';
import 'package:myco_flutter/features/dashboard/domain/repositories/dashboard_repository.dart';

class DashboardRepositoryImpl implements DashboardRepository {
  final DashboardRemoteDataSource remoteDataSource;
  final SafeApiCall safeApiCall;

  DashboardRepositoryImpl(this.safeApiCall, {required this.remoteDataSource});

  @override
  Future<Either<Failure, IdCardEntity>> getIDCardDetails(Map<String,dynamic> dataMap) async {
    final result = await safeApiCall.execute(
      () => remoteDataSource.getIDCardDetails(dataMap),
    );
      return result.map((responseModel) => responseModel.toEntity());
  }

  @override
  Future<Either<Failure, HomeMenuResponseEntity>> getAppMenuGridWithCategory(Map<String, dynamic> dataMap) async{
    final result = await safeApiCall.execute(
      () => remoteDataSource.getAppMenuGridWithCategory(dataMap),
    );
      return result.map((responseModel) => responseModel.toEntity());
  }
}
