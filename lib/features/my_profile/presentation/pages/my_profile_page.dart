import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:myco_flutter/constants/app_assets.dart';
import 'package:myco_flutter/core/router/route_paths.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/dashboard/presentation/widgets/custom_myteam.dart';
import 'package:myco_flutter/features/dashboard/presentation/widgets/custom_section.dart';
import 'package:myco_flutter/features/my_profile/presentation/widgets/profile_details_card.dart';
import 'package:myco_flutter/features/my_profile/presentation/widgets/profile_personal_info_card.dart';
import 'package:myco_flutter/features/dashboard/presentation/widgets/profile_reporting_card.dart';
import 'package:myco_flutter/features/my_profile/presentation/widgets/profile_tool_support_setting_card.dart';
import 'package:myco_flutter/features/my_profile/presentation/widgets/profile_word_attendance_card.dart';
import 'package:myco_flutter/features/my_profile/presentation/bloc/my_profile_bloc.dart';
import 'package:myco_flutter/features/my_profile/presentation/bloc/my_profile_event.dart';
import 'package:myco_flutter/features/my_profile/presentation/bloc/my_profile_state.dart';
import 'package:myco_flutter/widgets/border_container_wraper.dart';
import 'package:myco_flutter/widgets/custom_appbar.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

class MyProfilePage extends StatefulWidget {
  const MyProfilePage({super.key});

