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
import 'package:myco_flutter/core/router/modules/employee_view_routes.dart';
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
import 'package:myco_flutter/features/custom_bloc/tab-bar/bloc/tabbar_bloc.dart';
import 'package:myco_flutter/features/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'package:myco_flutter/features/dashboard/presentation/pages/dashboard_page.dart';
import 'package:myco_flutter/features/dashboard/presentation/pages/my_profile_page.dart';
import 'package:myco_flutter/features/employees/presentation/pages/employees_screen.dart';
import 'package:myco_flutter/features/holiday/presentation/pages/holiday_list_page.dart';
import 'package:myco_flutter/features/holiday/presentation/pages/holiday_list_page.dart';
import 'package:myco_flutter/features/idea_box/presentation/bloc/list_idea_bloc.dart';
import 'package:myco_flutter/features/idea_box/presentation/pages/idea_request.dart';
import 'package:myco_flutter/features/idea_box/presentation/pages/list_of_ideas.dart';
import 'package:myco_flutter/features/language_selector/presentation/pages/language_selector_page.dart';
import 'package:myco_flutter/features/language_selector/presentation/bloc/language_bloc.dart';
import 'package:myco_flutter/features/language_selector/presentation/bloc/language_event.dart';
import 'package:myco_flutter/features/leave/presentation/pages/add_leave_screen.dart';
import 'package:myco_flutter/features/language_selector/presentation/pages/language_selector_page.dart';

import 'package:myco_flutter/features/employees/presentation/pages/employees_screen.dart';
import 'package:myco_flutter/features/holiday/presentation/pages/holiday_list_page.dart';

import 'package:myco_flutter/features/leave/presentation/bloc/leave_bloc.dart';
import 'package:myco_flutter/features/leave/presentation/pages/add_leave_screen.dart';
import 'package:myco_flutter/features/leave/presentation/pages/add_short_leave_screen.dart';
import 'package:myco_flutter/features/leave/presentation/pages/leave_screen.dart';
import 'package:myco_flutter/features/leave/presentation/pages/my_leave_balance_screen.dart';
import 'package:myco_flutter/features/leave/presentation/pages/my_team_leaves_screen.dart';

import 'package:myco_flutter/features/lost_and_found/model/lost_and_found_item_model.dart';
import 'package:myco_flutter/features/lost_and_found/presentation/pages/add_screen.dart';
import 'package:myco_flutter/features/lost_and_found/presentation/pages/chat_screen.dart';
import 'package:myco_flutter/features/lost_and_found/presentation/pages/item_details_screen.dart';

import 'package:myco_flutter/features/my_visit/presentation/bloc/visit_with_bloc/Department_tag_bloc/Input_Tag_bloc.dart';
import 'package:myco_flutter/features/my_visit/presentation/pages/assigned_to.dart';
import 'package:myco_flutter/features/my_visit/presentation/pages/visit.dart';

import 'package:myco_flutter/features/my_visit/presentation/bloc/visit_with_bloc/Department_tag_bloc/Input_Tag_bloc.dart';
import 'package:myco_flutter/features/my_visit/presentation/pages/assigned_to.dart';
import 'package:myco_flutter/features/my_visit/presentation/pages/face_detection_page.dart';
import 'package:myco_flutter/features/my_visit/presentation/pages/visit.dart';

import 'package:myco_flutter/features/lost_and_found/presentation/pages/lost_and_found.dart';
import 'package:myco_flutter/features/my_visit/presentation/bloc/face_detection_bloc/face_detection_bloc.dart';
import 'package:myco_flutter/features/my_visit/presentation/bloc/visit_bloc/visit_bloc.dart';
import 'package:myco_flutter/features/my_visit/presentation/pages/add_customer.dart';
import 'package:myco_flutter/features/my_visit/presentation/pages/add_expense_page.dart';
import 'package:myco_flutter/features/my_visit/presentation/pages/add_new_visit.dart';

import 'package:myco_flutter/features/my_visit/presentation/pages/customer_add_new_visit.dart';
import 'package:myco_flutter/features/my_visit/presentation/pages/assign_to_visit.dart';
import 'package:myco_flutter/features/my_visit/presentation/pages/customer_add_new_visit.dart';

import 'package:myco_flutter/features/my_visit/presentation/pages/assign_to_visit.dart';
import 'package:myco_flutter/features/my_visit/presentation/pages/customer_add_new_visit.dart';

import 'package:myco_flutter/features/my_visit/presentation/pages/customer_add_new_visit.dart';
import 'package:myco_flutter/features/my_visit/presentation/pages/my_visit_page.dart';
import 'package:myco_flutter/features/my_visit/presentation/pages/view_visit_details_page.dart';
import 'package:myco_flutter/features/my_visit/presentation/pages/visit_report.dart';
import 'package:myco_flutter/features/leave/presentation/pages/add_short_leave_screen.dart';
import 'package:myco_flutter/features/leave/presentation/pages/my_leave_balance_screen.dart';
import 'package:myco_flutter/features/leave/presentation/pages/my_team_leaves_screen.dart';
import 'package:myco_flutter/features/payslip/presentation/pages/payslip_detail.dart';
import 'package:myco_flutter/features/payslip/presentation/pages/payslip_page.dart';
import 'package:myco_flutter/features/my_visit/presentation/pages/visit_with.dart';
import 'package:myco_flutter/features/payslip/presentation/pages/payslip_detail.dart';
import 'package:myco_flutter/features/payslip/presentation/pages/payslip_page.dart';
import 'package:myco_flutter/features/payslip/presentation/pages/salary_break_up_page.dart';

import 'package:myco_flutter/features/search_company/presentation/pages/get_started.dart';
import 'package:myco_flutter/features/search_company/presentation/pages/search_company.dart';

import 'package:myco_flutter/features/sign_in/presentation/pages/contact_admin_page.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
    
class AppRouter {
  final GoRouter router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: RoutePaths.splash,
    // Don't change this line keep it as is [RoutePaths.splash] rs 500 penalty if anyone changes it
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
        name: 'BuildingDetailsVC',
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

      ...employeeRoute,
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
