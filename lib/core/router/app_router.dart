import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:myco_flutter/core/router/modules/take_order_routes.dart';
import 'package:myco_flutter/core/router/route_paths.dart';
import 'package:myco_flutter/features/company_selector/presentation/bloc/company/company_bloc.dart';
import 'package:myco_flutter/features/company_selector/presentation/bloc/company/company_event.dart';
import 'package:myco_flutter/features/company_selector/presentation/pages/select_company_page.dart';
import 'package:myco_flutter/features/idea_box/presentation/bloc/list_idea_bloc.dart';
import 'package:myco_flutter/features/idea_box/presentation/pages/idea_request.dart';
import 'package:myco_flutter/features/idea_box/presentation/pages/list_of_ideas.dart';
import 'package:myco_flutter/features/dashboard/presentation/pages/dashboard_page.dart';
import 'package:myco_flutter/features/language_selector/presentation/pages/language_selector_page.dart';
import 'package:myco_flutter/features/payslip/presentation/pages/payslip_detail.dart';
import 'package:myco_flutter/features/payslip/presentation/pages/payslip_page.dart';
import 'package:myco_flutter/features/payslip/presentation/pages/salary_break_up_page.dart';
import 'package:myco_flutter/features/leave/presentation/pages/leave_screen.dart';
import 'package:myco_flutter/features/sign_in/presentation/pages/otp_dialog.dart';
import 'package:myco_flutter/features/sign_in/presentation/pages/sign_up_form_page.dart';
import 'package:myco_flutter/features/splash/presentation/bloc/splash_bloc.dart';
import 'package:myco_flutter/features/search_company/presentation/pages/get_started.dart';
import 'package:myco_flutter/features/search_company/presentation/pages/search_company.dart';
import 'package:myco_flutter/features/search_company/presentation/pages/select_company.dart';
import 'package:myco_flutter/features/splash/presentation/pages/splash_page.dart';
import 'package:myco_flutter/features/take_order/presentation/bloc/take_order_bloc.dart';
import 'package:myco_flutter/features/take_order/presentation/pages/take_order_page.dart';
import 'package:myco_flutter/features/visit/presentation/bloc/visit_bloc.dart';
import 'package:myco_flutter/features/visit/presentation/pages/my_visit_page.dart';
import 'route_paths.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

class AppRouter {
  final GoRouter router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: RoutePaths.myVisit,
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
      GoRoute(
        path: RoutePaths.dashboard,
        name: 'dashboard',
        builder: (context, state) => DashBoardPage(),
      ),


      ShellRoute(
        builder: (context, state, child) => MultiBlocProvider(
          providers: [BlocProvider(create: (context) => ListIdeaBloc())],
          child: child,
        ),
        routes: [
          GoRoute(
            path: RoutePaths.ideabox,
            name: 'idea-box',
            builder: (context, state) => BlocProvider(
              create: (context) => ListIdeaBloc(),
              child: ListOfIdeas(),
            ),
          ),
          GoRoute(
            path: RoutePaths.ideaRequest,
            name: '/idea-request',
            builder: (context, state) => IdeaRequest(),
          ),
        ],
      ),
      GoRoute(
        path: RoutePaths.leave,
        name: 'leave',
        builder: (context, state) => const LeaveScreen(),
      ),
      GoRoute(
        path: RoutePaths.myVisit,
        name: 'myVisit',
        builder: (context, state) => BlocProvider(
          create: (_) => GetIt.I<VisitBloc>(),
          child: const MyVisitPage(),
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
              child: const TakeOrderPage(),
            ),
            routes: takeOrderRoutes,
          ),
        ],

      ), // Add all modular routes here


      GoRoute(
        path: RoutePaths.signUpForm,
        name: 'select-other-company',
        builder: (context, state) => SignupFormPage(),

      ),
       GoRoute(
        path: RoutePaths.getStarted,
        name: 'get-started',
        builder: (context, state) => const GetStarted(),
      ),
      GoRoute(
        path: RoutePaths.companySearch,
        name: 'companySearch',
        builder: (context, state) => const SearchCompanyScreen(),
      ),
      GoRoute(
        path: RoutePaths.payslip,
        name: 'payslip',
        builder: (context, state) => const PayslipPage(),
        routes: [
          GoRoute(
            path: RoutePaths.salaryBreakUp,
            name: 'salary-break-up',
            builder: (context, state) => const SalaryBreakUpPage(),
          ),
          GoRoute(
            path: RoutePaths.payslipDetail,
            name: 'payslip-detail',
            builder: (context, state) => const PayslipDetail(),
          ),
        ],
      ),

      // Add all modular routes here
      // ...authRoutes,
      // ...homeRoutes,
    ],
    // errorBuilder: (context, state) => const ErrorScreen(),
  );
}
