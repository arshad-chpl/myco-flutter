

import 'package:myco_flutter/features/common_api/data/models/request/branch_list_request.dart';
import 'package:myco_flutter/features/common_api/data/models/request/department_and_designation_list_request.dart';
import 'package:myco_flutter/features/common_api/data/models/request/shift_list_request.dart';
import 'package:myco_flutter/features/common_api/data/models/response/branch_response.dart';
import 'package:myco_flutter/features/common_api/data/models/response/floor_and_unit_response.dart';
import 'package:myco_flutter/features/common_api/data/models/response/shift_response.dart';
import 'package:myco_flutter/features/common_api/data/models/response/uploaded_file_response.dart';

abstract class CommonApiDataSource {
  Future<UploadFileResponseModel> uploadAttachments(bool loginType, List<String> filePath);

  Future<BranchResponseModel> getBranchList(BranchListRequest request);
  Future<FloorAndUnitResponseModel> getDepartmentAndDesignation(DepartmentAndDesignationListRequest request);
  Future<ShiftResponseModel> getShiftList(ShiftListRequest request);
}
