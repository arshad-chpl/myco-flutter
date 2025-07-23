import 'package:equatable/equatable.dart';
import 'package:myco_flutter/features/work_allocation/domain/entities/get_work_category_entity.dart';
import 'package:myco_flutter/features/work_allocation/presentation/widgets/employee_details.dart';

abstract class WorkAllocationState extends Equatable {
  const WorkAllocationState();

  @override
  List<Object?> get props => [];
}

class WorkAllocationInitial extends WorkAllocationState {}

// Loading state (for fetching categories or submitting form)
class WorkAllocationLoading extends WorkAllocationState {}

// Category list loaded
class WorkCategoryListLoaded extends WorkAllocationState {
  final List<WorkCategoryListEntity> categories;
  final String? selectedCategory;

  const WorkCategoryListLoaded(this.categories, {this.selectedCategory});

  @override
  List<Object?> get props => [categories, selectedCategory];
}

// Work allocation form submitted successfully
class WorkAllocationSuccess extends WorkAllocationState {
  final String message;

  const WorkAllocationSuccess(this.message);

  @override
  List<Object?> get props => [message];
}

// Error state
class WorkAllocationError extends WorkAllocationState {
  final String error;

  const WorkAllocationError(this.error);

  @override
  List<Object?> get props => [error];
}

// Category selected
class WorkCategorySelected extends WorkAllocationState {
  final String selectedCategory;

  const WorkCategorySelected(this.selectedCategory);

  @override
  List<Object?> get props => [selectedCategory];
}

// Filtered employee list to show in search
class EmployeeFiltered extends WorkAllocationState {
  final List<Employee> employees;
  final bool showList;

  const EmployeeFiltered({required this.employees, required this.showList});

  @override
  List<Object?> get props => [employees, showList];
}

// Employee selected
class EmployeeSelected extends WorkAllocationState {
  final Employee employee;

  const EmployeeSelected(this.employee);

  @override
  List<Object?> get props => [employee];
}

// Selected employee removed
class EmployeeDeselected extends WorkAllocationState {}
