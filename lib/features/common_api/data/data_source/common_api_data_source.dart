import 'package:myco_flutter/features/common_api/models/branch_response.dart';
import 'package:myco_flutter/features/common_api/models/floor_and_unit_response.dart';
import 'package:myco_flutter/features/common_api/models/shift_response.dart';
import 'package:myco_flutter/features/common_api/models/uploaded_file_response.dart';

abstract class CommonApiDataSource {
  Future<UploadFileResponseModel> uploadedTemp(String loginType, List<String> filePath);

  Future<BranchResponseModel> getBranchList();
  Future<FloorAndUnitResponseModel> getFloorAndUnit(String branchId);
  Future<ShiftResponseModel> getShiftList(String floorId);
}
