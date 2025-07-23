import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:myco_flutter/core/router/modules/admin_view_routes.dart';
import 'package:myco_flutter/core/router/modules/assets_routes.dart';
import 'package:myco_flutter/core/router/modules/chat_routes.dart';
import 'package:myco_flutter/core/router/modules/dashboard_routes.dart';
import 'package:myco_flutter/core/router/modules/initial_routes.dart';
import 'package:myco_flutter/core/router/modules/lost_and_found.dart';
import 'package:myco_flutter/core/router/modules/my_profile.dart';
import 'package:myco_flutter/core/router/modules/my_visit_routes.dart';
import 'package:myco_flutter/core/router/modules/payslip_routes.dart';
import 'package:myco_flutter/core/router/modules/take_order_routes.dart';
import 'package:myco_flutter/core/router/modules/work_allocation_routes.dart';
import 'package:myco_flutter/core/router/route_paths.dart';
import 'package:myco_flutter/features/company_info/presentation/bloc/company_info_bloc.dart';
import 'package:myco_flutter/features/company_info/presentation/pages/company_info_page.dart';
import 'package:myco_flutter/features/company_selector/presentation/bloc/company/company_bloc.dart';
import 'package:myco_flutter/features/company_selector/presentation/pages/select_company_page.dart';
import 'package:myco_flutter/features/employees/presentation/pages/employees_screen.dart';
import 'package:myco_flutter/features/holiday/presentation/pages/holiday_list_page.dart';
import 'package:myco_flutter/features/idea_box/presentation/bloc/list_idea_bloc.dart';
import 'package:myco_flutter/features/idea_box/presentation/pages/idea_request.dart';
import 'package:myco_flutter/features/idea_box/presentation/pages/list_of_ideas.dart';
import 'package:myco_flutter/features/language_selector/presentation/bloc/language_bloc.dart';
import 'package:myco_flutter/features/language_selector/presentation/bloc/language_event.dart';
import 'package:myco_flutter/features/leave/presentation/pages/add_leave_screen.dart';
import 'package:myco_flutter/features/language_selector/presentation/pages/language_selector_page.dart';
import 'package:myco_flutter/features/leave/presentation/bloc/leave_bloc.dart';
import 'package:myco_flutter/features/leave/presentation/pages/add_short_leave_screen.dart';
import 'package:myco_flutter/features/leave/presentation/pages/leave_screen.dart';
import 'package:myco_flutter/features/leave/presentation/pages/my_leave_balance_screen.dart';
import 'package:myco_flutter/features/leave/presentation/pages/my_team_leaves_screen.dart';
import 'package:myco_flutter/features/search_company/presentation/pages/get_started.dart';
import 'package:myco_flutter/features/search_company/presentation/pages/search_company.dart';
import 'package:myco_flutter/features/sign_in/presentation/pages/contact_admin_page.dart';
import 'package:myco_flutter/features/sign_in/presentation/pages/otp_dialog.dart';
import 'package:myco_flutter/features/sign_in/presentation/pages/sign_up_form_page.dart';
import 'package:myco_flutter/features/splash/presentation/bloc/splash_bloc.dart';
import 'package:myco_flutter/features/splash/presentation/pages/splash_page.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

class AppRouter {
  final GoRouter router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: RoutePaths.splash, // Don't change this line keep it as is [RoutePaths.splash] rs 500 penalty if anyone changes it
    // initialLocation: RoutePaths.dashboard,
    observers: [
      // FirebaseAnalyticsObserver(analytics: FirebaseAnalytics.instance),
    ],
    routes: [
      ...InitialRoutes,

      // GoRoute(
      //   path: RoutePaths.details,
      //   name: 'details',
      //   builder: (context, state) => const DetailsPage(),
      // ),

      ...DashboardRoutes,

      GoRoute(
        path: RoutePaths.leave,
        name: RoutePaths.leave,
        builder: (context, state) => BlocProvider<LeaveBloc>(
          create: (_) => GetIt.I<LeaveBloc>(),
          child: const LeaveScreen(),
        ),
      ),
      GoRoute(
        path: RoutePaths.holiday,
        name: 'HolidayVC',
        builder: (context, state) {
          final controller = TextEditingController();
          return HolidayListPage(controller: controller);
        },
      ),
      GoRoute(
        path: RoutePaths.companyInfo,
        name: RoutePaths.companyInfo,
        builder: (context, state) => BlocProvider<CompanyInfoBloc>(
          create: (_) => GetIt.I<CompanyInfoBloc>(),
          child: const CompanyInfoPage(),
        ),
      ),

      GoRoute(
        path: RoutePaths.myLeaveBalanceScreen,
        name: '/my_leave_balance_screen',
        builder: (context, state) => const MyLeaveBalanceScreen(),
      ),
      GoRoute(
        path: RoutePaths.myTeamLeavesScreen,
        name: '/my_team_leaves_screen',
        builder: (context, state) => const MyTeamLeavesScreen(),
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
      // GoRoute(
      //   path: RoutePaths.language,
      //   name: 'language',
      //   builder: (context, state) => const LanguageSelectorPage(),
      // ),
      ...takeOrderRoutes,
      ...payslipRoutes,
      ...chatRoutes,

      GoRoute(
        path: RoutePaths.employees,
        name: 'employees',
        builder: (context, state) => const EmployeesScreen(),
      ),
      GoRoute(
        path: RoutePaths.contactAdmin,
        name: 'contact-admin',
        builder: (context, state) => const ContactAdminPage(),
      ),

      ...myVisitRoutes,

      ...LostAndFoundRoutes,

      ...adminViewRoutes,
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

      ...assetsRoutes,

      ...WorkAllocationRoutes,

      ...MyProfileRoutes,
      // Add all modular routes here
      // ...authRoutes,
      // ...homeRoutes,
    ],
    // errorBuilder: (context, state) => const ErrorScreen(),
  );
}