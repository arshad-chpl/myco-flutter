import 'package:myco_flutter/features/admin_view/data/models/admin_view_response_model.dart';

abstract class AdminViewLocalDataSource {
  Future<AdminViewResponseModel> getLastAdminView(String companyId);

  Future<void> cacheAdminView(
    String companyId,
    AdminViewResponseModel modelToCache,
  );
}
