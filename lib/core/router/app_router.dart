import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:myco_flutter/core/router/modules/admin_view_routes.dart';
import 'package:myco_flutter/core/router/modules/assets_routes.dart';
import 'package:myco_flutter/core/router/modules/chat_routes.dart';
import 'package:myco_flutter/core/router/modules/dashboard_routes.dart';
import 'package:myco_flutter/core/router/modules/leave_routes.dart';
import 'package:myco_flutter/core/router/modules/my_visit_routes.dart';
import 'package:myco_flutter/core/router/modules/payslip_routes.dart';
import 'package:myco_flutter/core/router/modules/take_order_routes.dart';
import 'package:myco_flutter/core/router/modules/work_allocation_routes.dart';
import 'package:myco_flutter/core/router/route_paths.dart';
import 'package:myco_flutter/features/company_info/presentation/bloc/company_info_bloc.dart';
import 'package:myco_flutter/features/company_info/presentation/pages/company_info_page.dart';
import 'package:myco_flutter/features/company_selector/presentation/bloc/company/company_bloc.dart';
import 'package:myco_flutter/features/company_selector/presentation/pages/select_company_page.dart';
import 'package:myco_flutter/features/dashboard/presentation/pages/my_profile_page.dart';
import 'package:myco_flutter/features/employees/presentation/pages/employees_screen.dart';
import 'package:myco_flutter/features/holiday/presentation/pages/holiday_list_page.dart';
import 'package:myco_flutter/features/idea_box/presentation/bloc/list_idea_bloc.dart';
import 'package:myco_flutter/features/idea_box/presentation/pages/idea_request.dart';
import 'package:myco_flutter/features/idea_box/presentation/pages/list_of_ideas.dart';
import 'package:myco_flutter/features/language_selector/presentation/bloc/language_bloc.dart';
import 'package:myco_flutter/features/language_selector/presentation/bloc/language_event.dart';
import 'package:myco_flutter/features/language_selector/presentation/pages/language_selector_page.dart';
import 'package:myco_flutter/features/lost_and_found/model/lost_and_found_item_model.dart';
import 'package:myco_flutter/features/lost_and_found/presentation/pages/add_screen.dart';
import 'package:myco_flutter/features/lost_and_found/presentation/pages/chat_screen.dart';
import 'package:myco_flutter/features/lost_and_found/presentation/pages/item_details_screen.dart';
import 'package:myco_flutter/features/lost_and_found/presentation/pages/lost_and_found.dart';
import 'package:myco_flutter/features/my_visit/presentation/bloc/face_detection_bloc/face_detection_bloc.dart';
import 'package:myco_flutter/features/my_visit/presentation/pages/face_detection_page.dart';
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
    initialLocation: RoutePaths.splash,
    // Don't change this line keep it as is [RoutePaths.splash] rs 500 penalty if anyone changes it
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
      ...leaveRoutes,
      ...takeOrderRoutes,
      ...payslipRoutes,
      ...chatRoutes,

      GoRoute(
        path: RoutePaths.faceDetection,
        name: 'faceDetection',
        pageBuilder: (context, state) => MaterialPage(
          child: BlocProvider(
            create: (context) =>
                GetIt.I<FaceDetectionBloc>()..add(LaunchCamera()),
            child: const FaceDetectionPage(),
          ),
        ),
      ),
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

      ...myVisitRoutes,

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
        path: RoutePaths.myProfile,
        name: 'my-profile',
        builder: (context, state) => const MyProfilePage(),
      ),
      ...adminViewRoutes,
      ...assetsRoutes,
      ...WorkAllocationRoutes,

      // Add all modular routes here
      // ...authRoutes,
      // ...homeRoutes,
    ],
    // errorBuilder: (context, state) => const ErrorScreen(),
  );
}
