import 'package:myco_flutter/features/dashboard/data/models/home_menu_response.dart';
import 'package:myco_flutter/features/dashboard/data/models/my_unit_response.dart';

abstract class DashboardLocalDataSource {
  /// Gets the cached [HomeMenuResponse] from local storage.
  ///
  /// Returns the cached data, or null if it doesn't exist.
  Future<HomeMenuResponse?> getHomeMenu();

  /// Caches the [HomeMenuResponse] to local storage.
  Future<void> cacheHomeMenu(HomeMenuResponse menuToCache);

  /// Returns the cached data, or null if it doesn't exist.
  Future<MyUnitResponse?> getMyUnits();

  /// Caches the [HomeMenuResponse] to local storage.
  Future<void> cacheMyUnits(MyUnitResponse menuToCache);
}
