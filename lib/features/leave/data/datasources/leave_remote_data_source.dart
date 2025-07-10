import 'package:myco_flutter/features/leave/model/get_new_list_type_response.dart';

abstract class LeaveRemoteDataSource{
  Future<GetNewListTypeResponse> getNewLeaveListType(String query);
}