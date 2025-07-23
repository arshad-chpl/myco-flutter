import 'dart:io';

import 'package:badges/badges.dart' as badges;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:myco_flutter/constants/app_assets.dart';
import 'package:myco_flutter/constants/constants.dart';
import 'package:myco_flutter/core/router/route_paths.dart';
import 'package:myco_flutter/core/services/preference_manager.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/common_api/presentation/bloc/common_api_bloc.dart';
import 'package:myco_flutter/features/leave/presentation/widgets/ios_calendar_time_picker.dart';
import 'package:myco_flutter/features/sign_in/presentation/bloc/primary_register_bloc.dart';
import 'package:myco_flutter/features/sign_in/presentation/widgets/bottom_term_and_condition.dart';
import 'package:myco_flutter/features/sign_in/presentation/widgets/framed_profile_image.dart';
import 'package:myco_flutter/features/sign_in/presentation/widgets/sign_up_custom_selector.dart';
import 'package:myco_flutter/widgets/custom_checkbox.dart';
import 'package:myco_flutter/widgets/custom_countrycodetextfield.dart';
import 'package:myco_flutter/widgets/custom_loader_dialog.dart';
import 'package:myco_flutter/widgets/custom_media_picker_container/media_picker.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_text.dart';
import 'package:myco_flutter/widgets/custom_text_field.dart';
import 'package:myco_flutter/widgets/custom_text_field_new.dart';
import 'package:myco_flutter/widgets/custom_text_radio_button.dart';

class SignupFormPage extends StatefulWidget {
  const SignupFormPage({super.key});

  @override
  State<SignupFormPage> createState() => _SignupFormPageState();
}

class _SignupFormPageState extends State<SignupFormPage> {

  String? blockNo;
  String? blockId;
  String? floorId;
  String? unitId;
  bool? isFamily;
  String? societyId;
  String? type;
  String? from;
  String? baseUrl;
  String? apiKey;
  bool? isAddMore;
  bool? isAddByAdmin;
  bool? isAddMoreUnit;
  bool? isSociety;
  String? loginVia;
  String? societyAddress;

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();

    final args = GoRouterState.of(context).extra as Map<String, dynamic>?;

