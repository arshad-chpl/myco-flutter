import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myco_flutter/constants/app_assets.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/core/utils/util.dart';
import 'package:myco_flutter/features/dashboard/presentation/widgets/custom_department_container.dart';
import 'package:myco_flutter/features/dashboard/presentation/widgets/custom_myteam%20(1).dart';
import 'package:myco_flutter/features/dashboard/presentation/widgets/custom_section.dart';
import 'package:myco_flutter/features/dashboard/presentation/widgets/custom_slider.dart';
import 'package:myco_flutter/features/dashboard/presentation/widgets/custom_timer.dart';
import 'package:myco_flutter/features/dashboard/presentation/widgets/custom_upcomingcelebrationcard.dart';
import 'package:myco_flutter/features/dashboard/presentation/widgets/dashboard_app_bar.dart';
import 'package:myco_flutter/features/dashboard/presentation/widgets/myTeamCard.dart';
import 'package:myco_flutter/features/dashboard/presentation/widgets/timerAndSlider.dart';
import 'package:myco_flutter/widgets/border_container_wraper.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_shadow_container.dart';
import 'package:myco_flutter/widgets/custom_stepper.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

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
              child: SingleChildScrollView(
                child: Column(
                  spacing: 16,
                  children: [
                    // timer and slider section
                    timerAndSlider(context),

                    // Circulars and discussion section
                    Row(
                      spacing: 16,
                      children: [
                        Expanded(
                          child: BorderContainerWraper(
                            padding: EdgeInsets.symmetric(
                              horizontal: 15,
                              vertical: 10,
                            ),
                            child: CustomShadowContainer(
                              width: double.infinity,
                              image:
                                  Container(), // Replace with actual image if needed
                              title: 'Title',
                            ),
                          ),
                        ),
                        Expanded(
                          child: BorderContainerWraper(
                            padding: EdgeInsets.symmetric(
                              horizontal: 15,
                              vertical: 10,
                            ),
                            child: CustomShadowContainer(
                              width: double.infinity,
                              image:
                                  Container(), // Replace with actual image if needed
                              title: 'Title',
                            ),
                          ),
                        ),
                      ],
                    ),
                    // My Team Section
                    CustomSection(
                      title: 'My Team',
                      subtitle: 'It’s Team That can Make it Happen',
                      icon: Image.asset(
                        AppAssets.quickAccessGif,
                        height: 70 * getResponsiveOnWidth(context),
                      ),
                      hasViewMoreButton: true,
                      count: '04',
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      child: BorderContainerWraper(
                        child: OverlappingPeopleCard(
                          people: [
                            PersonData(
                              firstName: "person",
                              lastName: "name",
                              imagePath:
                                  'https://plus.unsplash.com/premium_photo-1690407617542-2f210cf20d7e?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cGVyc29ufGVufDB8fDB8fHww',
                            ),
                            PersonData(
                              firstName: "person",
                              lastName: "name",
                              imagePath:
                                  'https://plus.unsplash.com/premium_photo-1690407617542-2f210cf20d7e?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cGVyc29ufGVufDB8fDB8fHww',
                            ),
                            PersonData(
                              firstName: "person",
                              lastName: "name",
                              imagePath:
                                  'https://plus.unsplash.com/premium_photo-1690407617542-2f210cf20d7e?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cGVyc29ufGVufDB8fDB8fHww',
                            ),
                            PersonData(
                              firstName: "person",
                              lastName: "name",
                              imagePath:
                                  'https://plus.unsplash.com/premium_photo-1690407617542-2f210cf20d7e?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cGVyc29ufGVufDB8fDB8fHww',
                            ),
                          ],
                        ),
                      ),
                    ),

                    // Quick Access Section
                    CustomSection(
                      title: 'Quick Access',
                      subtitle: 'All Your Work Related Tools.',
                      icon: Image.asset(
                        AppAssets.quickAccessGif,
                        height: 70 * getResponsiveOnWidth(context),
                      ),
                      hasViewMoreButton: true,
                      count: '04',
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: getWidth(context) > 600
                              ? 6
                              : 3, // 2 columns
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                          childAspectRatio: 0.78, // Adjust for container shape
                        ),
                        itemCount: 12,
                        itemBuilder: (context, index) => BorderContainerWraper(
                          padding: const EdgeInsets.all(14.5),

                          child: CustomShadowContainer(
                            image:
                                Container(), // Replace with actual image if needed
                            title: 'Title ${index + 1}',
                          ),
                        ),
                      ),
                    ),

                    // Upcoming Celebrations Section
                    CustomSection(
                      title: 'Upcoming Celebrations',
                      subtitle: 'Spread smiles — celebrate someone today!',
                      icon: Image.asset(
                        AppAssets.quickAccessGif,
                        height: 70 * getResponsiveOnWidth(context),
                      ),
                      count: '04',
                      hasViewMoreButton: true,
                      child: SizedBox(
                        width: getWidth(context),
                        height: 0.3 * getHeight(context),
                        child: ListView.builder(
                          itemCount: 3,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return CustomProfileCard(
                              name: 'Person Name',
                              description: 'Decs',
                              imagePath:
                                  'https://plus.unsplash.com/premium_photo-1690407617542-2f210cf20d7e?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cGVyc29ufGVufDB8fDB8fHww',
                              chipLabel: 'BirthDay',
                              buttonLabel: '',
                              onButtonPressed: () {},
                              cardWidth: getWidth(context) * 0.8,
                              cardPadding: EdgeInsets.zero,
                              // contentPadding: EdgeInsets.zero,
                            );
                          },
                        ),
                      ),
                    ),
                    CustomSection(
                      title: 'Your Department',
                      subtitle: 'The people who help make things happen.',
                      icon: Image.asset(
                        AppAssets.quickAccessGif,
                        height: 70 * getResponsiveOnWidth(context),
                      ),
                      count: '04',
                      hasViewMoreButton: true,
                      child: SizedBox(
                        width: getWidth(context),
                        height: 0.3 * getHeight(context),
                        child: ListView.builder(
                          itemCount: 3,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 24.0),
                              child: ProfileCard(
                                imagePath:
                                    'https://plus.unsplash.com/premium_photo-1690407617542-2f210cf20d7e?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cGVyc29ufGVufDB8fDB8fHww',
                                name: 'Name',
                                department: 'Sales',
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    CustomSection(
                      title: 'Moments That Matters',
                      subtitle: 'live the Moments Again.',
                      icon: Image.asset(
                        AppAssets.quickAccessGif,
                        height: 70 * getResponsiveOnWidth(context),
                      ),
                      count: '04',
                      hasViewMoreButton: true,
                      child: SizedBox(
                        width: getWidth(context),
                        height: 0.3 * getHeight(context),
                        child: ListView.builder(
                          itemCount: 3,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 24.0),
                              child: ProfileCard(
                                imagePath:
                                    'https://plus.unsplash.com/premium_photo-1690407617542-2f210cf20d7e?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cGVyc29ufGVufDB8fDB8fHww',
                                name: 'Name',
                                department: 'Sales',
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );

  // Widget TextPreview(BuildContext context) {
  //   return Column(
  //     children: [
  //       Text(
  //         'Hello World!',
  //         style: TextStyle(
  //           fontSize: 24,
  //           fontFamily: getFontFamily(FontWeight.w100),
  //         ),
  //       ),
  //       Text(
  //         'Hello World!',
  //         style: TextStyle(
  //           fontSize: 24,
  //           fontFamily: getFontFamily(FontWeight.w200),
  //         ),
  //       ),
  //       Text(
  //         'Hello World!',
  //         style: TextStyle(
  //           fontSize: 24,
  //           fontFamily: getFontFamily(FontWeight.w300),
  //         ),
  //       ),
  //       Text(
  //         'Hello World!',
  //         style: TextStyle(
  //           fontSize: 24,
  //           fontFamily: getFontFamily(FontWeight.w400),
  //         ),
  //       ),
  //       Text(
  //         'Hello World!',
  //         style: TextStyle(
  //           fontSize: 24,
  //           fontFamily: getFontFamily(FontWeight.w500),
  //         ),
  //       ),
  //       Text(
  //         'Hello World!',
  //         style: TextStyle(
  //           fontSize: 24,
  //           fontFamily: getFontFamily(FontWeight.w600),
  //         ),
  //       ),
  //       Text(
  //         'Hello World!',
  //         style: TextStyle(
  //           fontSize: 24,
  //           fontFamily: getFontFamily(FontWeight.w700),
  //         ),
  //       ),
  //       Text(
  //         'Hello World!',
  //         style: TextStyle(
  //           fontSize: 24,
  //           fontFamily: getFontFamily(FontWeight.w800),
  //         ),
  //       ),
  //       Text(
  //         'Hello World!',
  //         style: TextStyle(
  //           fontSize: 24,
  //           fontFamily: getFontFamily(FontWeight.w900),
  //         ),
  //       ),
  //     ],
  //   );
  // }

  String getFontFamily(FontWeight fontWeight) {
    switch (fontWeight) {
      case FontWeight.w100:
        return 'Gilroy-Thin';
      case FontWeight.w200:
        return 'Gilroy-UltraLight';
      case FontWeight.w300:
        return 'Gilroy-Light';
      case FontWeight.w400:
        return 'Gilroy-Regular';
      case FontWeight.w500:
        return 'Gilroy-Medium';
      case FontWeight.w600:
        return 'Gilroy-SemiBold';
      case FontWeight.w700:
        return 'Gilroy-Bold';
      case FontWeight.w800:
        return 'Gilroy-ExtraBold';
      case FontWeight.w900:
        return 'Gilroy-Heavy';
      default:
        return 'Gilroy-Regular';
    }
  }
}
