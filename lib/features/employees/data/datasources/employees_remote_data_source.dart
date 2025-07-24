import 'package:myco_flutter/features/employees/data/models/branch_model/branch_model.dart';
import 'package:myco_flutter/features/employees/data/models/department_model/department_model.dart';
import 'package:myco_flutter/features/employees/data/models/employee_model/employee_model.dart';

abstract class EmployeeRemoteDataSource {
  Future<List<BranchModel>> fetchBranches(String userId, String societyId);
  Future<List<DepartmentModel>> fetchDepartments(String userId, String societyId);
  Future<List<EmployeeModel>> fetchEmployees({
    required String userId,
    required String societyId,
    String? blockId,
    String? floorId,
  });
}
