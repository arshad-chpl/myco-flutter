import 'package:dartz/dartz.dart';
import 'package:get_it/get_it.dart';
import 'package:myco_flutter/core/error/failure.dart';
import 'package:myco_flutter/features/dashboard/domain/entites/home_menu_response_entity.dart';
import 'package:myco_flutter/features/dashboard/domain/entites/id_card_entity.dart';
import 'package:myco_flutter/features/dashboard/domain/repositories/dashboard_repository.dart';

class DashboardUsecases {
  DashboardRepository repository;
  DashboardUsecases({required this.repository});
  /// Fetches the User's ID card details from the remote server.
  /// 
  /// Returns a [IdCardEntity] containing the dashboard data.
   Future<Either<Failure,IdCardEntity>> getIDCardDetails(Map<String,dynamic> dataMap) async {
    return await repository.getIDCardDetails(dataMap);
  }

///
/// Fetches the App Menu Grid with Category from the remote server.
   Future<Either<Failure,HomeMenuResponseEntity>> getAppMenuGridWithCategory(Map<String,dynamic> dataMap) async {
    return await repository.getAppMenuGridWithCategory(dataMap);
  }
}
