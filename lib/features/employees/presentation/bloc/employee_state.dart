import 'package:myco_flutter/features/employees/domain/entites/branch.dart';
import 'package:myco_flutter/features/employees/domain/entites/department.dart';
import 'package:myco_flutter/features/employees/domain/entites/employee.dart';

abstract class EmployeeState {}

class EmployeeInitial extends EmployeeState {}

class EmployeeLoading extends EmployeeState {}

class EmployeeLoaded extends EmployeeState {
  final List<Branch> branches;
  final List<Department> departments;
  final List<Employee> employees;
  final Branch? selectedBranch;
  final Department? selectedDepartment;
  final String searchQuery;
  final Set<String> selectedEmployeeIds;

  EmployeeLoaded({
    required this.branches,
    required this.departments,
    required this.employees,
    this.selectedBranch,
    this.selectedDepartment,
    this.searchQuery = '',
    this.selectedEmployeeIds = const {},
  });
}

class EmployeeError extends EmployeeState {
  final String message;

  EmployeeError(this.message);
}

extension DepartmentFiltering on EmployeeLoaded {
  List<Department> get filteredDepartments =>
      departments.where((d) => d.blockId == selectedBranch?.blockId).toList();
}
