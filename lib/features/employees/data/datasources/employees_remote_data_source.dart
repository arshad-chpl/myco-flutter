import 'package:myco_flutter/features/employees/data/models/employee_response_model.dart';

abstract class EmployeesRemoteDataSource {
  Future<EmployeeResponseModel> fetchEmployees();
}
