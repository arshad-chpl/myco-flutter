import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:myco_flutter/core/services/preference_manager.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/dashboard/domain/entites/home_menu_response_entity.dart';
import 'package:myco_flutter/features/dashboard/domain/entites/my_unit_request_entity.dart';
import 'package:myco_flutter/features/dashboard/domain/entites/my_unit_response_entity.dart';
import 'package:myco_flutter/features/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'package:myco_flutter/features/dashboard/presentation/widgets/big_home_menu.dart';
import 'package:myco_flutter/features/dashboard/presentation/widgets/dashboard_app_bar.dart';
import 'package:myco_flutter/features/dashboard/presentation/widgets/moments_section.dart';
import 'package:myco_flutter/features/dashboard/presentation/widgets/my_team_section.dart';
import 'package:myco_flutter/features/dashboard/presentation/widgets/quick_action_section.dart';
import 'package:myco_flutter/features/dashboard/presentation/widgets/timer_and_slider.dart';
import 'package:myco_flutter/features/dashboard/presentation/widgets/upcoming_celebration_section.dart';
import 'package:myco_flutter/features/dashboard/presentation/widgets/your_department_section.dart';

class DashBoardPage extends StatefulWidget {
  const DashBoardPage({super.key});

  @override
  State<DashBoardPage> createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {
  @override
  void initState() {
    super.initState();
    GetIdCardDetails();
    getMyUnits();
  }

  Future<void> GetIdCardDetails() async {
    Future.microtask(() async {
      final prefs = GetIt.I<PreferenceManager>();

      final userId = await prefs.getUserId();
      final companyId = await prefs.getCompanyId();
      final languageId = await prefs.getLanguageId();
      if (!mounted) return;
      // context.read<DashboardBloc>().add(
      //   GetIDCardDetails(
      //     userId: userId,
      //     companyId: companyId,
      //     languageId: languageId,
      //   ),
      // );
      context.read<DashboardBloc>().add(
        GetAppMenuGridWithCategory(
          getAppMenuGridWithCat: 'getAppMenuGridWithCategory',
          userId: userId,
          companyId: companyId,
          languageId: languageId,
          society_id: '1',
          city_id: '15449',
          state_id: '1558',
          country_id: '101',
          device: 'android',
          language_id: '1',
          unit_id: '21',
        ),
      );
    });
  }

  Future<void> getMyUnits() async {
    final prefs = GetIt.I<PreferenceManager>();
    final userId = await prefs.getUserId();
    final companyId = await prefs.getCompanyId();
    final languageId = await prefs.getLanguageId();
    final userMobile = await prefs.getUserMobileNo();
    context.read<DashboardBloc>().add(
      GetMyUnits(
        request: GetMyUnitsRequest(
          getMultiUnits: 'getMultiUnitsFast',
          userMobile: userMobile,
          countryCode: '+91',
          userId: userId,
          userToken:
              'f9ec646856dc88725cb1fabe66dc8c56d9189fba050458955e9f1bf5412e6bff8a8cd30bc8e98f58404268a34569f2616237627f9100bd692ddd46972a31f8af68a8dd2282d68fe6c7f173688568e2b52ef08bae18e90af872345f2dfda18df86570b0f6',
          companyId: companyId,
          languageId: languageId,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      backgroundColor: AppTheme.getColor(context).surface,

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 16,
          children: [
            // AppBar
            const DashboardAppBar(),
            // Body content
            Expanded(
              child: BlocBuilder<DashboardBloc, DashboardState>(
                // buildWhen: (previous, current) {
                //   if (previous is DashboardInitial) return true;
                //   if (current is DashboardLoaded &&
                //       previous is DashboardLoaded) {
                //     return previous.homeMenuData != current.homeMenuData;
                //   }
                //   return false;
                // },
                builder: (context, state) {
                  // Loading State
                  if (state is DashboardInitial) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  // Error State
                  if (state is DashboardError) {
                    return Center(
                      child: Text('Failed to load data: ${state.message}'),
                    );
                  }

                  // Loaded State
                  if (state is DashboardLoaded) {
                    // Now, we pass the data (or null) directly to the views.
                    // The views themselves will decide whether to show content or a loader.
                    return Responsive.getWidth(context) > 600
                        ? _tabview(
                            context,
                            state.homeMenuData,
                            state.myUnitData,
                          )
                        : _mobileView(
                            context,
                            state.homeMenuData,
                            state.myUnitData,
                          );
                  }

                  // Fallback for any other state
                  return const Center(child: Text('Something went wrong.'));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _tabview(
    BuildContext context,
    HomeMenuResponseEntity? homeData,
    MyUnitResponseEntity? myUnitData,
  ) => Row(
    children: [
      Expanded(
        child: SingleChildScrollView(
          child: Column(
            spacing: 16,
            children: [
              // timer and slider section
              if (homeData != null)
                timerAndSlider(context, homeData.slider ?? [], homeData),

              // Circulars and discussion section
              BigHomeMenu(appMenuBig: homeData?.appmenuBig ?? []),
              // My Team Section
              const MyTeamSection(),
              // Your Department Section
              const YourDepartmentSection(),
              const MomentsSection(),
            ],
          ),
        ),
      ),
      Expanded(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Quick Access Section
              if (homeData != null)
                QuickActionSection(appMenuHome: homeData.appmenuHome),

              // Upcoming Celebrations Section
              const UpcomingCelebrationSection(),
            ],
          ),
        ),
      ),
    ],
  );

  Widget _mobileView(
    BuildContext context,
    HomeMenuResponseEntity? homeData,
    MyUnitResponseEntity? myUnitData,
  ) => SingleChildScrollView(
    child: Column(
      spacing: 16,
      children: [
        // Sections dependent on homeData
        // Show a loader if homeData is not yet available.
        if (homeData != null) ...[
          timerAndSlider(context, homeData.slider ?? [], homeData),
          BigHomeMenu(appMenuBig: homeData.appmenuBig ?? []),
          QuickActionSection(appMenuHome: homeData.appmenuHome),
        ] else ...[
          const Center(child: CircularProgressIndicator()),
        ],

        // Sections dependent on myUnitData
        // Show a loader if myUnitData is not yet available.
        if (myUnitData != null) ...[
          MyTeamSection(myTeam: myUnitData.myTeam),
          UpcomingCelebrationSection(birthdays: myUnitData.todayBirthDays),
          YourDepartmentSection(members: myUnitData.member),
          MomentsSection(events: myUnitData.eventAlbum),
        ] else ...[
          // const Padding(
          //   padding: EdgeInsets.all(16.0),
          //   child: Center(child: CircularProgressIndicator(strokeWidth: 2)),
          // ),
        ],
      ],
    ),
  );
}
