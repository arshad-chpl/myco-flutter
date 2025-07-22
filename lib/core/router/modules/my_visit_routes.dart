import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:myco_flutter/core/router/route_paths.dart';
import 'package:myco_flutter/features/my_visit/presentation/bloc/visit_bloc.dart';
import 'package:myco_flutter/features/my_visit/presentation/pages/add_customer.dart';
import 'package:myco_flutter/features/my_visit/presentation/pages/add_expense_page.dart';
import 'package:myco_flutter/features/my_visit/presentation/pages/add_new_visit.dart';
import 'package:myco_flutter/features/my_visit/presentation/pages/customer_add_new_visit.dart';
import 'package:myco_flutter/features/my_visit/presentation/pages/customer_card_type.dart';
import 'package:myco_flutter/features/my_visit/presentation/pages/my_visit_page.dart';
import 'package:myco_flutter/features/my_visit/presentation/pages/view_visit_details_page.dart';
import 'package:myco_flutter/features/my_visit/presentation/pages/visit_report.dart';

List<RouteBase> myVisitRoutes = [

  // My Visit Route
  ShellRoute(
    builder: (context, state, child) => child,
    routes: [
      GoRoute(
        path: RoutePaths.addCustomer,
        name: 'addCustomer',
        builder: (context, state) => const AddCustomer(),
      ),

      GoRoute(
        path: RoutePaths.customerPage,
        name: 'customerPage',
        builder: (context, state) => const CustomerPage(),
      ),

      GoRoute(
        path: RoutePaths.CustomerAddNewVisit,
        name: 'CustomerAddNewVisit',
        builder: (context, state) => const CustomerAddNewVisit(),
      ),

      GoRoute(
        path: RoutePaths.AddExpense,
        name: 'addExpense',
        builder: (context, state) => const AddExpensePage(),
      ),

      GoRoute(
        path: RoutePaths.myVisit,
        name: 'my-visit',
        builder: (context, state) => BlocProvider(
          create: (_) => GetIt.I<VisitBloc>(),
          child: const MyVisitPage(),
        ),
      ),

      GoRoute(
        path: RoutePaths.viewVisitDetails,
        name: 'view-visit-details',
        builder: (context, state) => const ViewVisitDetailsPage(),
      ),

      GoRoute(
        path: RoutePaths.visitReport,
        name: 'visit_report',
        builder: (context, state) => const VisitReport(),
      ),

      GoRoute(
        path: RoutePaths.addVisit,
        name: 'add-visit',
        builder: (context, state) => const AddNewVisit(),
      ),
    ],
  ),
];