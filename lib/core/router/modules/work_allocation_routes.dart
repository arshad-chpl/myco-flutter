import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:myco_flutter/core/router/route_paths.dart';
import 'package:myco_flutter/features/work_allocation/presentation/bloc/work_allocation_bloc.dart';
import 'package:myco_flutter/features/work_allocation/presentation/pages/assign_work_page.dart';
import 'package:myco_flutter/features/work_allocation/presentation/pages/detail_page.dart';
import 'package:myco_flutter/features/work_allocation/presentation/pages/work_allocation_page.dart';

List<RouteBase> WorkAllocationRoutes = [
  ShellRoute(
    builder: (context, state, child) => MultiBlocProvider(
      providers: [BlocProvider(create: (context) => WorkAllocationBloc())],
      child: child,
    ),
    routes: [
      GoRoute(
        path: RoutePaths.workAllocation,
        name: 'workAllocation',
        builder: (context, state) => const WorkAllocationPage(),
      ),
      GoRoute(
        path: RoutePaths.assignWork,
        name: 'assignWork',
        builder: (context, state) => const AssignWorkPage(),
      ),
      GoRoute(
        path: RoutePaths.detailPage,
        name: 'detailPage',
        builder: (context, state) => const DetailPage(),
      ),
    ],
  ),
];
