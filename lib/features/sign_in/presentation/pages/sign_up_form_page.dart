import 'dart:io';

import 'package:badges/badges.dart' as badges;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:myco_flutter/constants/constants.dart';
import 'package:myco_flutter/core/router/route_paths.dart';
import 'package:myco_flutter/core/services/preference_manager.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/common_api/domain/usecase/common_api_usercase.dart';
import 'package:myco_flutter/features/common_api/presentation/bloc/common_api_bloc.dart';
import 'package:myco_flutter/features/leave/presentation/widgets/ios_calendar_time_picker.dart';
import 'package:myco_flutter/features/sign_in/domain/usecases/primary_register_usecase.dart';
import 'package:myco_flutter/features/sign_in/presentation/bloc/primary_register_bloc.dart';
import 'package:myco_flutter/features/sign_in/presentation/pages/select_custom_dialog.dart';
import 'package:myco_flutter/features/sign_in/presentation/widgets/bottom_term_and_condition.dart';
import 'package:myco_flutter/widgets/custom_checkbox.dart';
import 'package:myco_flutter/widgets/custom_countrycodetextfield.dart';
import 'package:myco_flutter/widgets/custom_label_textfield.dart';
import 'package:myco_flutter/widgets/custom_media_picker_container/media_picker.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_text.dart';
import 'package:myco_flutter/widgets/custom_text_field.dart';
import 'package:myco_flutter/widgets/custom_text_radio_button.dart';

class SignupFormPage extends StatefulWidget {
  const SignupFormPage({super.key});

  @override
  State<SignupFormPage> createState() => _SignupFormPageState();
}

class _SignupFormPageState extends State<SignupFormPage> {
  String? selectedBranch;
  String selectedGender = 'Male';
  bool gender = false;
  String selectedCountry = 'IND';
  bool isChecked = false;
  final TextEditingController phoneController = TextEditingController();
  final Map<String, String> countryMap = {
    'IND': '+91',
    'USA': '+1',
    'INA': '+62',
  };


  final preferenceManager = GetIt.I<PreferenceManager>();



  //

  String profileImage = '';

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
  late  List<String> floorUnitOptionIds = [];
  late  List<String> floorUnitOptionNames = [];
  late  List<String> departmentOptionIds = [];
  late  List<String> departmentOptionNames = [];
  late  List<String> subDepartmentOptionIds = [];
  late  List<String> subDepartmentOptionNames = [];
  late  List<String> shiftOptionIds = [];
  late  List<String> shiftOptionNames = [];