  @override
  State<MyProfilePage> createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<MyProfileBloc>().add(FetchProfileDataEvent());
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: CustomAppbar(
      // automaticallyImplyLeading: false,
      appBarBackgoundColor: Colors.transparent,
      leadingWidth: 0.1 * Responsive.getWidth(context),
      title: "My Profile",
    ),
    body: Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 18 * Responsive.getResponsive(context),
      ),
      child: BlocBuilder<MyProfileBloc, MyProfileState>(
        builder: (context, state) {
          if (state is FetchProfileDataLoadingState) {
            return Center(child: CircularProgressIndicator());
          }

          if (state is FetchProfileDataErrorState) {
            return Center(
              child: CustomText(
                state.errorMessage,
                color: AppTheme.getColor(context).error,
                fontSize: 16 * Responsive.getResponsiveText(context),
              ),
            );
          }

          if (state is FetchProfileDataSuccessState) {
            // You can access the profile data here
            final profileData = state.profileEntity;
            // Use profileData to build your UI
            return Container(
              child: Column(
                spacing: 0.015 * Responsive.getHeight(context),
                children: [
                  Row(
                    // crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    spacing: 0.015 * Responsive.getWidth(context),
                    children: [
                      Container(
                        height: 0.04 * Responsive.getHeight(context),
                        width: 0.32 * Responsive.getWidth(context),
                        decoration: BoxDecoration(
                          color: AppTheme.getColor(context).primary,
                          borderRadius: BorderRadius.circular(
                            10 * Responsive.getResponsive(context),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 12 * Responsive.getResponsive(context),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: Center(
                                  child: SvgPicture.asset(
                                    "assets/dashboard/svgs/admin_view_icon.svg",
                                    height:
                                        0.02 * Responsive.getHeight(context),
                                  ),
                                ),
                                height: 0.03 * Responsive.getHeight(context),
                                width: 0.07 * Responsive.getWidth(context),
                                decoration: BoxDecoration(
                                  color: AppTheme.getColor(context).onPrimary,
                                  borderRadius: BorderRadius.circular(
                                    10 * Responsive.getResponsive(context),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () => context.push(RoutePaths.adminView),
                                child: CustomText(
                                  "Admin View",
                                  fontSize:
                                      12 *
                                      Responsive.getResponsiveText(context),
                                  color: AppTheme.getColor(context).onPrimary,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 0.035 * Responsive.getHeight(context),
                        width: 0.08 * Responsive.getWidth(context),
                        decoration: BoxDecoration(
                          color: AppTheme.getColor(
                            context,
                          ).tertiary.withValues(alpha: 0.2),
                          borderRadius: BorderRadius.circular(
                            30 * Responsive.getResponsive(context),
                          ),
                        ),
                        child: Center(
                          child: SvgPicture.asset(
                            "assets/dashboard/svgs/profile_exit.svg",
                            height: 0.015 * Responsive.getHeight(context),
                          ),
                        ),
                      ),
                      Container(
                        height: 0.035 * Responsive.getHeight(context),
                        width: 0.08 * Responsive.getWidth(context),
                        decoration: BoxDecoration(
                          color: AppTheme.getColor(
                            context,
                          ).tertiary.withValues(alpha: 0.2),
                          borderRadius: BorderRadius.circular(
                            30 * Responsive.getResponsive(context),
                          ),
                        ),
                        child: Center(
                          child: SvgPicture.asset(
                            "assets/dashboard/svgs/profile_setting.svg",
                            height: 0.015 * Responsive.getHeight(context),
                          ),
                        ),
                      ),
                      Container(
                        height: 0.035 * Responsive.getHeight(context),
                        width: 0.08 * Responsive.getWidth(context),
                        decoration: BoxDecoration(
                          color: AppTheme.getColor(
                            context,
                          ).tertiary.withValues(alpha: 0.2),
                          borderRadius: BorderRadius.circular(
                            30 * Responsive.getResponsive(context),
                          ),
                        ),
                        child: Center(
                          child: SvgPicture.asset(
                            "assets/dashboard/svgs/profile_share.svg",
                            height: 0.015 * Responsive.getHeight(context),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        spacing: 0.015 * Responsive.getHeight(context),
                        children: [
                          //Details Card
                          ProfileDetailsCard(
                            fullName: profileData.userFullName.toString(),
                            employeeId: profileData.companyEmployeeId.toString(),
                            designation: profileData.designation.toString(),
                            department: profileData.departmentName.toString(),
                            branchName: profileData.branchName.toString(),
                            phoneNumber: profileData.whatsappNumber.toString(),
                            email: profileData.personalEmail.toString(),
                            profileImage: profileData.userProfilePic.toString(),
                            social_link: profileData.socialLink ?? [],
                          ),

                          //Reporting Card
                          profileData.reportingPersons!=null &&  profileData.reportingPersons!.isNotEmpty?
                          ProfileReportingCard():SizedBox.shrink(),

                          //Personal Info Card
                          ProfilePersonalInfoCard(personalInfoList: profileData.profileMenu??[],),

                          //Work Atendance Card
                          ProfileWordAttendanceCard(),

                          //Tool Support Setting Card
                          ProfileToolSupportSettingCard(),

                          //Overlaping image
                          CustomSection(
                            title: 'My Team',
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
                            hasViewMoreButton: true,
                            subtitle: "It’s Team That can Make it Happen",
                            count: "04",
                            icon: Image.asset(
                              AppAssets.quickAccessGif,
                              height:
                                  70 * Responsive.getResponsiveOnWidth(context),
                            ),
                          ),

                          //MycoButton for apply
                          MyCoButton(
                            boarderRadius:
                                30 * Responsive.getResponsive(context),
                            onTap: () {},
                            title: "APPLY RESIGNATION",
                            isShadowBottomLeft: true,
                          ),
                          Column(
                            children: [
                              CustomText(
                                "WWW.MY-COMPANY.APP",
                                color: AppTheme.getColor(context).primary,
                                decoration: TextDecoration.underline,
                                fontWeight: FontWeight.bold,
                              ),
                              CustomText(
                                "What’s New",
                                fontWeight: FontWeight.bold,
                                color: AppTheme.getColor(context).primary,
                                decoration: TextDecoration.underline,
                              ),
                              CustomText("V.211", fontWeight: FontWeight.bold),
                            ],
                          ),
                          SizedBox(
                            height: 0.01 * Responsive.getHeight(context),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }

          return Center(
            child: CustomText(
              "Something went wrong",
              color: AppTheme.getColor(context).error,
              fontSize: 16 * Responsive.getResponsiveText(context),
            ),
          );
        },
      ),
    ),
  );
}
