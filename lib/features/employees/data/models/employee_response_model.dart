import 'package:myco_flutter/features/employees/data/models/branch_model.dart';
import 'package:myco_flutter/features/employees/data/models/department_model.dart';
import 'package:myco_flutter/features/employees/data/models/employee_model.dart';

class EmployeeResponseModel {
  final List<BranchModel> branchList;
  final List<DepartmentModel> departments;
  final List<EmployeeModel> employees;
  final String message;
  final int totalBranch;
  final int totalDepartment;
  final int totalEmployees;
  final String status;

  EmployeeResponseModel({
    required this.branchList,
    required this.departments,
    required this.employees,
    required this.message,
    required this.totalBranch,
    required this.totalDepartment,
    required this.totalEmployees,
    required this.status,
  });

  factory EmployeeResponseModel.fromJson(Map<String, dynamic> json) =>
      EmployeeResponseModel(
        branchList: (json['branch_list'] as List)
            .map((e) => BranchModel.fromJson(e))
            .toList(),
        departments: (json['departments'] as List)
            .map((e) => DepartmentModel.fromJson(e))
            .toList(),
        employees: (json['employees'] as List)
            .map((e) => EmployeeModel.fromJson(e))
            .toList(),
        message: json['message'],
        totalBranch: json['total_branch'],
        totalDepartment: json['total_department'],
        totalEmployees: json['total_employees'],
        status: json['status'],
      );
}