    if (args != null) {
      societyId = args['societyId'] ?? '';
      isSociety = args['isSociety'] ?? false;
      societyAddress = args['societyAddress'];
      isAddByAdmin = args['isAddByAdmin'] ?? false;

      from = args['from'] ?? '0';
      isAddMore = args['isAddMore'] ?? false;
      isAddMoreUnit = args['isAddMoreUnit'] ?? false;

    } else {
      // fallback if args is null
      societyId = '';
      from = '0';
      isAddMore = false;
      isAddByAdmin = false;
      isAddMoreUnit = false;
      isSociety = false;
      societyAddress = '';
    }
  }

  String? selectedBranch;
  String selectedGender = 'Male';
  bool gender = false;
  String selectedCountry = 'IND';
  bool isChecked = false;
  final Map<String, String> countryMap = {
    'IND': '+91',
    'USA': '+1',
    'INA': '+62',
  };

  final preferenceManager = GetIt.I<PreferenceManager>();

  //

  String profileImage = '';
  String? selectedImage = '';

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController departmentNumberController = TextEditingController();
  final TextEditingController joiningDateController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

  String selectedBranchId = '';
  String selectedBranchName = '';
  String selectedDepartmentId = '';
  String selectedDepartmentName = '';
  String selectedSubDepartmentId = '';
  String selectedSubDepartmentName = '';
  String selectedShiftId = '';
  String selectedShiftName = '';
  String selectedDesignationId = '';
  String selectedDesignationName = '';
  late List<String> branchOptionIds = [];
  late List<String> branchOptionNames = [];
  late List<String> floorUnitOptionIds = [];
  late List<String> floorUnitOptionNames = [];
  late List<String> departmentOptionIds = [];
  late List<String> departmentOptionNames = [];
  late List<String> subDepartmentOptionIds = [];
  late List<String> subDepartmentOptionNames = [];
  late List<String> shiftOptionIds = [];
  late List<String> shiftOptionNames = [];

  @override
  void initState() {
    super.initState();
    context.read<CommonApiBloc>().add(LoadBranch(societyId ?? '1', '0'));
  }
  @override
  Widget build(BuildContext context) {
    Responsive.init(context);
    return Container(
      color: AppTheme.getColor(context).surface,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppTheme.getColor(context).surface,
          body: MultiBlocListener(
            listeners: [
              BlocListener<CommonApiBloc, CommonApiState>(
                listener: (context, state) {
                  if (state is CommonApiLoading) {
                    CustomLoaderDialog.show(context);
                  }

                  if (state is BlockApiSuccess || state is FloorUnitApiSuccess || state is ShiftApiSuccess || state is UploadImagePdfApiSuccess ||
                      state is CommonApiError) {
                    Navigator.of(context, rootNavigator: true).pop();
                  }

                  if (state is BlockApiSuccess) {
                    branchOptionIds = [];
                    branchOptionNames = [];
                    branchOptionIds = state.blockList.blocks!.map((block) => block.blockId ?? '').toList();
                    branchOptionNames = state.blockList.blocks!.map((block) => block.blockName ?? '').toList();
                  }

                  if (state is FloorUnitApiSuccess) {
                    floorUnitOptionIds = [];
                    floorUnitOptionNames = [];
                    floorUnitOptionIds = state.floorUnitList.designation!.map((d) => d.designationId ?? '').toList();
                    floorUnitOptionNames = state.floorUnitList.designation!.map((d) => d.designationName ?? '').toList();

                    departmentOptionIds = [];
                    departmentOptionNames = [];
                    departmentOptionIds = state.floorUnitList.floors!.map((f) => f.floorId ?? '').toList();
                    departmentOptionNames = state.floorUnitList.floors!.map((f) => f.floorName ?? '').toList();


                    subDepartmentOptionIds = [];
                    subDepartmentOptionNames = [];
                    subDepartmentOptionIds = state.floorUnitList.subDepartmentList!.map((sd) => sd.subDepartmentId ?? '').toList();
                    subDepartmentOptionNames = state.floorUnitList.subDepartmentList!.map((sd) => sd.subDepartmentName ?? '').toList();
                  }

                  if (state is ShiftApiSuccess) {
                    shiftOptionIds = [];
                    shiftOptionNames = [];
                    shiftOptionIds = state.shiftList.shift!.map((s) => s.shiftTimeId ?? '').toList();
                    shiftOptionNames = state.shiftList.shift!.map((s) => s.shiftTimeView ?? '').toList();
                  }

                  if (state is UploadImagePdfApiSuccess) {
                    final List<String>? dataList = state.imgPdfList.imgNameArr;
                    final String image = (dataList != null && dataList.isNotEmpty)
                        ? dataList.join(',')
                        : '';
                    profileImage = image.toString();
                    selectedImage = '${state.imgPdfList.baseUrl}$image';
                  }
                },


              ),
              BlocListener<PrimaryRegisterBloc, PrimaryRegisterState>(
                listener: (context, state) async {

                  if (state is PrimaryRegisterLoading) {
                    CustomLoaderDialog.show(context);
                  }

                  if (state is AddPrimaryUserApiSuccess || state is PrimaryRegisterError) {
                    Navigator.of(context, rootNavigator: true).pop();
                  }

                  if (state is AddPrimaryUserApiSuccess) {
                    Fluttertoast.showToast(msg: state.response.message ?? '', backgroundColor: Colors.green, textColor: Colors.white,);
                    if (isAddMore != true) {
                      if (from == '1') {
                        preferenceManager.setKeyValueBoolean(VariableBag.REQUEST_EMPLOYEE, true);
                        Navigator.of(context).pop();
                      } else {
                        if (state.response.isApprove == true) {
                          preferenceManager.setKeyValueBoolean(VariableBag.REGISTRATION_REQUEST_IS_APPROVE, true,);
                          Navigator.of(context).pop();
                        } else {
                          preferenceManager.setKeyValueBoolean(VariableBag.REGISTRATION_REQUEST_IS_APPROVE, false,);
                          await preferenceManager.setKeyValueString(VariableBag.registrationRequestPendingUserId, state.response.userId ?? '',);

                          context.go(RoutePaths.contactAdmin);
                        }
                      }
                    } else {
                      Navigator.of(context).pop();
                    }
                  }

                },
              ),
            ],
            child: BlocBuilder<CommonApiBloc, CommonApiState>(
              builder: (context, state) {
                if (state is CommonApiError) {
                  Fluttertoast.showToast(msg: state.message, backgroundColor: Colors.redAccent, textColor: Colors.white,);
                }
                return Padding(
                  padding: EdgeInsets.all(20 * Responsive.getResponsive(context)),
                  child: setUi(),
                );
              },
            ),
          ),
        ),
      ),
    );
  }


  Widget setUi() => SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 0.020 * Responsive.getHeight(context)),

        Center(
          child: badges.Badge(
            badgeStyle: const badges.BadgeStyle(badgeColor: Colors.transparent),
            position: badges.BadgePosition.bottomEnd(
              bottom: -22 * Responsive.getResponsive(context),
              end: -15 * Responsive.getResponsive(context),
            ),
            badgeContent: GestureDetector(
              onTap: () async {
                final List<File>? files = await showMediaFilePicker(
                  isDialog: false,
                  isCameraShow: true,
                  isGalleryShow: true,
                  isDocumentShow: false,
                  context: context,
                );

                if (files == null || files.isEmpty) return;
                final List<String> imgList = [files.first.path];
                context.read<CommonApiBloc>().add(LoadUploaded(true, imgList));
                setState(() {});
              },

              child: Image.asset(
                'assets/sign_in/camera_icon.png',
                fit: BoxFit.contain,
                height: 0.04 * Responsive.getHeight(context),
              ),
            ),
            child: FramedProfileImage(
              imagePath: selectedImage,
              borderColor: AppTheme.getColor(context).primary,
              borderWidth: 1,
              size: 80,
            ),
          ),
        ),

        SizedBox(height: 0.030 * Responsive.getHeight(context)),

        buildCustomSelector(
          context: context,
          label: 'Branch',
          selectedId: selectedBranchId,
          selectedName: selectedBranchName,
          optionIds: branchOptionIds,
          optionNames: branchOptionNames,
          defaultLabelKey: 'branch',
          prefixIcon: 'assets/sign_in/branch_icon.png',
          onSelected: (id, name) {
            selectedBranchId = id;
            selectedBranchName = name;
            selectedDepartmentId = '';
            selectedDepartmentName = '';
            selectedSubDepartmentId = '';
            selectedSubDepartmentName = '';
            selectedShiftId = '';
            selectedShiftName = '';
            selectedDesignationId = '';
            selectedDesignationName = '';
            context.read<CommonApiBloc>().add(LoadFloorUnit(societyId ?? '1',selectedBranchId));
            setState(() {});
          },
        ),
        SizedBox(height: 0.015 * Responsive.getHeight(context)),

        buildCustomSelector(
          context: context,
          label: 'Department',
          selectedId: selectedDepartmentId,
          selectedName: selectedDepartmentName,
          optionIds: departmentOptionIds,
          optionNames: departmentOptionNames,
          defaultLabelKey: 'department',
          prefixIcon: 'assets/sign_in/department_icon.png',
          onSelected: (id, name) {
            selectedDepartmentId = id;
            selectedDepartmentName = name;
            selectedSubDepartmentId = '';
            selectedSubDepartmentName = '';

            context.read<CommonApiBloc>().add(LoadShift(societyId ?? '1',selectedDepartmentId));
            setState(() {});
          },
        ),
        SizedBox(height: 0.015 * Responsive.getHeight(context)),

        if (subDepartmentOptionIds.isNotEmpty) ...[
          buildCustomSelector(
            context: context,
            label: 'Sub Department',
            selectedId: selectedSubDepartmentId,
            selectedName: selectedSubDepartmentName,
            optionIds: subDepartmentOptionIds,
            optionNames: subDepartmentOptionNames,
            defaultLabelKey: 'sub department',
            prefixIcon: 'assets/sign_in/sub_department_icon.png',
            onSelected: (id, name) {
              selectedSubDepartmentId = id;
              selectedSubDepartmentName = name;

              setState(() {});
            },
          ),
          SizedBox(height: 0.015 * Responsive.getHeight(context)),
        ],

        buildCustomSelector(
          context: context,
          label: 'Shift',
          selectedId: selectedShiftId,
          selectedName: selectedShiftName,
          optionIds: shiftOptionIds,
          optionNames: shiftOptionNames,
          defaultLabelKey: 'shift',
          prefixIcon: 'assets/sign_in/clock_icon.png',
          onSelected: (id, name) {
            selectedShiftId = id;
            selectedShiftName = name;

            setState(() {});
          },
        ),
        SizedBox(height: 0.015 * Responsive.getHeight(context)),

        buildCustomSelector(
          context: context,
          label: 'Designation',
          selectedId: selectedDesignationId,
          selectedName: selectedDesignationName,
          optionIds: floorUnitOptionIds,
          optionNames: floorUnitOptionNames,
          defaultLabelKey: 'designation',
          prefixIcon: 'assets/sign_in/designation_icon.png',
          onSelected: (id, name) {
            selectedDesignationId = id;
            selectedDesignationName = name;
            setState(() {});
          },
        ),
        SizedBox(height: 0.015 * Responsive.getHeight(context)),

        CustomText(
          'Joining Date *',
          color: AppTheme.getColor(context).onSurfaceVariant,
          fontSize: 13 * Responsive.getResponsiveText(context),
          fontWeight: FontWeight.bold,
        ),
        SizedBox(height: 0.005 * Responsive.getHeight(context)),

        NewTextField(
          controller: joiningDateController,
          hintText: 'Select here',
          prefixIconPath: AppAssets.joiningDate,
          suffixIconPath: AppAssets.downArrow,
          enabled: false,

          onTap: () async {
            showModalBottomSheet(
              backgroundColor: AppColors.white,
              context: context,
              builder: (context) => Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8.0,
                  vertical: 10,
                ),
                child: DialDatePickerWidget(
                  initialDate: DateTime.now(),
                  onSubmit: (selectedDate) {
                    final String date = DateFormat('dd-MM-yy',).format(selectedDate);
                    joiningDateController.text = date;
                    Navigator.pop(context);
                  },
                ),
              ),
            );
          },
        ),

        SizedBox(height: 0.020 * Responsive.getHeight(context)),

        // First Name and Last Name
        Row(
          children: [
            Expanded(
              child: NewTextField(
                label: 'First Name',
                hintText: 'First Name',
                controller: _firstNameController,
                // Add validation if needed
                isRequired: true,
              ),
            ),
            SizedBox(width: 0.02 * Responsive.getWidth(context)),
            Expanded(
              child: NewTextField(
                label: 'Last Name',
                hintText: 'Last Name',
                controller: _lastNameController,
                // Add validation if needed
                isRequired: true,
              ),
            ),
          ],
        ),

        SizedBox(height: 0.020 * Responsive.getHeight(context)),


        CustomText(
          'Gender',
          color: AppTheme.getColor(context).onSurfaceVariant,
          fontSize: 13 * Responsive.getResponsiveText(context),
          fontWeight: FontWeight.bold,
        ),

        SizedBox(height: 0.005 * Responsive.getHeight(context)),
        Row(
          children: [
            CustomTextRadioButton(
              gender: 'MALE',
              selectedGender: selectedGender,
              textStyle: TextStyle(
                fontFamily: 'Gilroy-semiBold',
                fontSize: 14 * Responsive.getResponsiveText(context),
                fontWeight: FontWeight.w600,
                color: AppTheme.getColor(context).onSurfaceVariant,
              ),
              onSelect: (val) {
                setState(() {
                  selectedGender = val;
                });
              },
              height: 0.063 * Responsive.getHeight(context),
              width: 0.43 * Responsive.getWidth(context),
            ),
            const Spacer(),
            CustomTextRadioButton(
              gender: 'FEMALE',
              selectedGender: selectedGender,
              textStyle: TextStyle(
              fontFamily: 'Gilroy-semiBold',
              fontSize: 14 * Responsive.getResponsiveText(context),
              fontWeight: FontWeight.w600,
              color: AppTheme.getColor(context).onSurfaceVariant,
            ),
              onSelect: (val) {
                setState(() {
                  selectedGender = val;
                });
              },
              height: 0.063 * Responsive.getHeight(context),
              width: 0.43 * Responsive.getWidth(context),
            ),
          ],
        ),

        SizedBox(height: 0.020 * Responsive.getHeight(context)),

        if ('240' == preferenceManager.getCountryId()) ...[
          CustomText(
            'Number of Dependent *',
            color: AppTheme.getColor(context).onSurfaceVariant,
            fontSize: 13 * Responsive.getResponsiveText(context),
            fontWeight: FontWeight.bold,
          ),
          SizedBox(height: 0.005 * Responsive.getHeight(context)),

          MyCoTextfield(
            controller: departmentNumberController,
            textAlignment: TextAlign.start,
            hintText: 'Type here',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                10 * Responsive.getResponsive(context),
              ),
              borderSide: BorderSide(color: AppTheme.getColor(context).outline),
            ),
            preFixImage: 'assets/sign_in/unit_number_icon.png',
            prefixIconConstraints: BoxConstraints(
              minHeight: 0.02 * Responsive.getHeight(context),
              minWidth: 0.11 * Responsive.getWidth(context),
            ),
          ),

          SizedBox(height: 0.020 * Responsive.getHeight(context)),
        ],

        CustomText(
          'Phone Number *',
          color: AppTheme.getColor(context).onSurfaceVariant,
          fontSize: 13 * Responsive.getResponsiveText(context),
          fontWeight: FontWeight.bold,
        ),
        SizedBox(height: 0.005 * Responsive.getHeight(context)),
        PhoneNumberField(
          selectedCountry: selectedCountry,
          countries: countryMap.keys.toList(),
          onCountryChanged: (value, index) {
            if (value != null) {
              setState(() {
                selectedCountry = value;
              });
            }
          },
          countryDialCodes: countryMap,
          phoneController: phoneNumberController,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              15 * Responsive.getResponsive(context),
            ),
            border: Border.all(color: AppTheme.getColor(context).outline),
            color: AppTheme.getColor(context).onPrimary,
          ),
        ),

        SizedBox(height: 0.020 * Responsive.getHeight(context)),

         NewTextField(
          label: 'Email Address',
          hintText: 'Enter here',
          controller: _emailController,
           prefixIconPath: 'assets/sign_in/email_icon.png',
        ),

        SizedBox(height: 0.015 * Responsive.getHeight(context)),
        Row(
          children: [
            CustomCheckbox(
              value: isChecked,
              onChanged: (val) {
                setState(() {
                  isChecked = val;
                });
              },
              borderColor: isChecked
                  ? AppTheme.getColor(context).primary
                  : AppTheme.getColor(context).primary,
              activeColor: AppTheme.getColor(context).primaryContainer,
              checkColor: AppTheme.getColor(context).primary,
              height: 0.026 * Responsive.getHeight(context),
              width: 0.056 * Responsive.getWidth(context),
              unCheckedBackground: AppTheme.getColor(context).primaryContainer,
            ),
            SizedBox(width: 0.015 * Responsive.getWidth(context)),
            SizedBox(
              width: 0.82 * Responsive.getWidth(context),
              child: RichText(
                text: TextSpan(
                  style: TextStyle(
                    color: AppTheme.getColor(context).onSurface,
                    fontSize: 14 * Responsive.getResponsiveText(context),
                  ),
                  children: [
                    TextSpan(
                      text: 'Please confirm that you agree to our ',
                      style: TextStyle(
                        color: AppTheme.getColor(context).onSurface,
                        fontSize: 12 * Responsive.getResponsiveText(context),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    TextSpan(
                      text: 'Privacy Policy',
                      style: TextStyle(
                        color: AppTheme.getColor(context).primary,
                        fontSize: 12 * Responsive.getResponsiveText(context),
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            builder: (_) => const BottomTermAndCondition(),
                          );
                        },
                    ),
                    const TextSpan(text: ', '),
                    TextSpan(
                      text: 'Terms & Conditions',
                      style: TextStyle(
                        color: AppTheme.getColor(context).primary,
                        fontSize: 12 * Responsive.getResponsiveText(context),
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            builder: (_) => const BottomTermAndCondition(),
                          );
                        },
                    ),
                    TextSpan(
                      text: ' & ',
                      style: TextStyle(
                        color: AppTheme.getColor(context).onSurface,
                        fontSize: 14 * Responsive.getResponsiveText(context),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    TextSpan(
                      text: 'Cancellation & Refund Policy',
                      style: TextStyle(
                        color: AppTheme.getColor(context).primary,
                        fontSize: 12 * Responsive.getResponsiveText(context),
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            builder: (_) => const BottomTermAndCondition(),
                          );
                        },
                    ),
                    TextSpan(
                      text: '.',
                      style: TextStyle(
                        color: AppTheme.getColor(context).onSurface,
                        fontSize: 14 * Responsive.getResponsiveText(context),
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 0.1 * Responsive.getWidth(context)),
        MyCoButton(
          textStyle: TextStyle(
            color: AppTheme.getColor(context).onPrimary,
            fontSize: 16 * Responsive.getResponsiveText(context),
            fontWeight: FontWeight.bold,
          ),
          onTap: () {

            final bool isValid = FormValidator.validateAll(
              selectedBranchId: selectedBranchId,
              selectedDepartmentId: selectedDepartmentId,
              selectedDesignationId: selectedDesignationId,
              joiningDate: joiningDateController.text,
              phoneNumber: phoneNumberController,
              firstNameController: _firstNameController,
              lastNameController: _lastNameController,
              emailController: _emailController,
              profileImage: profileImage,
              departmentNumberController: departmentNumberController,
              preferenceManager: preferenceManager,
            );
            if (!isValid) return;

            final String platform = Platform.isAndroid ? 'android' : 'ios';


            final dataMap = {
              'addPrimaryUser': 'addPrimaryUser',
              'society_id': societyId,
              'society_address': societyAddress,
              'block_id': selectedBranchId,
              'floor_id': selectedDepartmentId,
              'unit_id': '0',
              'shift_time_id': selectedShiftId,
              'designation': selectedDesignationName,
              'user_first_name': _firstNameController.text,
              'user_last_name': _lastNameController.text,
              'user_full_name': '${_firstNameController.text} ${_lastNameController.text}',
              'user_mobile': phoneNumberController.text,
              'user_email': _emailController.text,
              'user_profile_pic': profileImage,
              'user_type': '0',
              'user_token': 'cIkYCvpYR9yMnlfHzsDZYi:APA91bH-uXuHf2w4xvrhn4KrTAG8BGG8ai8FhR7IgS3et5J3UQtLMuL9j2UCYxOyMC3BQJJTHPgg5LX1JVeehELDfa4aUX278e7FJ6zsyDe8iPvnDwjM8CU',
              'device': platform,
              'gender': selectedGender,
              'country_code': '+91'/*selectedCountry*/, //
              'unit_name': '',
              'newUserByAdmin': isAddByAdmin! ? '1' : '0',
              'joining_date': joiningDateController.text,
              'language_id': '1', //
              'sub_department_id': selectedSubDepartmentId,
              'vi_dependants': departmentNumberController.text,
              'designation_id': selectedDesignationId,
            };

            // Pretty print:
            dataMap.forEach((key, value) {
              print('data add primary: $value');
            });


            context.read<PrimaryRegisterBloc>().add(LoadAddPrimaryUser(dataMap));

            // PrimaryRegisterBloc(
            //   registerUseCase: GetIt.I<PrimaryRegisterUseCase>(),
            // ).add(LoadAddPrimaryUser(dataMap));

            // showCustomEmailVerificationSheet(
            //   imageUrl: 'assets/sign_in/email.png',
            //   imageHeight: 0.035 * Responsive.getHeight(context),
            //   imageWidth: 0.09 * Responsive.getWidth(context),
            //   // isDialog: true,
            //   context: context,
            //   title: 'Email Verification Sent!',
            //   description:
            //   'A verification code will be sent to the email Hello@work.com for your account verification process.',
            //   emailAddress: "example@example.com",
            //   onSubmit: (String otp) {
            //     dev.log("OTP submitted: $otp");
            //     // context.pop();
            //     showModalBottomSheet(
            //       context: context,
            //       backgroundColor: AppTheme.getColor(context).onPrimary,
            //       builder: (context) => BottomGetStarted(),
            //     );
            //   },
            //   onResend: () {
            //     dev.log("Resend OTP");
            //   },
            //   onVerifyButtonPressed: () {
            //     dev.log("Verify button pressed");
            //     context.pop();
            //     showModalBottomSheet(
            //       context: context,
            //       backgroundColor: AppTheme.getColor(context).onPrimary,
            //       builder: (context) => BottomGetStarted(),
            //     );
            //   },
            //   length: 6,
            // );
          },
          title: 'Sign Up',
          boarderRadius: 30 * Responsive.getResponsive(context),
          isShadowBottomLeft: true,
        ),
        SizedBox(height: 0.1 * Responsive.getWidth(context)),
        Center(
          child: GestureDetector(
            onTap: () {
              context.pop();
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(
                  'Already have an account?',
                  fontSize: 13 * Responsive.getResponsiveText(context),
                  fontWeight: FontWeight.bold,
                  color: AppTheme.getColor(context).onSurface,
                ),
                const SizedBox(width: 5),
                CustomText(
                  'Sign in here',
                  fontSize: 13 * Responsive.getResponsiveText(context),
                  fontWeight: FontWeight.bold,
                  color: AppTheme.getColor(context).primary,
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 0.015 * Responsive.getHeight(context)),
      ],
    ),
  );
}

mixin FormValidator {
  static String? validateNotEmpty(String value, String fieldName) {
    if (value.trim().isEmpty) {
      return '$fieldName is required';
    }
    return null;
  }

  static bool validateAll({
    required String selectedBranchId,
    required String selectedDepartmentId,
    required String selectedDesignationId,
    required String joiningDate,
    required TextEditingController phoneNumber,
    required TextEditingController firstNameController,
    required TextEditingController lastNameController,
    required TextEditingController emailController,
    required String profileImage,
    required TextEditingController departmentNumberController,
    required PreferenceManager preferenceManager,
  }) {

    if (/*!isAddByAdmin && !isAddMoreUnit && */profileImage.isEmpty) {
      Fluttertoast.showToast(msg: 'Please select profile picture', backgroundColor: Colors.redAccent, textColor: Colors.white,);
      return false;
    }
    if (selectedBranchId.isEmpty) {
      Fluttertoast.showToast(msg: 'Please select your Branch', backgroundColor: Colors.redAccent, textColor: Colors.white,);
      return false;
    } else if (selectedDepartmentId.isEmpty) {
      Fluttertoast.showToast(msg: 'Please select your Department', backgroundColor: Colors.redAccent, textColor: Colors.white,);
      return false;
    } else if (selectedDesignationId.isEmpty) {
      Fluttertoast.showToast(msg: 'Please select your Designation', backgroundColor: Colors.redAccent, textColor: Colors.white,);
      return false;
    } else if (joiningDate.isEmpty) {
      Fluttertoast.showToast(msg: 'Please select Joining Date', backgroundColor: Colors.redAccent, textColor: Colors.white,);
      return false;
    } else if (firstNameController.text.isEmpty) {
      Fluttertoast.showToast(msg: 'Please enter first name', backgroundColor: Colors.redAccent, textColor: Colors.white,);
      return false;
    } else if (lastNameController.text.isEmpty) {
      Fluttertoast.showToast(msg: 'Please enter last name', backgroundColor: Colors.redAccent, textColor: Colors.white,);
      return false;
    } else if ('240' == preferenceManager.getCountryId() && departmentNumberController.text.isEmpty) {
      Fluttertoast.showToast(msg: 'Please enter number of department', backgroundColor: Colors.redAccent, textColor: Colors.white,);
      return false;
    } else if (emailController.text.toString().isNotEmpty && !isValidEmail(emailController.text)) {
      Fluttertoast.showToast(msg: 'Please enter valid email address', backgroundColor: Colors.redAccent, textColor: Colors.white,);
      return false;
    } else if (phoneNumber.text.length < 7 || phoneNumber.text.length > 15) {
      Fluttertoast.showToast(msg: 'Please enter Mobile Number', backgroundColor: Colors.redAccent, textColor: Colors.white,);
      return false;
    }

    return true;
  }
}

bool isValidEmail(String email) {
  // Simple email validation regex
  final RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  return emailRegex.hasMatch(email);
}
