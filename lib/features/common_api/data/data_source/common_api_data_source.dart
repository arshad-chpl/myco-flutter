
import 'package:myco_flutter/core/models/common_response.dart';
import 'package:myco_flutter/features/common_api/models/branch_response.dart';
import 'package:myco_flutter/features/common_api/models/floor_and_unit_response.dart';
import 'package:myco_flutter/features/common_api/models/shift_response.dart';

abstract class CommonApiDataSource {
  Future<BranchResponse> getBranchList();
  Future<FloorAndUnitResponse> getFloorAndUnit(String branchId);
  Future<ShiftResponse> getShiftList(String floorId);
}
