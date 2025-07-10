import 'package:dartz/dartz.dart';
import 'package:myco_flutter/core/error/failure.dart';
import 'package:myco_flutter/features/leave/model/get_new_list_type_response.dart';

abstract class LeaveRepository{
  Future<Either<Failure, GetNewListTypeResponse>> getNewListType(String query);
}