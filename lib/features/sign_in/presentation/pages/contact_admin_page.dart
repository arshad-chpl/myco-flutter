import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/search_company/presentation/widgets/box_design_registration.dart';
import 'package:myco_flutter/features/sign_in/domain/usecases/primary_register_usecase.dart';
import 'package:myco_flutter/features/sign_in/models/view_pending_profile_response.dart';
import 'package:myco_flutter/features/sign_in/presentation/bloc/primary_register_bloc.dart';
import 'package:myco_flutter/features/sign_in/presentation/pages/contact_admin_shimmer.dart';
import 'package:myco_flutter/features/sign_in/presentation/widgets/custom_request_bottom_sheet.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';

class ContactAdminPage extends StatefulWidget {
  const ContactAdminPage({super.key});

  @override
  State<ContactAdminPage> createState() => _ContactAdminPageState();
}

class _ContactAdminPageState extends State<ContactAdminPage> {
  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (context) =>
        PrimaryRegisterBloc(registerUseCase: GetIt.I<PrimaryRegisterUseCase>())
          ..add(LoadPendingProfile()),

    child: Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: const Text(
          'Developer(CHPL)',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: AppColors.black,
          ),
        ),
      ),
      body: BlocBuilder<PrimaryRegisterBloc, PrimaryRegisterState>(
        builder: (context, state) {
          if (state is PrimaryRegisterLoading) {
            return const ContactAdminShimmer();
          } else if (state is PendingAccountSuccess) {
            final response = state.response;
            return _buildBody(response);
          } else if (state is PrimaryRegisterError) {
            return Center(child: Text(state.message));
          }
          return const Center(child: Text('No data available'));
        },
      ),
    ),
  );

  Widget _buildBody(ViewPendingProfileResponse response) {

    final userFullName = response.userFullName ?? 'N/A';
    final designation = response.designation ?? 'N/A';
    final department = '${response.blockName ?? ' - '} ${response.floorName ?? ''}';
    final mobileNumber = '${response.countryCode ?? ''} ${response.userMobile ?? ''}';
    final emailAddress = response.userEmail ?? 'N/A';
    final profilePicture = response.userProfilePic ?? '';

    return Padding(
      padding: const EdgeInsets.all(26.0),
      child: Column(
        children: [
          LinearDesignBox(
            title: userFullName,
            isIncenter: true,
            titleTextStyle: const TextStyle(
              color: AppColors.white,
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
            color: const Color(0xFF2FBBA4),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 0.02 * Responsive.getWidth(context),
              ),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 54 * Responsive.getResponsive(context),
                    backgroundImage: (profilePicture.isNotEmpty && profilePicture.startsWith('http'))
                        ? NetworkImage(profilePicture)
                        : const AssetImage('assets/default_profile.png') as ImageProvider,
                  ),


                  SizedBox(height: 0.01 * Responsive.getHeight(context)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Designation:',
                        style: TextStyle(
                          fontSize: 13 * Responsive.getResponsiveText(context),
                          fontWeight: FontWeight.w800,
                          color: AppColors.black,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        designation,
                        style: TextStyle(
                          fontSize: 13 * Responsive.getResponsiveText(context),
                          color: AppColors.black,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 0.005 * Responsive.getHeight(context)),
                  Text(
                    department,
                    style: TextStyle(
                      fontSize: 13 * Responsive.getResponsiveText(context),
                      color: AppColors.black,
                    ),
                  ),
                  SizedBox(height: 0.005 * Responsive.getHeight(context)),
                  Text(
                    mobileNumber,
                    style: TextStyle(
                      fontSize: 13 * Responsive.getResponsiveText(context),
                      color: AppColors.black,
                    ),
                  ),
                  SizedBox(height: 0.005 * Responsive.getHeight(context)),
                  Text(
                    emailAddress,
                    style: TextStyle(
                      fontSize: 13 * Responsive.getResponsiveText(context),
                      color: AppColors.black,
                    ),
                  ),
                  SizedBox(height: 0.012 * Responsive.getHeight(context)),
                  Text(
                    'Account Not Activated Please Contact to Admin',
                    style: TextStyle(
                      fontSize: 14 * Responsive.getResponsiveText(context),
                      color: AppColors.red,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MyCoButton(
                        onTap: () {
                          PrimaryRegisterBloc(registerUseCase: GetIt.I<PrimaryRegisterUseCase>())
                            .add(LoadCancelProfile());
                        },
                        title: 'Cancel Request',
                        height: 0.05 * Responsive.getHeight(context),
                        width: 0.37 * Responsive.getWidth(context),
                        boarderRadius: 30 * Responsive.getResponsive(context),
                        textStyle: TextStyle(
                          fontSize: 17 * Responsive.getResponsiveText(context),
                          fontWeight: FontWeight.w600,
                          color: AppColors.primary,
                        ),
                        backgroundColor: AppColors.white,
                      ),
                      MyCoButton(
                        onTap: () {
                          context.pop();
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            backgroundColor: AppTheme.getColor(
                              context,
                            ).onPrimary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(
                                  20 * Responsive.getResponsive(context),
                                ),
                              ),
                            ),
                            builder: (_) => const CustomRequestBottomSheet(),
                          );
                        },
                        title: 'Send Reminder',
                        height: 0.05 * Responsive.getHeight(context),
                        width: 0.37 * Responsive.getWidth(context),
                        boarderRadius: 30 * Responsive.getResponsive(context),
                        textStyle: TextStyle(
                          fontSize: 17 * Responsive.getResponsiveText(context),
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                        backgroundColor: const Color(0xFF2F648E),
                        isShadowBottomLeft: true,
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
          SizedBox(height: 0.03 * Responsive.getHeight(context)),
          Image.asset(
            'assets/search_society/contact_admin.png',
            height: 0.35 * Responsive.getHeight(context),
          ),
        ],
      ),
    );
  }


}
