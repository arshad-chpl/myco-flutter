import 'package:myco_flutter/features/lost_and_found/data/model/lost_and_found_item_model.dart';

/// Abstract data source for Lost & Found
abstract class LostAndFoundDataSource {
  /// Gets lost and found items from the API
  // Future<LostAndFoundModel> getLostAndFoundItems(Map<String, dynamic> request);
  Future<LostAndFoundModel> getLostAndFoundItems();
}
