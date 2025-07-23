import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:myco_flutter/core/router/route_paths.dart';
import 'package:myco_flutter/features/leave/presentation/bloc/leave_bloc.dart';
import 'package:myco_flutter/features/leave/presentation/pages/add_leave_screen.dart';
import 'package:myco_flutter/features/leave/presentation/pages/add_short_leave_screen.dart';
import 'package:myco_flutter/features/leave/presentation/pages/edit_leave_screen.dart';
import 'package:myco_flutter/features/leave/presentation/pages/leave_screen.dart';
import 'package:myco_flutter/features/leave/presentation/pages/my_leave_balance_screen.dart';
import 'package:myco_flutter/features/leave/presentation/pages/my_team_leaves_screen.dart';

List<RouteBase> leaveRoutes = [
  GoRoute(
    path: RoutePaths.leave,
    name: RoutePaths.leave,
    builder: (context, state) => BlocProvider<LeaveBloc>(
      create: (_) => GetIt.I<LeaveBloc>(),
      child: const LeaveScreen(),
    ),
  ),

  GoRoute(
    path: RoutePaths.addShortLeaveScreen,
    name: RoutePaths.addShortLeaveScreen,
    builder: (context, state) => BlocProvider<LeaveBloc>(
      create: (_) => GetIt.I<LeaveBloc>(),
      child: const AddShortLeaveScreen(),
    ),
  ),
  GoRoute(
    path: RoutePaths.addLeaveScreen,
    name: '/add_leave_screen',
    builder: (context, state) => const AddLeaveScreen(),
  ),

  GoRoute(
    path: RoutePaths.leaveBalance,
    name: RoutePaths.leaveBalance,
    builder: (context, state) => BlocProvider<LeaveBloc>(
      create: (_) => GetIt.I<LeaveBloc>(),
      child: const MyLeaveBalanceScreen(),
    ),
  ),
  GoRoute(
    path: RoutePaths.teamLeaveBalance,
    name: RoutePaths.teamLeaveBalance,
    builder: (context, state) => BlocProvider<LeaveBloc>(
      create: (_) => GetIt.I<LeaveBloc>(),
      child: const MyTeamLeavesScreen(),
    ),
  ),

  GoRoute(
    path: RoutePaths.editLeaveScreen,
    name: RoutePaths.editLeaveScreen,
    builder: (context, state) => BlocProvider<LeaveBloc>(
      create: (_) => GetIt.I<LeaveBloc>(),
      child: const EditLeave(),
    ),
  ),
];
