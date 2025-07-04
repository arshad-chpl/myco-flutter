import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:myco_flutter/core/router/modules/take_order_routes.dart';
import 'package:myco_flutter/core/router/route_paths.dart';
import 'package:myco_flutter/features/company_selector/presentation/bloc/company/company_bloc.dart';
import 'package:myco_flutter/features/company_selector/presentation/bloc/company/company_event.dart';
import 'package:myco_flutter/features/company_selector/presentation/pages/select_company_page.dart';
import 'package:myco_flutter/features/dashboard/presentation/pages/dashboard_page.dart';
import 'package:myco_flutter/features/idea_box/presentation/bloc/list_idea_bloc.dart';
import 'package:myco_flutter/features/idea_box/presentation/pages/idea_request.dart';
import 'package:myco_flutter/features/idea_box/presentation/pages/list_of_ideas.dart';
import 'package:myco_flutter/features/dashboard/presentation/pages/dashboard_page.dart';
import 'package:myco_flutter/features/employees/presentation/pages/employees_screen.dart';
import 'package:myco_flutter/features/language_selector/presentation/pages/language_selector_page.dart';
import 'package:myco_flutter/features/my_visit/presentation/pages/visit.dart';
import 'package:myco_flutter/features/lost_and_found/presentation/pages/lost_and_found.dart';
import 'package:myco_flutter/features/my_visit/presentation/pages/add_customer.dart';
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
import 'package:myco_flutter/features/visits/presentation/pages/visit_report.dart';

import 'route_paths.dart';
import 'package:myco_flutter/features/visit/presentation/bloc/face_detection_bloc/face_detection_bloc.dart';
import 'package:myco_flutter/features/visit/presentation/pages/face_detection_page.dart';

import 'package:myco_flutter/features/visits/presentation/pages/details_page.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

class AppRouter {
  final GoRouter router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: RoutePaths.faceDetection,
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
        path: RoutePaths.addVisit,
        name: 'add visit',
        builder: (context, state) => const Visit(),
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
        path: RoutePaths.details,
        name: 'details',
        builder: (context, state) => const DetailsPage(),
      ),
      GoRoute(
        path: RoutePaths.visitReport,
        name: 'visit_report',
        builder: (context, state) => const VisitReport(),
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
      ),


      GoRoute(
        path: RoutePaths.faceDetection,
        name: 'faceDetection',
        builder: (context, state) => BlocProvider(
            create: (context) => GetIt.I<FaceDetectionBloc>()..add(LaunchCamera()),
          child: const FaceDetectionPage(),
        )
      ),
      // Add all modular routes here
     // Add all modular routes here
      // GoRoute(
      //   path: RoutePaths.takeOrder,
      //   name: 'take-order',
      //   builder: (context, state) => BlocProvider(
      //     create: (_) => TakeOrderBloc(),
      //     child: TakeOrderPage(),
      //   ),
      // ),
      GoRoute(
        path: RoutePaths.signUpForm,
        name: 'select-other-company',
        builder: (context, state) => SignupFormPage(),
      ),
      GoRoute(
        path: RoutePaths.lostAndFound,
        name: 'lost-and-found',
        builder: (context, state) => LostAndFound(),
      ),
      GoRoute(
        path: RoutePaths.getStarted,
        name: 'get-started',
        builder: (context, state) => const GetStarted(),
      ),
      GoRoute(
        path: RoutePaths.companySearch,
        name: 'companySearch',
        builder: (context, state) => const TermsAndConditions(),
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
      GoRoute(
        path: RoutePaths.employees,
        name: 'employees',
        builder: (context, state) => const EmployeesScreen(),
      ),
      GoRoute(
        path: RoutePaths.addCustomer,
        name: 'addCustomer',
        builder: (context, state) => const AddCustomer(),
      ),
      // Add all modular routes here
      // ...authRoutes,
      // ...homeRoutes,
    ],
    // errorBuilder: (context, state) => const ErrorScreen(),
  );
}
