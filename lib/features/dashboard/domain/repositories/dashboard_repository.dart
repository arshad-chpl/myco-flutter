import 'package:dartz/dartz.dart';
import 'package:myco_flutter/core/error/failure.dart';
import 'package:myco_flutter/features/dashboard/data/models/id_card_detail_response.dart';
import 'package:myco_flutter/features/dashboard/domain/entites/id_card_entity.dart';

abstract class DashboardRepository {
  /// Fetches the User's ID card details from the remote server.
  ///
  /// Returns a [IdCardDetailResponse] containing the dashboard data.
  Future<Either<Failure,IdCardEntity>> getIDCardDetails(Map<String,dynamic> dataMap);

  /// Fetches the latest news articles from the remote server.
  ///
  /// Returns a [List<Map<String, dynamic>>] containing the news articles.
  // Future<List<Map<String, dynamic>>> fetchLatestNews();
  
}