import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/dashboard/presentation/widgets/circular_and_discussion.dart';
import 'package:myco_flutter/features/dashboard/presentation/widgets/dashboard_app_bar.dart';
import 'package:myco_flutter/features/dashboard/presentation/widgets/moments_section.dart';
import 'package:myco_flutter/features/dashboard/presentation/widgets/my_team_section.dart';
import 'package:myco_flutter/features/dashboard/presentation/widgets/quick_action_section.dart';
import 'package:myco_flutter/features/dashboard/presentation/widgets/timer_and_slider.dart';
import 'package:myco_flutter/features/dashboard/presentation/widgets/upcoming_celebration_section.dart';
import 'package:myco_flutter/features/dashboard/presentation/widgets/your_department_section.dart';

class DashBoardPage extends StatelessWidget {
  const DashBoardPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    backgroundColor: AppTheme.getColor(context).surface,

    body: SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 16,
          children: [
            // AppBar
            DashboardAppBar(),

            // Body content
            Expanded(
              child: getWidth(context) > 600
                  ? _tabview(context)
                  : _mobileView(context),
            ),
          ],
        ),
      ),
    ),
  );

  Widget _tabview(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              spacing: 16,
              children: [
                // timer and slider section
                timerAndSlider(context),

                // Circulars and discussion section
                CircularAndDiscussion(),
                // My Team Section
                MyTeamSection(),
                // Your Department Section
                YourDepartmentSection(),
                MomentsSection(),
              ],
            ),
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Quick Access Section
                QuickActionSection(),

                // Upcoming Celebrations Section
                UpcomingCelebrationSection(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _mobileView(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        spacing: 16,
        children: [
          // timer and slider section
          timerAndSlider(context),

          // Circulars and discussion section
          CircularAndDiscussion(),
          // My Team Section
          MyTeamSection(),

          // Quick Access Section
          QuickActionSection(),

          // Upcoming Celebrations Section
          UpcomingCelebrationSection(),

          //Your Department Section
          YourDepartmentSection(),

          // Moments Section
          MomentsSection(),
        ],
      ),
    );
  }
}
