import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:myco_flutter/core/router/route_paths.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/dashboard/presentation/widgets/my_team_section.dart';
import 'package:myco_flutter/features/my_profile/presentation/bloc/my_profile_bloc.dart';
import 'package:myco_flutter/features/my_profile/presentation/bloc/my_profile_state.dart';
import 'package:myco_flutter/features/my_profile/presentation/widgets/profile_details_card.dart';
import 'package:myco_flutter/features/my_profile/presentation/widgets/profile_personal_info_card.dart';
import 'package:myco_flutter/features/my_profile/presentation/widgets/profile_reporting_card.dart';
import 'package:myco_flutter/features/my_profile/presentation/widgets/profile_tool_support_setting_card.dart';
import 'package:myco_flutter/widgets/custom_appbar.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

class OtherProfilePage extends StatelessWidget {
  const OtherProfilePage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: CustomAppbar(
        // automaticallyImplyLeading: false,
        appBarBackgoundColor: Colors.transparent,
        leadingWidth: 0.1 * Responsive.getWidth(context),
        title: "Other Profile",
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
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          spacing: 0.015 * Responsive.getHeight(context),
                          children: [
                            //Details Card
                            ProfileDetailsCard(
                              fullName: profileData.userFullName.toString(),
                              employeeId: profileData.employeeId
                                  .toString(),
                              designation: profileData.designation.toString(),
                              department: profileData.departmentName.toString(),
                              branchName: profileData.branchName.toString(),
                              phoneNumber: profileData.userMobile
                                  .toString(),
                              email: profileData.userEmail.toString(),
                              profileImage: profileData.userProfilePic
                                  .toString(),
                              social_link: profileData.socialLink ?? [],
                            ),

                            //Reporting Card
                            profileData.reportingPersons != null &&
                                profileData.reportingPersons!.isNotEmpty
                                ? ProfileReportingCard(
                              reportingPersonsList:
                              profileData.reportingPersons ?? [],
                            )
                                : SizedBox.shrink(),

                            //Personal Info Card
                            profileData.profileMenu != null &&
                                    profileData.profileMenu!.isNotEmpty
                                ? ProfilePersonalInfoCard(
                                    personalInfoList:
                                        profileData.profileMenu ?? [],
                                  )
                                : SizedBox.shrink(),

                            //Work Atendance Card
                            // ProfileWordAttendanceCard(),

                            //Tool Support Setting Card
                            ProfileToolSupportSettingCard(),

                            //Overlaping image
                            profileData.myTeam!=null && profileData.myTeam!.isNotEmpty?
                            MyTeamSection(myTeam: profileData.myTeam):SizedBox.shrink(),
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
                                CustomText(
                                  "V.211",
                                  fontWeight: FontWeight.bold,
                                ),
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
