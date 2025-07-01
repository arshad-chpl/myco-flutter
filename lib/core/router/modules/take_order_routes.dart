import 'package:go_router/go_router.dart';
import 'package:myco_flutter/core/router/route_paths.dart';
import 'package:myco_flutter/features/take_order/presentation/pages/all_distributor_page.dart';
import 'package:myco_flutter/features/take_order/presentation/pages/distributor_visitor_page.dart';
import 'package:myco_flutter/features/take_order/presentation/pages/edit_order_page.dart';
import 'package:myco_flutter/features/take_order/presentation/pages/no_order_page.dart';
import 'package:myco_flutter/features/take_order/presentation/pages/offers_page.dart';
import 'package:myco_flutter/features/take_order/presentation/pages/order_history_page.dart';
import 'package:myco_flutter/features/take_order/presentation/pages/order_summary_page.dart';
import 'package:myco_flutter/features/take_order/presentation/pages/products_page.dart';

List<RouteBase> takeOrderRoutes = [
  GoRoute(
    path: RoutePaths.offers,
    name: 'offers',
    builder: (context, state) => OffersPage(),
  ),

  GoRoute(
    path: RoutePaths.products,
    name: 'products',
    builder: (context, state) => const ProductsPage(),
  ),
  GoRoute(
    path: RoutePaths.orderSummary,
    name: 'order-summary',
    builder: (context, state) {
      final bool isRepeatOrder = state.extra as bool? ?? false;
      return OrderSummaryPage(isRepeatOrder: isRepeatOrder);
    },
  ),
  GoRoute(
    path: RoutePaths.allDistributor,
    name: 'all-distributor',
    builder: (context, state) => const AllDistributorPage(),
  ),
  GoRoute(
    path: RoutePaths.orderHistory,
    name: 'order-history',
    builder: (context, state) => const OrderHistoryPage(),
  ),
  GoRoute(
    path: RoutePaths.editOrder,
    name: 'edit-order',
    builder: (context, state) => const EditOrderPage(),
  ),
  GoRoute(
    path: RoutePaths.distributorVisitor,
    name: 'distributor-visitor',
    builder: (context, state) => const DistributorVisitorPage(),
  ),
  GoRoute(
    path: RoutePaths.noOrder,
    name: 'no-order',
    builder: (context, state) => const NoOrderPage(),
  ),
];
