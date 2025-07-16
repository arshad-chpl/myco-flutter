
import 'package:myco_flutter/features/sign_in/models/branch_response.dart';
import 'package:myco_flutter/features/sign_in/models/floor_and_unit_response.dart';
import 'package:myco_flutter/features/sign_in/models/shift_response.dart';

abstract class PrimaryRegisterDataSource {
  Future<BranchResponse> getBranchList();
  Future<FloorAndUnitResponse> getFloorAndUnit(String branchId);
  Future<ShiftResponse> getShiftList(String floorId);
}
