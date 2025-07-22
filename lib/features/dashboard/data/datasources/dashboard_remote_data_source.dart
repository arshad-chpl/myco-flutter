import 'package:myco_flutter/features/dashboard/data/models/home_menu_response.dart';
import 'package:myco_flutter/features/dashboard/data/models/id_card_detail_response.dart';

abstract class DashboardRemoteDataSource {
  /// Fetches the User's ID card details from the remote server.
  ///
  /// Returns a [IdCardDetailResponse] containing the dashboard data.
  Future<IdCardDetailResponse> getIDCardDetails(Map<String,dynamic> dataMap);

  /// Fetches the latest news articles from the remote server.
  ///
  /// Returns a [List<Map<String, dynamic>>] containing the news articles.
  Future<HomeMenuResponse> getAppMenuGridWithCategory(Map<String,dynamic> dataMap);

  
}