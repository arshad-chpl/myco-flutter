import 'package:go_router/go_router.dart';
import 'package:myco_flutter/core/router/route_paths.dart';
import 'package:myco_flutter/features/appointments/presentation/pages/appointments_page.dart';

List<GoRoute> AppointmentsRoutes = [
  GoRoute(
    path: RoutePaths.appointments,
    name: RoutePaths.appointments,
    builder: (context, state) => const AppointmentsPage(),
  ),
];
