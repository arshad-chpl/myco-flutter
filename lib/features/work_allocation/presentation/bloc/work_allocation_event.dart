import 'package:equatable/equatable.dart';
import 'package:myco_flutter/features/work_allocation/data/models/request/add_work_allocation_requset.dart';
import 'package:myco_flutter/features/work_allocation/data/models/request/work_allocation_request.dart';
import 'package:myco_flutter/features/work_allocation/presentation/widgets/employee_details.dart';

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

class SelectDynamicWorkCategoryEvent extends WorkAllocationEvent {
  final String selectedCategory;

  const SelectDynamicWorkCategoryEvent(this.selectedCategory);

  @override
  List<Object?> get props => [selectedCategory];
}

class AddWorkAllocationEvent extends WorkAllocationEvent {
  final AddWorkAllocationRequest request;

  const AddWorkAllocationEvent(this.request);

  @override
  List<Object?> get props => [request];
}

class FilterEmployeesEvent extends WorkAllocationEvent {
  final String query;
  final List<Employee> allEmployees;

  FilterEmployeesEvent(this.query, this.allEmployees);

  @override
  List<Object?> get props => [query, allEmployees];
}

class SelectEmployeeEvent extends WorkAllocationEvent {
  final Employee employee;

  SelectEmployeeEvent(this.employee);
}

class RemoveSelectedEmployeeEvent extends WorkAllocationEvent {}

  class FetchWorkAllocationListEvent extends WorkAllocationEvent {
  final WorkAllocationRequest params;

  const FetchWorkAllocationListEvent( this.params);
  @override
  List<Object?> get props => [params];
}

