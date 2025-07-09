import 'package:myco_flutter/features/admin_view/data/models/admin_view_request.dart';
import 'package:myco_flutter/features/admin_view/data/models/admin_view_response_model.dart';

abstract class AdminViewRemoteDataSource {
  Future<AdminViewResponseModel> getAdminViewNew(AdminViewRequest request);
}
