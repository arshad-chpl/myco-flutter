import 'package:equatable/equatable.dart';
import 'package:myco_flutter/features/work_allocation/data/models/request/work_allocation_request.dart';

abstract class WorkAllocationEvent extends Equatable {
  const WorkAllocationEvent();

  @override
  List<Object?> get props => [];
}

class FetchWorkAllocationListEvent extends WorkAllocationEvent {
  final WorkAllocationRequest params;

  const FetchWorkAllocationListEvent(this.params);

  @override
  List<Object?> get props => [params];
}
