import 'package:myco_flutter/features/work_allocation/data/models/work_allocation_request.dart';
import 'package:myco_flutter/features/work_allocation/data/models/work_allocation_response.dart';

abstract class WorkAllocationRemoteDataSource {
  Future<WorkAllocationResponseModel> pendingWorkAllocation(
    WorkAllocationRequest request,
  );
}
