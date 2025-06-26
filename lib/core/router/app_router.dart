import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:myco_flutter/features/company_selector/presentation/bloc/company/company_bloc.dart';
import 'package:myco_flutter/features/company_selector/presentation/pages/select_company_page.dart';
import 'package:myco_flutter/features/dashboard/presentation/pages/dashboard_page.dart';
import 'package:myco_flutter/features/language_selector/presentation/pages/language_selector_page.dart';
import 'package:myco_flutter/features/sign_in/presentation/pages/otp_dialog.dart';
import 'package:myco_flutter/features/splash/presentation/bloc/splash_bloc.dart';
import 'package:myco_flutter/features/splash/presentation/pages/splash_page.dart';
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
import 'route_paths.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

class AppRouter {
  final GoRouter router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: RoutePaths.login,
    observers: [
      // FirebaseAnalyticsObserver(analytics: FirebaseAnalytics.instance),
    ],
    routes: [
      GoRoute(
        path: RoutePaths.splash,
        name: 'splash',
        builder: (context, state) => BlocProvider(
          create: (_) => GetIt.I<SplashBloc>()..add(LoadSplash()),
          child: const SplashPage(),
        ),
      ),
      GoRoute(
        path: RoutePaths.language,
        name: 'language',
        builder: (context, state) => const LanguageSelectorPage(),
      ),
      GoRoute(
        path: RoutePaths.selectCompany,
        name: 'selectCompany',
        builder: (context, state) => BlocProvider(
          create: (context) => GetIt.I<CompanyBloc>(),
          child: const SelectCompanyPage(),
        ),
      ),
      // GoRoute(
      //   path: RoutePaths.language,
      //   name: 'language',
      //   builder: (context, state) => const LanguageSelectorPage(),
      // ),
      GoRoute(
        path: RoutePaths.takeOrder,
        name: 'take-order',
        builder: (context, state) => BlocProvider(
          create: (_) => TakeOrderBloc(),
          child: TakeOrderPage(),
        ),
        routes: [
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
            builder: (context, state) => BlocProvider(
              create: (_) => TakeOrderBloc(),
              child: const DistributorVisitorPage(),
            ),
          ),
          GoRoute(
            path: RoutePaths.noOrder,
            name: 'no-order',
            builder: (context, state) => const NoOrderPage(),
          ),
        ],
      ),

      GoRoute(
        path: RoutePaths.login,
        name: 'login',
        builder: (context, state) => const OtpVerifyDialog(),
      ),
      GoRoute(
        path: RoutePaths.dashboard,
        name: 'dashboard',
        builder: (context, state) => DashBoardPage(),
      ),
      // Add all modular routes here
      // ...authRoutes,
      // ...homeRoutes,
    ],
    // errorBuilder: (context, state) => const ErrorScreen(),
  );
}
