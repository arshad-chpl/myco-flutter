import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:myco_flutter/core/router/modules/admin_view_routes.dart';
import 'package:myco_flutter/core/router/modules/dashboard_routes.dart';
import 'package:myco_flutter/core/router/modules/payslip_routes.dart';
import 'package:myco_flutter/core/router/modules/chat_routes.dart';
import 'package:myco_flutter/core/router/modules/take_order_routes.dart';
import 'package:myco_flutter/core/router/route_paths.dart';
import 'package:myco_flutter/features/admin_view/presentation/bloc/admin_view_bloc.dart';
import 'package:myco_flutter/features/admin_view/presentation/pages/admin_view_page.dart';
import 'package:myco_flutter/features/asset/bloc/assets_bloc.dart';
import 'package:myco_flutter/features/asset/view/add_assets.dart';
import 'package:myco_flutter/features/asset/view/assets_details_page.dart';
import 'package:myco_flutter/features/asset/view/assets_home_page.dart';
import 'package:myco_flutter/features/asset/view/edit_assets_page.dart';
import 'package:myco_flutter/features/asset/view/handover_assets.dart';
import 'package:myco_flutter/features/asset/view/qr_scanner_page.dart';
// import 'package:myco_flutter/features/asset/view/testing.dart';
import 'package:myco_flutter/features/company_info/presentation/bloc/company_info_bloc.dart';
import 'package:myco_flutter/features/company_info/presentation/bloc/company_info_event.dart';
import 'package:myco_flutter/features/company_info/presentation/pages/company_info_page.dart';
import 'package:myco_flutter/features/asset/view/swap_assets.dart';
import 'package:myco_flutter/features/asset/view/takeover_asset.dart';
import 'package:myco_flutter/features/chat/presentation/bloc/chat_bloc.dart';
import 'package:myco_flutter/features/chat/presentation/page/chat_list.dart';
import 'package:myco_flutter/features/chat/presentation/page/chat_screen.dart';
import 'package:myco_flutter/features/chat/presentation/page/groupe_detail.dart';
import 'package:myco_flutter/features/company_selector/presentation/bloc/company/company_bloc.dart';
import 'package:myco_flutter/features/company_selector/presentation/pages/select_company_page.dart';
import 'package:myco_flutter/features/custom_bloc/tab-bar/bloc/tabbar_bloc.dart';
import 'package:myco_flutter/features/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'package:myco_flutter/features/dashboard/presentation/pages/dashboard_page.dart';
import 'package:myco_flutter/features/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'package:myco_flutter/features/dashboard/presentation/pages/dashboard_page.dart';
import 'package:myco_flutter/features/holiday/presentation/pages/holiday_list_page.dart';
import 'package:myco_flutter/features/dashboard/presentation/pages/my_profile_page.dart';
import 'package:myco_flutter/features/employees/presentation/pages/employees_screen.dart';
import 'package:myco_flutter/features/idea_box/presentation/bloc/list_idea_bloc.dart';
import 'package:myco_flutter/features/idea_box/presentation/pages/idea_request.dart';
import 'package:myco_flutter/features/idea_box/presentation/pages/list_of_ideas.dart';
import 'package:myco_flutter/features/language_selector/presentation/bloc/language_bloc.dart';
import 'package:myco_flutter/features/language_selector/presentation/bloc/language_event.dart';
import 'package:myco_flutter/features/language_selector/presentation/pages/language_selector_page.dart';
import 'package:myco_flutter/features/leave/presentation/pages/add_leave_screen.dart';
import 'package:myco_flutter/features/leave/presentation/bloc/leave_bloc.dart';

import 'package:myco_flutter/features/language_selector/presentation/pages/language_selector_page.dart';
import 'package:myco_flutter/features/language_selector/presentation/bloc/language_bloc.dart';
import 'package:myco_flutter/features/language_selector/presentation/bloc/language_event.dart';
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

