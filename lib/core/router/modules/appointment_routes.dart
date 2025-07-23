import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:myco_flutter/core/router/route_paths.dart';
import 'package:myco_flutter/features/appointments/presentation/bloc/appointment_bloc.dart';
import 'package:myco_flutter/features/appointments/presentation/pages/appointments_page.dart';

List<GoRoute> AppointmentsRoutes = [
  GoRoute(
    path: RoutePaths.appointments,
    name: RoutePaths.appointments,
    builder: (context, state) => BlocProvider(
      create: (_) => GetIt.I<AppointmentBloc>(),
      child: Builder(
        builder: (context) => const AppointmentsPage(),
      ),
    ),
  ),
];
