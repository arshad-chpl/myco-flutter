import 'package:equatable/equatable.dart';
import 'package:myco_flutter/features/work_allocation/data/models/request/add_work_allocation_requset.dart';

abstract class WorkAllocationEvent extends Equatable {
  const WorkAllocationEvent();

  @override
  List<Object?> get props => [];
}

class FetchWorkCategoryList extends WorkAllocationEvent {
  final String companyId;
  final String getWorkCategory;
  final String languageId;

  const FetchWorkCategoryList({
    required this.companyId,
    required this.getWorkCategory,
    required this.languageId,
  });

  @override
  List<Object?> get props => [companyId, getWorkCategory, languageId];
}

class AddWorkAllocationEvent extends WorkAllocationEvent {
  final AddWorkAllocationRequest request;

  const AddWorkAllocationEvent(this.request);

  @override
  List<Object?> get props => [request];
}
