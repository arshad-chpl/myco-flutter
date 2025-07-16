import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:myco_flutter/core/router/route_paths.dart';
import 'package:myco_flutter/features/custom_bloc/tab-bar/bloc/tabbar_bloc.dart';
import 'package:myco_flutter/features/take_order/presentation/bloc/take_order_bloc.dart';
import 'package:myco_flutter/features/take_order/presentation/pages/all_distributor_page.dart';
import 'package:myco_flutter/features/take_order/presentation/pages/distributor_visitor_page.dart';
import 'package:myco_flutter/features/take_order/presentation/pages/edit_order_page.dart';
import 'package:myco_flutter/features/take_order/presentation/pages/no_order_page.dart';
import 'package:myco_flutter/features/take_order/presentation/pages/offers_page.dart';
import 'package:myco_flutter/features/take_order/presentation/pages/order_history_page.dart';
import 'package:myco_flutter/features/take_order/presentation/pages/order_summary_page.dart';
import 'package:myco_flutter/features/take_order/presentation/pages/products_page.dart';
import 'package:myco_flutter/features/take_order/presentation/pages/take_order_page.dart';

List<RouteBase> takeOrderRoutes = [
  // Take Order Route
  ShellRoute(
    builder: (context, state, child) => MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => TakeOrderBloc()),
        BlocProvider(create: (context) => TabbarBloc()),
      ],
      child: child,
    ),
    routes: [
      GoRoute(
        path: RoutePaths.takeOrder,
        name: RoutePaths.takeOrder,
        builder: (context, state) => const TakeOrderPage(),
        routes: [
          GoRoute(
            path: RoutePaths.offers,
            name: RoutePaths.offers,
            builder: (context, state) => OffersPage(),
          ),

          GoRoute(
            path: RoutePaths.products,
            name: RoutePaths.products,
            builder: (context, state) => const ProductsPage(),
          ),
          GoRoute(
            path: RoutePaths.orderSummary,
            name: RoutePaths.orderSummary,
            builder: (context, state) {
              final bool isRepeatOrder = state.extra as bool? ?? false;
              return OrderSummaryPage(isRepeatOrder: isRepeatOrder);
            },
          ),
          GoRoute(
            path: RoutePaths.allDistributor,
            name: RoutePaths.allDistributor,
            builder: (context, state) => const AllDistributorPage(),
          ),
          GoRoute(
            path: RoutePaths.orderHistory,
            name: RoutePaths.orderHistory,
            builder: (context, state) => const OrderHistoryPage(),
          ),
          GoRoute(
            path: RoutePaths.editOrder,
            name: RoutePaths.editOrder,
            builder: (context, state) => const EditOrderPage(),
          ),
          GoRoute(
            path: RoutePaths.distributorVisitor,
            name: RoutePaths.distributorVisitor,
            builder: (context, state) => const DistributorVisitorPage(),
          ),
          GoRoute(
            path: RoutePaths.noOrder,
            name: RoutePaths.noOrder,
            builder: (context, state) => const NoOrderPage(),
          ),
        ],
      ),
    ],
  ),
];
