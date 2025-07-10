import 'package:dartz/dartz.dart';
import 'package:myco_flutter/core/error/failure.dart';
import 'package:myco_flutter/features/leave/domain/repositories/leave_repository.dart';
import 'package:myco_flutter/features/leave/model/get_new_list_type_response.dart';

class LeaveUseCase{
  final LeaveRepository repository;

  LeaveUseCase({required this.repository});

  Future<Either<Failure, GetNewListTypeResponse>> getNewListType(String query)=> repository.getNewListType(query);

}