  //selection in all bottom dialog
  void _showSelectionDialog({
    required List<String> optionId,
    required List<String> optionName,
    required String? selectedValue,
    required String title,
    required void Function(String selectedId, String selectedName) onSelected,
  }) {

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      backgroundColor: Colors.white,

      builder: (BuildContext context) => SelectCustomDialog(
        optionIds: optionId,
        optionNames: optionName,
        selectedId: selectedValue,
        title: title,
        onSelected: onSelected,
      ),
    );
  }

  //set default text field
  String getDefaultLabel(String field) {
    switch (field) {
      case 'branch':
        return 'Select your Branch';
      case 'department':
        return 'Select Your Department';
      case 'sub department':
        return 'Select Sub Department';
      case 'shift':
        return 'Shift time';
      case 'designation':
        return 'Designation';
      default:
        return '';
    }
  }


  Widget buildCustomSelector({
    required String label,
    required String selectedId,
    required String selectedName,
    required List<String> optionIds,
    required List<String> optionNames,
    required void Function(String id, String name) onSelected,
    required String defaultLabelKey,
    required String prefixIcon, // <- image path
  }) {
    final String defaultValue = getDefaultLabel(defaultLabelKey);
    final bool isDefault = selectedName == defaultValue;



    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
        ),
        GestureDetector(

          onTap: () {
            if (defaultLabelKey == 'branch' && optionIds.isEmpty) {
              Fluttertoast.showToast(msg: 'No branch found.', backgroundColor: Colors.redAccent, textColor: Colors.white,);
              return;
            }else if (defaultLabelKey == 'department' && optionIds.isEmpty) {
              Fluttertoast.showToast(msg: 'No department found.', backgroundColor: Colors.redAccent, textColor: Colors.white,);
              return;
            }else if (defaultLabelKey == 'sub department' && optionIds.isEmpty) {
              Fluttertoast.showToast(msg: 'No sub department found.', backgroundColor: Colors.redAccent, textColor: Colors.white,);
              return;
            }else if (defaultLabelKey == 'shift' && optionIds.isEmpty) {
              Fluttertoast.showToast(msg: 'No shift found.', backgroundColor: Colors.redAccent, textColor: Colors.white,);
              return;
            }else if (defaultLabelKey == 'designation' && optionIds.isEmpty) {
              Fluttertoast.showToast(msg: 'No designation found.', backgroundColor: Colors.redAccent, textColor: Colors.white,);
              return;
            }

            _showSelectionDialog(
              optionId: optionIds,
              optionName: optionNames,
              selectedValue: selectedId,
              title: defaultLabelKey[0].toUpperCase() + defaultLabelKey.substring(1),
              onSelected: (selectedId, selectedName) {
                onSelected(selectedId, selectedName);
              },
            );
          },
          child: AbsorbPointer(
            child: SizedBox(
              height: 75,
              child: TextFormField(
                readOnly: true,
                controller: TextEditingController(text: selectedName),
                style: TextStyle(
                  color: isDefault ? Colors.black45 : Colors.black,
                  fontSize: 16,
                ),
                decoration: InputDecoration(
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Image.asset(
                      prefixIcon,
                      width: 20,
                      height: 20,
                      fit: BoxFit.contain,
                    ),
                  ),
                  suffixIcon: const Icon(
                    Icons.arrow_drop_down,
                    color: Colors.black,
                  ),
                  hintText: defaultValue,
                  hintStyle: const TextStyle(color: Colors.black45),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 18),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: Color(0xFFBDBDBD), width: 1.2),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: Color(0xFFBDBDBD), width: 1.2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: Color(0xFF2F648E), width: 1.2),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: Color(0xFFBDBDBD), width: 1.2),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }


  @override
  Widget build(BuildContext context) => Container(
    color: AppTheme.getColor(context).surface,
    child: SafeArea(
      child: Scaffold(
        backgroundColor: AppTheme.getColor(context).surface,
        body: Padding(
          padding: EdgeInsets.all(20 * Responsive.getResponsive(context)),
          child: BlocConsumer<CommonApiBloc, CommonApiState>(
            listener: (context, state) {
              if (state is BlockApiSuccess) {
                branchOptionIds = state.blockList.block!.map((block) => block.blockId ?? '').toList();
                branchOptionNames = state.blockList.block!.map((block) => block.blockName ?? '').toList();
              }

              if (state is FloorUnitApiSuccess) {
                floorUnitOptionIds = state.floorUnitList.designation!.map((d) => d.designationId ?? '').toList();
                floorUnitOptionNames = state.floorUnitList.designation!.map((d) => d.designationName ?? '').toList();

                departmentOptionIds = state.floorUnitList.floors!.map((f) => f.floorId ?? '').toList();
                departmentOptionNames = state.floorUnitList.floors!.map((f) => f.floorName ?? '').toList();

                subDepartmentOptionIds = state.floorUnitList.subDepartmentList!.map((sd) => sd.subDepartmentId ?? '').toList();
                subDepartmentOptionNames = state.floorUnitList.subDepartmentList!.map((sd) => sd.subDepartmentName ?? '').toList();
              }

              if (state is ShiftApiSuccess) {
                shiftOptionIds = state.shiftList.shift!.map((s) => s.shiftTimeId ?? '').toList();
                shiftOptionNames = state.shiftList.shift!.map((s) => s.shiftTimeView ?? '').toList();
              }
            },

            builder: (context, state) {
              if (state is CommonApiLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              if (state is CommonApiError) {
                return Center(child: Text('Error: ${state.message}'));
              }
              // Show your form by default
              return setUi();
            },
          ),
        ),
      ),
    ),
  );



  Widget setUi() => SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 0.020 * Responsive.getHeight(context)),

          Center(
            child: badges.Badge(
              badgeStyle: const badges.BadgeStyle(
                badgeColor: Colors.transparent,
              ),
              position: badges.BadgePosition.bottomEnd(
                bottom: -22 * Responsive.getResponsive(context),
                end: -15 * Responsive.getResponsive(context),
              ),
              badgeContent: GestureDetector(
                onTap: () {
                  showMediaFilePicker(
                    isDialog: true,
                    isCameraShow: true,
                    isGalleryShow: true,
                    isDocumentShow: false,
                    context: context,
                  );
                },
                child: Image.asset(
                  'assets/sign_in/camera_icon.png',
                  fit: BoxFit.contain,
                  height: 0.04 * Responsive.getHeight(context),
                ),
              ),
              child: Image.asset(
                'assets/sign_in/contact_frame.png',
                fit: BoxFit.contain,
                height: 0.11 * Responsive.getHeight(context),
              ),
            ),
          ),

          SizedBox(height: 0.020 * Responsive.getHeight(context)),

          buildCustomSelector(
            label: 'Branch *',
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

              context.read<CommonApiBloc>().add(LoadFloorUnit(selectedBranchId));
              setState(() {});
            },
          ),
          SizedBox(height: 0.005 * Responsive.getHeight(context)),

          buildCustomSelector(
            label: 'Department *',
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

              context.read<CommonApiBloc>().add(LoadShift(selectedDepartmentId));
              setState(() {});
            },
          ),
          SizedBox(height: 0.005 * Responsive.getHeight(context)),

          if (subDepartmentOptionIds.isNotEmpty) ...[
            buildCustomSelector(
              label: 'Sub Department *',
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
            SizedBox(height: 0.005 * Responsive.getHeight(context)),
          ],

          buildCustomSelector(
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
          SizedBox(height: 0.005 * Responsive.getHeight(context)),

          buildCustomSelector(
            label: 'Designation *',
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
          SizedBox(height: 0.005 * Responsive.getHeight(context)),

          CustomText(
            'Joining Date *',
            color: AppTheme.getColor(context).onSurfaceVariant,
            fontSize: 16 * Responsive.getResponsiveText(context),
            fontWeight: FontWeight.bold,
          ),
          SizedBox(height: 0.005 * Responsive.getHeight(context)),

          MyCoTextfield(
            controller: joiningDateController,
            textAlignment: TextAlign.start,
            hintText: 'Type here',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10 * Responsive.getResponsive(context),),
              borderSide: BorderSide(color: AppTheme.getColor(context).outline),
            ),
            preFixImage: 'assets/sign_in/joining_date_icon.png',
            prefixIconConstraints: BoxConstraints(
              minHeight: 0.02 * Responsive.getHeight(context),
              minWidth: 0.10 * Responsive.getWidth(context),
            ),

            onClick: () {
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


          SizedBox(height: 0.015 * Responsive.getHeight(context)),

          Row(
            children: [
              LabeledTextField(
                label: 'First Name *',
                hint: 'First Name',
                textAlignment: TextAlign.start,
                controller: _firstNameController,
                validator: (val) =>
                val == null || val.isEmpty ? 'Required' : null,
                textInputType: TextInputType.name,
                widthFactor: 0.43 * Responsive.getWidth(context),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: AppTheme.getColor(context).outline),
                  borderRadius: BorderRadius.circular(10 * Responsive.getResponsive(context)),
                ),
                textFieldHeight: 0.063 * Responsive.getHeight(context),
                typingtextStyle: TextStyle(
                  color: AppTheme.getColor(context).onSurface,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Spacer(),
              LabeledTextField(
                typingtextStyle: TextStyle(
                  color: AppTheme.getColor(context).onSurface,
                  fontWeight: FontWeight.w600,
                ),
                label: 'Last Name *',
                hint: 'Last Name',
                textAlignment: TextAlign.start,
                controller: _lastNameController,
                validator: (val) =>
                val == null || val.isEmpty ? 'Required' : null,
                textInputType: TextInputType.name,
                widthFactor: 0.43 * Responsive.getWidth(context),
                textFieldHeight: 0.063 * Responsive.getHeight(context),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: AppTheme.getColor(context).outline),
                  borderRadius: BorderRadius.circular(10 * Responsive.getResponsive(context)),
                ),
              ),
            ],
          ),

          SizedBox(height: 0.015 * Responsive.getHeight(context)),


          CustomText(
            'Gender',
            color: AppTheme.getColor(context).onSurfaceVariant,
            fontSize: 16 * Responsive.getResponsiveText(context),
            fontWeight: FontWeight.bold,
          ),

          SizedBox(height: 0.005 * Responsive.getHeight(context)),
          Row(
            children: [
              CustomTextRadioButton(
                gender: 'MALE',
                selectedGender: selectedGender,
                onSelect: (val) {
                  setState(() {
                    selectedGender = val;
                  });
                },
                height: 0.063 * Responsive.getHeight(context),
                width: 0.43 * Responsive.getWidth(context),
              ),
              Spacer(),
              CustomTextRadioButton(
                gender: 'FEMALE',
                selectedGender: selectedGender,
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
          SizedBox(height: 0.015 * Responsive.getHeight(context)),

          if('240' == preferenceManager.getCountryId())...[
            CustomText(
              'Number of Dependent *',
              color: AppTheme.getColor(context).onSurfaceVariant,
              fontSize: 16 * Responsive.getResponsiveText(context),
              fontWeight: FontWeight.bold,
            ),
            SizedBox(height: 0.005 * Responsive.getHeight(context)),

            MyCoTextfield(
              controller: departmentNumberController,
              textAlignment: TextAlign.start,
              hintText: 'Type here',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10 * Responsive.getResponsive(context)),
                borderSide: BorderSide(color: AppTheme.getColor(context).outline),
              ),
              preFixImage: 'assets/sign_in/unit_number_icon.png',
              prefixIconConstraints: BoxConstraints(
                minHeight: 0.02 * Responsive.getHeight(context),
                minWidth: 0.11 * Responsive.getWidth(context),
              ),
            ),

            SizedBox(height: 0.015 * Responsive.getHeight(context)),
          ],

          CustomText(
            'Phone Number *',
            color: AppTheme.getColor(context).onSurfaceVariant,
            fontSize: 16 * Responsive.getResponsiveText(context),
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
            phoneController: phoneController,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15 * Responsive.getResponsive(context)),
              border: Border.all(color: AppTheme.getColor(context).outline),
              color: AppTheme.getColor(context).onPrimary,
            ),
          ),

          SizedBox(height: 0.015 * Responsive.getHeight(context)),

          CustomText(
            'Email Address',
            color: AppTheme.getColor(context).onSurfaceVariant,
            fontSize: 16 * Responsive.getResponsiveText(context),
            fontWeight: FontWeight.bold,
          ),
          SizedBox(height: 0.005 * Responsive.getHeight(context)),

          MyCoTextfield(
            controller: _emailController,
            textAlignment: TextAlign.start,
            hintText: 'abc@gmail.com',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10 * Responsive.getResponsive(context)),
              borderSide: BorderSide(color: AppTheme.getColor(context).outline),
            ),
            preFixImage: 'assets/sign_in/email_icon.png',
            prefixIconConstraints: BoxConstraints(
              minHeight: 0.02 * Responsive.getHeight(context),
              minWidth: 0.10 * Responsive.getWidth(context),
            ),
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
                unCheckedBackground: AppTheme.getColor(
                  context,
                ).primaryContainer,
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
                          fontSize: 14 * Responsive.getResponsiveText(context),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextSpan(
                        text: 'Privacy Policy',
                        style: TextStyle(
                          color: AppTheme.getColor(context).primary,
                          fontSize: 14 * Responsive.getResponsiveText(context),
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              builder: (_) => BottomTermAndCondition(),
                            );
                          },
                      ),
                      const TextSpan(text: ', '),
                      TextSpan(
                        text: 'Terms & Conditions',
                        style: TextStyle(color: AppTheme.getColor(context).primary),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              builder: (_) => BottomTermAndCondition(),
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
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              builder: (_) => BottomTermAndCondition(),
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
              fontSize: 20 * Responsive.getResponsiveText(context),
              fontWeight: FontWeight.bold,
            ),
            onTap: () {


              context.go(RoutePaths.contactAdmin);

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
                  preferenceManager : preferenceManager
              );
              if (!isValid) return;

              final String platform = Platform.isAndroid ? 'android' : 'ios';

              final dataMap = {
                'addPrimaryUser': 'addPrimaryUser',
                'society_id': '',
                'society_address': '',
                'block_id': selectedBranchId,
                'floor_id': selectedDepartmentId,
                'unit_id': '0',
                'shift_time_id': selectedShiftId,
                'designation': selectedDesignationName,
                'user_first_name': _firstNameController.text,
                'user_last_name': _lastNameController.text,
                'user_full_name': '${_firstNameController.text} ${_lastNameController.text}',
                'user_mobile': phoneNumberController,//
                'user_email': _emailController.text,
                'user_profile_pic': profileImage,//
                'user_type': '0',
                'user_token': '',
                'device': platform,
                'gender': selectedGender,
                'country_code': selectedCountry,//
                'unit_name': '',
                'newUserByAdmin': '',
                'joining_date': joiningDateController.text,
                'language_id': preferenceManager.getLanguageId(),
                'sub_department_id': selectedSubDepartmentId,
                'vi_dependants': departmentNumberController.text,
                'designation_id': selectedDesignationId,
              };

              PrimaryRegisterBloc(registerUseCase: GetIt.I<PrimaryRegisterUseCase>())
                  .add(LoadAddPrimaryUser(dataMap));

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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(
                  'Already have an account?',

                  fontSize: 18 * Responsive.getResponsiveText(context),
                  fontWeight: FontWeight.bold,
                  color: AppTheme.getColor(context).onSurface,
                ),
                CustomText(
                  'Sign in here',

                  fontSize: 18 * Responsive.getResponsiveText(context),
                  fontWeight: FontWeight.bold,
                  color: AppTheme.getColor(context).primary,
                ),
              ],
            ),
          ),
          SizedBox(height: 0.015 * Responsive.getHeight(context)),
        ],
      )
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
    required PreferenceManager preferenceManager

  }) {

    if (profileImage.isEmpty) {
      Fluttertoast.showToast(msg: 'Please select profile picture', backgroundColor: Colors.redAccent, textColor: Colors.white,);
      return false;
    }if (selectedBranchId.isEmpty) {
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
    } else if (emailController.text.toString().isNotEmpty && isValidEmail(emailController.text)) {
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
  final RegExp emailRegex = RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$');
  return emailRegex.hasMatch(email);
}
