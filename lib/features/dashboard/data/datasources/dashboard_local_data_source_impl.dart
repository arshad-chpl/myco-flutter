import 'package:myco_flutter/core/services/cache_service.dart';
import 'package:myco_flutter/features/dashboard/data/datasources/dashboard_local_data_source.dart';
import 'package:myco_flutter/features/dashboard/data/models/home_menu_response.dart';
import 'package:myco_flutter/features/dashboard/data/models/my_unit_response.dart';

const String kHomeMenuBox = 'homeMenuBox';
const String kHomeMenuCacheKey = 'homeMenuCache';
const String kMyUnitsBox = 'MyUnitsBox';
const String kMyUnitsKey = 'MyUnits';

class DashboardLocalDataSourceImpl implements DashboardLocalDataSource {
  final CacheService cacheService;

  DashboardLocalDataSourceImpl({required this.cacheService});

  @override
  Future<void> cacheHomeMenu(HomeMenuResponse menuToCache) async {
    await cacheService.put(kHomeMenuBox, kHomeMenuCacheKey, menuToCache);
  }

  @override
  Future<HomeMenuResponse?> getHomeMenu() async =>
      await cacheService.get<HomeMenuResponse>(kHomeMenuBox, kHomeMenuCacheKey);

  @override
  Future<void> cacheMyUnits(MyUnitResponse menuToCache) async {
    await cacheService.put(kMyUnitsBox, kMyUnitsKey, menuToCache);
  }

  @override
  Future<MyUnitResponse?> getMyUnits() async =>
      await cacheService.get<MyUnitResponse>(kMyUnitsBox, kMyUnitsKey);
}
