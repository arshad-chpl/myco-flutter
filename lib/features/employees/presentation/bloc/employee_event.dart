import 'package:myco_flutter/features/employees/domain/entites/branch.dart';
import 'package:myco_flutter/features/employees/domain/entites/department.dart';

abstract class EmployeeEvent {}

class LoadUserData extends EmployeeEvent {}

class ChangeBranch extends EmployeeEvent {
  final dynamic branch;

  ChangeBranch(this.branch);
}

class ChangeDepartment extends EmployeeEvent {
  final dynamic department;

  ChangeDepartment(this.department);
}

class SearchEmployees extends EmployeeEvent {
  final String query;

  SearchEmployees(this.query);
}

class ToggleEmployeeSelection extends EmployeeEvent {
  final String employeeId;

  ToggleEmployeeSelection(this.employeeId);
}

class RefreshEmployeeData extends EmployeeEvent {}

