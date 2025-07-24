import 'package:equatable/equatable.dart';
import 'package:myco_flutter/features/work_allocation/domain/entities/work_allocation_entity.dart';

abstract class WorkAllocationState extends Equatable {
  const WorkAllocationState();

  @override
  List<Object?> get props => [];
}

class WorkAllocationInitial extends WorkAllocationState {
  const WorkAllocationInitial();
}

/// Loading state while data is being fetched or processed.
class WorkAllocationLoading extends WorkAllocationState {
  const WorkAllocationLoading();
}

/// State when the list of work allocations is successfully loaded.
class WorkAllocationListLoaded extends WorkAllocationState {
  final WorkAllocationResponseEntity workAllocationList;

  const WorkAllocationListLoaded(this.workAllocationList);

  @override
  List<Object?> get props => [workAllocationList];
}

class WorkAllocationError extends WorkAllocationState {
  final String error;

  const WorkAllocationError(this.error);

  @override
  List<Object?> get props => [error];
}

class WorkAllocationList extends WorkAllocationState {
  final WorkAllocationResponseEntity workAllocationList;

  const WorkAllocationList(this.workAllocationList);

  @override
  List<Object?> get props => [workAllocationList];
}
