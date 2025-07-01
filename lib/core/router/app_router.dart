import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:myco_flutter/core/router/modules/take_order_routes.dart';
import 'package:myco_flutter/core/router/route_paths.dart';
import 'package:myco_flutter/features/bottom_navigation_bar/bloc/bottom_navigation_bar_bloc.dart';
import 'package:myco_flutter/features/bottom_navigation_bar/bottom_nav_bar.dart';
import 'package:myco_flutter/features/company_selector/presentation/bloc/company/company_bloc.dart';
import 'package:myco_flutter/features/company_selector/presentation/pages/select_company_page.dart';
import 'package:myco_flutter/features/dashboard/presentation/pages/dashboard_page.dart';
import 'package:myco_flutter/features/language_selector/presentation/pages/language_selector_page.dart';
import 'package:myco_flutter/features/sign_in/presentation/pages/otp_dialog.dart';
import 'package:myco_flutter/features/splash/presentation/bloc/splash_bloc.dart';
import 'package:myco_flutter/features/splash/presentation/pages/splash_page.dart';
import 'package:myco_flutter/features/take_order/presentation/bloc/take_order_bloc.dart';
import 'package:myco_flutter/features/take_order/presentation/pages/take_order_page.dart';

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
        path: RoutePaths.login,
        name: 'login',
        builder: (context, state) => const OtpVerifyDialog(),
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

      // Take Order Route
      ShellRoute(
        builder: (context, state, child) => MultiBlocProvider(
          providers: [BlocProvider(create: (context) => TakeOrderBloc())],
          child: child,
        ),
        routes: [
          GoRoute(
            path: RoutePaths.takeOrder,
            name: 'take-order',
            builder: (context, state) => BlocProvider(
              create: (_) => TakeOrderBloc(),
              child: TakeOrderPage(),
            ),
            routes: takeOrderRoutes,
          ),
        ],
      ), // Add all modular routes here
      // ...authRoutes,
      // ...homeRoutes,
    ],
    // errorBuilder: (context, state) => const ErrorScreen(),
  );
}
