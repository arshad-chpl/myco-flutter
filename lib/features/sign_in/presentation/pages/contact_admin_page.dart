import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:myco_flutter/constants/constants.dart';
import 'package:myco_flutter/core/router/route_paths.dart';
import 'package:myco_flutter/core/services/preference_manager.dart';
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
  final preferenceManager = GetIt.I<PreferenceManager>();

  String blockId = '';
  String messageStatus = '';
  String userFullName = '';
  String userFirstName = '';
  String userLastName = '';
  String userBlockName = '';
  String userFloorName = '';
  String designation = '';
  String department = '';
  String mobileNumber = '';
  String emailAddress = '';
  String profilePicture = '';

  @override
  Widget build(BuildContext context) => BlocProvider(
      create: (context) =>
      PrimaryRegisterBloc(registerUseCase: GetIt.I<PrimaryRegisterUseCase>())
        ..add(LoadPendingProfile()),
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          leading: IconButton(
            icon: Image.asset('assets/sign_in/back_arrow.png', // <-- your asset path
              height: 24, // adjust size as needed
              width: 24,
            ),
            onPressed: () {
              context.go(RoutePaths.signUpForm);
            },
          ),
          title: const Text(
            'Pending Account',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: AppColors.black,
            ),
          ),
          backgroundColor: Colors.white, // optional: ensure background matches
          elevation: 0, // optional: no shadow
        ),

        body: BlocConsumer<PrimaryRegisterBloc, PrimaryRegisterState>(
          listener: (context, state) {
            if (state is PendingAccountSuccess) {

              final response = state.response;

              userFullName = response.userFullName ?? 'N/A';
              designation = response.designation ?? 'N/A';
              department = '${response.blockName ?? ' - '} ${response.floorName ?? ''}';
              mobileNumber = '${response.countryCode ?? ''} ${response.userMobile ?? ''}';
              emailAddress = response.userEmail ?? 'N/A';
              profilePicture = response.userProfilePic ?? '';
              userFirstName = response.userFirstName ?? '';
              userLastName = response.userLastName ?? '';
              userBlockName = response.blockName ?? '';
              userFloorName = response.floorName ?? '';
              blockId = response.blockId ?? '';
              messageStatus = response.message ?? '';


              if (response.userStatus == '1') {
                //--Approve
                preferenceManager.setKeyValueString(VariableBag.registrationRequestPendingUserId, "");
                preferenceManager.setKeyValueBoolean(VariableBag.REGISTRATION_REQUEST_IS_APPROVE, true);
                Fluttertoast.showToast(msg: state.response.message ?? 'N/A', backgroundColor: Colors.redAccent, textColor: Colors.white,);


                () async {
                  final societyId = await preferenceManager.getCompanyId();
                  context.read<PrimaryRegisterBloc>().add(LoadSociety(societyId!));
                };


              } else if (response.userStatus == '0') {
                //--Reject
              }
            }

            if (state is ReminderPendingProfileSuccess) {
              Fluttertoast.showToast(msg: state.response.message ?? 'N/A', backgroundColor: Colors.redAccent, textColor: Colors.white,);
            }

            if (state is CancelPendingProfileSuccess) {
              Fluttertoast.showToast(msg: state.response.message ?? 'N/A', backgroundColor: Colors.redAccent, textColor: Colors.white,);

              preferenceManager.setKeyValueString(VariableBag.registrationRequestPendingUserId, "");
              preferenceManager.setKeyValueBoolean(VariableBag.REGISTRATION_REQUEST_IS_APPROVE, true);

              context.go(RoutePaths.splash);
            }

          },
          builder: (context, state) {
            if (state is PrimaryRegisterLoading) {
              return const ContactAdminShimmer();
            }
            if (state is PrimaryRegisterError) {
              return Center(child: Text('Error: ${state.message}'));
            }
            return _buildBody(context);
          },
        ),
      ),
    );

  Widget _buildBody(BuildContext context) => Padding(
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
                  backgroundImage:
                  (profilePicture.isNotEmpty &&
                      profilePicture.startsWith('http'))
                      ? NetworkImage(profilePicture)
                      : const AssetImage('assets/default_profile.png')
                  as ImageProvider,
                ),
                SizedBox(height: 0.01 * Responsive.getHeight(context)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Designation:',
                      style: TextStyle(
                        fontSize:
                        13 * Responsive.getResponsiveText(context),
                        fontWeight: FontWeight.w800,
                        color: AppColors.black,
                      ),
                    ),
                    const SizedBox(width: 5),
                    Text(designation,
                      style: TextStyle(
                        fontSize:
                        13 * Responsive.getResponsiveText(context),
                        color: AppColors.black,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 0.005 * Responsive.getHeight(context)),
                Text(department,
                  style: TextStyle(
                    fontSize: 13 * Responsive.getResponsiveText(context),
                    color: AppColors.black,
                  ),
                ),
                SizedBox(height: 0.005 * Responsive.getHeight(context)),
                Text(mobileNumber,
                  style: TextStyle(
                    fontSize: 13 * Responsive.getResponsiveText(context),
                    color: AppColors.black,
                  ),
                ),
                SizedBox(height: 0.005 * Responsive.getHeight(context)),
                Text(emailAddress,
                  style: TextStyle(
                    fontSize: 13 * Responsive.getResponsiveText(context),
                    color: AppColors.black,
                  ),
                ),
                SizedBox(height: 0.012 * Responsive.getHeight(context)),
                Text(messageStatus,
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
                        context.read<PrimaryRegisterBloc>().add(LoadCancelProfile());
                      },
                      title: 'Cancel Request',
                      height: 0.05 * Responsive.getHeight(context),
                      width: 0.37 * Responsive.getWidth(context),
                      boarderRadius:
                      30 * Responsive.getResponsive(context),
                      textStyle: TextStyle(
                        fontSize:
                        17 * Responsive.getResponsiveText(context),
                        fontWeight: FontWeight.w600,
                        color: AppColors.primary,
                      ),
                      backgroundColor: AppColors.white,
                    ),
                    MyCoButton(
                      onTap: () {
                        final dataMap = {
                          'ReminderPendingProfile':
                          'ReminderPendingProfile',
                          'user_id':
                          '1992', // Should use preferenceManager here if needed
                          'society_id': '1',
                          'block_id': blockId,
                          'user_first_name': userFirstName,
                          'user_last_name': userLastName,
                          'user_full_name': userFullName,
                          'areaName': userFloorName,
                          'blockName': userBlockName
                        };
                        context
                            .read<PrimaryRegisterBloc>()
                            .add(LoadReminderProfile(dataMap));
                      },
                      title: 'Send Reminder',
                      height: 0.05 * Responsive.getHeight(context),
                      width: 0.37 * Responsive.getWidth(context),
                      boarderRadius:
                      30 * Responsive.getResponsive(context),
                      textStyle: TextStyle(
                        fontSize:
                        17 * Responsive.getResponsiveText(context),
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
