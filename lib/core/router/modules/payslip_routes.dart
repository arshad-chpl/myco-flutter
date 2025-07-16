import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:myco_flutter/core/router/route_paths.dart';
import 'package:myco_flutter/features/custom_bloc/tab-bar/bloc/tabbar_bloc.dart';
import 'package:myco_flutter/features/payslip/presentation/pages/payslip_detail.dart';
import 'package:myco_flutter/features/payslip/presentation/pages/payslip_page.dart';
import 'package:myco_flutter/features/payslip/presentation/pages/salary_break_up_page.dart';

List<RouteBase> payslipRoutes = [
  // Payslip routes
  ShellRoute(
    builder: (context, state, child) => MultiBlocProvider(
      providers: [BlocProvider(create: (_) => TabbarBloc())],
      child: child,
    ),
    routes: [
      GoRoute(
        path: RoutePaths.payslip,
        name: RoutePaths.payslip,
        builder: (context, state) => PayslipPage(),
        routes: [
          GoRoute(
            path: RoutePaths.salaryBreakUp,
            name: RoutePaths.salaryBreakUp,
            builder: (context, state) => const SalaryBreakUpPage(),
          ),
          GoRoute(
            path: RoutePaths.payslipDetail,
            name: RoutePaths.payslipDetail,
            builder: (context, state) => const PayslipDetail(),
          ),
        ],
      ),
    ],
  ),
];
