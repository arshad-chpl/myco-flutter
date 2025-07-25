import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:myco_flutter/core/router/route_paths.dart';
import 'package:myco_flutter/di/injector.dart';
import 'package:myco_flutter/features/employees/presentation/bloc/employee_bloc.dart';
import 'package:myco_flutter/features/employees/presentation/bloc/employee_event.dart';
import 'package:myco_flutter/features/employees/presentation/pages/employees_screen.dart';

List<GoRoute> employeeRoute = [
  GoRoute(
    path: RoutePaths.employees,
    name: 'MemberVC',
    builder: (context, state) => BlocProvider<EmployeeBloc>(
      create: (_) => sl<EmployeeBloc>()..add(LoadUserData()),
      child: EmployeesScreen(),
    ),
  ),
];
