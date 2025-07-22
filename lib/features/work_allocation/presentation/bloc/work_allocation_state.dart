import 'package:equatable/equatable.dart';
import 'package:myco_flutter/features/work_allocation/domain/entities/get_work_category_entity.dart';

abstract class WorkAllocationState extends Equatable {
  const WorkAllocationState();

  @override
  List<Object?> get props => [];
}

class WorkAllocationInitial extends WorkAllocationState {}

class WorkAllocationLoading extends WorkAllocationState {}

class WorkCategoryListLoaded extends WorkAllocationState {
  final List<WorkCategoryListEntity> categories;

  const WorkCategoryListLoaded(this.categories);

  @override
  List<Object?> get props => [categories];
}

class WorkAllocationSuccess extends WorkAllocationState {
  final String message;

  const WorkAllocationSuccess(this.message);

  @override
  List<Object?> get props => [message];
}

class WorkAllocationError extends WorkAllocationState {
  final String error;

  const WorkAllocationError(this.error);

  @override
  List<Object?> get props => [error];
}
