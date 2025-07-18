import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:myco_flutter/core/router/route_paths.dart';
import 'package:myco_flutter/features/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'package:myco_flutter/features/dashboard/presentation/pages/dashboard_page.dart';

List<GoRoute> DashboardRoutes=[
        GoRoute(
        path: RoutePaths.dashboard,
        name: RoutePaths.dashboard,
        builder: (context, state) => BlocProvider(
          create: (context) => GetIt.I<DashboardBloc>(),
          child: const DashBoardPage(),
          lazy: false,
        ),
      ),
];