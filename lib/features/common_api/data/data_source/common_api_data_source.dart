import 'package:myco_flutter/features/common_api/models/branch_response.dart';
import 'package:myco_flutter/features/common_api/models/floor_and_unit_response.dart';
import 'package:myco_flutter/features/common_api/models/shift_response.dart';
import 'package:myco_flutter/features/common_api/models/uploaded_file_response.dart';

abstract class CommonApiDataSource {
  Future<UploadFileResponseModel> uploadedTemp(bool loginType, List<String> filePath);

  Future<BranchResponseModel> getBranchList(String societyId, String userId);
  Future<FloorAndUnitResponseModel> getFloorAndUnit(String societyId, String blockId);
  Future<ShiftResponseModel> getShiftList(String societyId, String floorId);
}
