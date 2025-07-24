import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:myco_flutter/core/services/preference_manager.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/dashboard/domain/entites/home_menu_response_entity.dart';
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
            ElevatedButton(
              onPressed: () {
                context.pushNamed('employees');
              },
              child: const Icon(Icons.person, color: Colors.blue),
            ),
            // Body content
            Expanded(
              child: BlocBuilder<DashboardBloc, DashboardState>(
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
                  if (state is AppMenuGridLoaded) {
                    final responseData = state.res;
                    // Based on screen size, build the appropriate layout
                    return Responsive.getWidth(context) > 600
                        ? _tabview(context, responseData)
                        : _mobileView(context, responseData);
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

  Widget _tabview(BuildContext context, HomeMenuResponseEntity homeData) => Row(
    children: [
      Expanded(
        child: SingleChildScrollView(
          child: Column(
            spacing: 16,
            children: [
              // timer and slider section
              timerAndSlider(context, homeData.slider ?? [], homeData),

              // Circulars and discussion section
              BigHomeMenu(appMenuBig: homeData.appmenuBig ?? []),
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
              QuickActionSection(appMenuHome: homeData.appmenuHome),

              // Upcoming Celebrations Section
              const UpcomingCelebrationSection(),
            ],
          ),
        ),
      ),
    ],
  );

  Widget _mobileView(BuildContext context, HomeMenuResponseEntity homeData) =>
      SingleChildScrollView(
        child: Column(
          spacing: 16,
          children: [
            // timer and slider section
            timerAndSlider(context, homeData.slider ?? [], homeData),

            // Circulars and discussion section
            BigHomeMenu(appMenuBig: homeData.appmenuBig ?? []),
            // My Team Section
            const MyTeamSection(),

            // Quick Access Section
            QuickActionSection(appMenuHome: homeData.appmenuHome),

            // Upcoming Celebrations Section
            const UpcomingCelebrationSection(),

            //Your Department Section
            //Your Department Section
            const YourDepartmentSection(),

            // Moments Section
            const MomentsSection(),
          ],
        ),
      );
}
