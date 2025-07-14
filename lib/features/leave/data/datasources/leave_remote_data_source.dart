
import 'package:myco_flutter/features/leave/model/leave_history_response_model.dart';

abstract class LeaveRemoteDataSource{
  Future<LeaveHistoryResponseModel> getNewLeaveListType(String query);
}