import 'package:myco_flutter/core/services/preference_manager.dart';
import 'package:myco_flutter/features/admin_view/data/data_source/admin_view_local_data_source.dart';
import 'package:myco_flutter/features/admin_view/data/models/admin_view_response_model.dart';

class AdminViewLocalDataSourceImpl implements AdminViewLocalDataSource {
  final PreferenceManager preferenceManager;

  AdminViewLocalDataSourceImpl({required this.preferenceManager});

  @override
  Future<void> cacheAdminView(
    String companyId,
    AdminViewResponseModel modelToCache,
  ) => preferenceManager.writeObject(
    '${companyId}_AdminViewResponse',
    modelToCache,
    (obj) => obj.toJson(),
  );

  @override
  Future<AdminViewResponseModel> getLastAdminView(String companyId) async {
    final model = await preferenceManager.readObject(
      '${companyId}_AdminViewResponse',
      AdminViewResponseModel.fromJson,
    );
    if (model != null) {
      return model;
    } else {
      throw Exception();
    }
  }
}
