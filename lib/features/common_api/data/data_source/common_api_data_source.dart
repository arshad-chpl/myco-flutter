import 'package:myco_flutter/features/common_api/data/models/branch_response.dart';
import 'package:myco_flutter/features/common_api/data/models/floor_and_unit_response.dart';
import 'package:myco_flutter/features/common_api/data/models/shift_response.dart';
import 'package:myco_flutter/features/common_api/data/models/uploaded_file_response.dart';

abstract class CommonApiDataSource {
  Future<UploadFileResponseModel> uploadAttachments(bool loginType, List<String> filePath);

  Future<BranchResponseModel> getBranchList(String companyId, String userId);
  Future<FloorAndUnitResponseModel> getDepartmentAndDesignation(String companyId, String blockId);
  Future<ShiftResponseModel> getShiftList(String companyId, String floorId);
}
