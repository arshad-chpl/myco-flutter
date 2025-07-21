import 'package:myco_flutter/features/work_allocation/data/models/get_work_category_request.dart';
import 'package:myco_flutter/features/work_allocation/data/models/get_work_category_response.dart';
import 'package:myco_flutter/features/work_allocation/data/models/work_allocation_request.dart';
import 'package:myco_flutter/features/work_allocation/data/models/work_allocation_response.dart';

abstract class WorkAllocationRemoteDataSource {
  Future<WorkAllocationResponseModel> pendingWorkAllocation(
    WorkAllocationRequest request,
  );

  Future<GetWorkCategoryResponseModel> getWorkCategoryList(
      GetWorkCategoryRequest request,
      );
}
