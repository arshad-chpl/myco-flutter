import 'package:go_router/go_router.dart';
import 'package:myco_flutter/core/router/route_paths.dart';
import 'package:myco_flutter/features/payslip/presentation/pages/payslip_detail.dart';
import 'package:myco_flutter/features/payslip/presentation/pages/salary_break_up_page.dart';

List<RouteBase> payslipRoutes = [
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
];