import 'package:myco_flutter/features/payslip/presentation/pages/payslip_page.dart';

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
      GoRoute(
        path: RoutePaths.splash,
        name: 'splash',
        builder: (context, state) => MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (_) => GetIt.I<SplashBloc>()..add(LoadSplash()),
            ),
            BlocProvider(
              create: (_) =>
                  GetIt.I<LanguageBloc>()..add(LoadLanguageToPreferences()),
              lazy: false,
            ),
          ],
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
        name: RoutePaths.login,
        builder: (context, state) => const OtpVerifyDialog(),
      ),
      // GoRoute(
      //   path: RoutePaths.details,
      //   name: 'details',
      //   builder: (context, state) => const DetailsPage(),
      // ),
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
      ...DashboardRoutes,

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
            builder: (context, state) => const IdeaRequest(),
          ),
        ],
      ),
      GoRoute(
        path: RoutePaths.leave,
        name: RoutePaths.leave,
        builder: (context, state) => BlocProvider<LeaveBloc>(
          create: (_) => GetIt.I<LeaveBloc>(),
          child: const LeaveScreen(),
        ),
      ),
      GoRoute(
        path: RoutePaths.companyInfo,
        name: 'company-info',
        builder: (context, state) => BlocProvider<CompanyInfoBloc>(
          create: (_) => GetIt.I<CompanyInfoBloc>(),
          child: const CompanyInfoPage(),
        ),
      ),
      GoRoute(
        path: RoutePaths.holiday,
        name: RoutePaths.holiday,
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
        path: RoutePaths.myVisit,
        name: 'my-visit',
        builder: (context, state) => BlocProvider(
          create: (_) => GetIt.I<VisitBloc>(),
          child: const MyVisitPage(),
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

      GoRoute(
        path: RoutePaths.faceDetection,
        name: 'faceDetection',
        pageBuilder: (context, state) => MaterialPage(
              child: BlocProvider(
                  create: (context) =>
                GetIt.I<FaceDetectionBloc>()
                ..add(LaunchCamera()),
                child: const FaceDetectionPage(),
              )
          ),
        // builder: (context, state) => BlocProvider(
        //   create: (context) =>
        //   GetIt.I<FaceDetectionBloc>()
        //     ..add(LaunchCamera()),
        //   child: const FaceDetectionPage(),
        // ),
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
        builder: (context, state) => const SignupFormPage(),
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
        path: RoutePaths.employees,
        name: 'employees',
        builder: (context, state) => const EmployeesScreen(),
      ),
      GoRoute(
        path: RoutePaths.contactAdmin,
        name: 'contact-admin',
        builder: (context, state) => const ContactAdminPage(),
      ),
      GoRoute(
        path: RoutePaths.addCustomer,
        name: 'addCustomer',
        builder: (context, state) => const AddCustomer(),
      ),

      GoRoute(
        path: RoutePaths.AddExpense,
        name: 'addExpense',
        builder: (context, state) => const AddExpensePage(),
      ),
      GoRoute(
        path: RoutePaths.lostAndFoundAddScreen,
        name: 'lost-and-found-add-screen',
        builder: (context, state) => const LostAndFoundAddScreen(),
      ),

      GoRoute(
        path: RoutePaths.lostAndFoundChatScreen,
        name: 'lost-and-found-chat-screen',
        builder: (context, state) => ChatScreen(),
      ),
      //TODO
      GoRoute(
        path: RoutePaths.lostAndFoundItemDetails,
        name: 'lost-and-found-item-details',
        builder: (context, state) {
          LostAndFoundItemModel lostitem = state.extra as LostAndFoundItemModel;
          return ItemDetailsScreen(item: lostitem);
        },
      ),

      GoRoute(
        path: RoutePaths.lostAndFound,
        name: 'lost-and-found',
        builder: (context, state) => const LostAndFound(),
      ),
      GoRoute(
        path: RoutePaths.CustomerAddNewVisit,
        name: 'CustomerAddNewVisit',
        builder: (context, state) => const CustomerAddNewVisit(),
      ),

      GoRoute(
        path: RoutePaths.viewVisitDetails,
        name: 'view-visit-details',
        builder: (context, state) => const ViewVisitDetailsPage(),
      ),
      GoRoute(
        path: RoutePaths.myProfile,
        name: 'my-profile',
        builder: (context, state) => const MyProfilePage(),
      ),
      GoRoute(
        path: RoutePaths.adminView,
        name: RoutePaths.adminView,
        builder: (context, state) => BlocProvider(
          create: (_) => GetIt.I<AdminViewBloc>(),
          child: const AdminViewPage(),
        ),
        routes: adminViewRoutes,
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
     ...cahatRoutes,

      GoRoute(
        path: RoutePaths.assetsHome,
        name: 'assets-home',
        builder: (context, state) => MultiBlocProvider(
          providers: [
            BlocProvider<AssetsTabBloc>(create: (_) => AssetsTabBloc()),
            BlocProvider<AssetsFilterBloc>(create: (_) => AssetsFilterBloc()),
          ],
          child: const AssetsHomePage(),
        ),
      ),

      GoRoute(
        path: RoutePaths.qrScanner,
        name: 'qr-scanner',
        builder: (context, state) => const QRScannerPage(),
      ),
      GoRoute(
        path: RoutePaths.addVisit,
        name: 'add-visit',
        builder: (context, state) => const AddNewVisit(),
      ),
      GoRoute(
        path: RoutePaths.assetsDetails,
        name: 'assets-details',
        builder: (context, state) => const AssetsDetailsPage(),
      ),
      GoRoute(
        path: RoutePaths.addAssets,
        name: 'add-assets',
        builder: (context, state) => const AddAssets(),
      ),
      GoRoute(
        path: RoutePaths.editAssets,
        name: 'edit-assets',
        builder: (context, state) => const EditAssetsPage(),
      ),
      GoRoute(
        path: RoutePaths.handoverAssets,
        name: 'handover-assets',
        builder: (context, state) => const HandoverAssetsPage(),
      ),
      GoRoute(
        path: RoutePaths.takeoverAssets,
        name: 'takeover-assets',
        builder: (context, state) => const TakeoverAssets(),
      ),
      GoRoute(
        path: RoutePaths.swapAssets,
        name: 'swap-assets',
        builder: (context, state) => const SwapAssetsPage(),
      ),
      // Add all modular routes here
      // ...authRoutes,
      // ...homeRoutes,
    ],
    // errorBuilder: (context, state) => const ErrorScreen(),
  );
}
