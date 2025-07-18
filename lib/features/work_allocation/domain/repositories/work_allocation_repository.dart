import 'package:dartz/dartz.dart';
import 'package:myco_flutter/core/error/failure.dart';
import 'package:myco_flutter/features/work_allocation/data/models/work_allocation_request.dart';
import 'package:myco_flutter/features/work_allocation/domain/entities/work_allocation_entity.dart';

abstract class WorkAllocationRepository {
  Future<Either<Failure, WorkAllocationResponseEntity>> pendingWorkAllocation(
    WorkAllocationRequest request,
  );
}
