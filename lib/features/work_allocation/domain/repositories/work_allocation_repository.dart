import 'package:dartz/dartz.dart';
import 'package:myco_flutter/core/error/failure.dart';
import 'package:myco_flutter/features/work_allocation/data/models/get_work_category_request.dart';
import 'package:myco_flutter/features/work_allocation/data/models/work_allocation_request.dart';
import 'package:myco_flutter/features/work_allocation/domain/entities/get_work_category_entity.dart';
import 'package:myco_flutter/features/work_allocation/domain/entities/work_allocation_entity.dart';

abstract class WorkAllocationRepository {
  Future<Either<Failure, WorkAllocationResponseEntity>> pendingWorkAllocation(
    WorkAllocationRequest request,
  );

  Future<Either<Failure, GetWorkCategoryResponseEntity>> getWorkCategoryList(
      GetWorkCategoryRequest request,
      );
}
