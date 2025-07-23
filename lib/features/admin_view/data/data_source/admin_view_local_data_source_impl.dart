import 'dart:convert';

import 'package:myco_flutter/constants/constants.dart';
import 'package:myco_flutter/core/error/failure.dart';
import 'package:myco_flutter/core/services/cache_service.dart';
import 'package:myco_flutter/features/admin_view/data/data_source/admin_view_local_data_source.dart';
import 'package:myco_flutter/features/admin_view/data/models/admin_view_response_model.dart';

class AdminViewLocalDataSourceImpl implements AdminViewLocalDataSource {
  final CacheService cacheService;

  AdminViewLocalDataSourceImpl({required this.cacheService});

  @override
  Future<void> cacheAdminView(
    String companyId,
    AdminViewResponseModel modelToCache,
  ) => cacheService.put(
    VariableBag.ADMIN_VIEW_BOX,
    '${companyId}_AdminViewResponse',
    jsonEncode(modelToCache.toJson()),
  );

  @override
  Future<AdminViewResponseModel> getLastAdminView(String companyId) async {
    final jsonString = await cacheService.get<String>(
      VariableBag.ADMIN_VIEW_BOX,
      '${companyId}_AdminViewResponse',
    );

    if (jsonString != null) {
      // If data is found, decode it from JSON and return the model.
      return Future.value(
        AdminViewResponseModel.fromJson(jsonDecode(jsonString)),
      );
    } else {
      // If no data is found, throw a specific CacheException.
      throw CacheException();
    }
  }
}
