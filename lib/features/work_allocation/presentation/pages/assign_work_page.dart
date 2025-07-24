import 'package:flutter/material.dart';
import 'package:myco_flutter/constants/app_assets.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/work_allocation/presentation/widgets/Employee_details.dart';
import 'package:myco_flutter/features/work_allocation/presentation/widgets/category_dropdown_bottom_sheet.dart';
import 'package:myco_flutter/widgets/custom_appbar.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_text.dart';
import 'package:myco_flutter/widgets/custom_text_field_new.dart';

class AssignWorkPage extends StatefulWidget {
  const AssignWorkPage({super.key});

  @override
  State<AssignWorkPage> createState() => _AssignWorkPageState();
}

class _AssignWorkPageState extends State<AssignWorkPage> {
  final _formKey = GlobalKey<FormState>();

  final List<String> visitPurposes = ['Select', 'Testing', 'AI Tools'];
  String? selectedVisitPurpose;
  String? categoryError;

  final TextEditingController srNoController = TextEditingController();
  final TextEditingController siteController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController startDateController = TextEditingController();
  final TextEditingController targetDateController = TextEditingController();
  final TextEditingController remarkController = TextEditingController();

  @override
  void dispose() {
    srNoController.dispose();
    siteController.dispose();
    locationController.dispose();
    startDateController.dispose();
    targetDateController.dispose();
    remarkController.dispose();
    super.dispose();
  }

  void validation() {
    final isValid = _formKey.currentState?.validate() ?? false;

    setState(() {
      categoryError = null;
      if (selectedVisitPurpose == null || selectedVisitPurpose == 'Select') {
        categoryError = 'Please select work category';
      }
    });

    if (isValid && categoryError == null) {
      debugPrint('Form is fully valid!');
    }
  }

  Widget errorText(String? msg) => msg == null
      ? const SizedBox()
      : Padding(
          padding: EdgeInsets.only(top: 4 * Responsive.getResponsive(context)),
          child: CustomText(
            msg,
            color: AppColors.red,
            fontSize: 12 * Responsive.getResponsiveText(context),
            fontWeight: FontWeight.w500,
          ),
        );

  @override
  Widget build(BuildContext context) {
    final spacing = 12 * Responsive.getResponsive(context);

    return Scaffold(
      appBar: const CustomAppbar(title: 'Assign Work'),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: 16 * Responsive.getResponsive(context),
        ),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // Category (Dropdown)
              NewTextField(
                label: 'Category',
                isRequired: true,
                hintText: selectedVisitPurpose ?? '  Work Category',
                prefixIconPath: AppAssets.element_1,
                suffixIconPath: AppAssets.downArrow,
                onTap: () async {
                  final selected = await showModalBottomSheet<String>(
                    context: context,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                    ),
                    builder: (context) => categoryDropdownBottomSheet(
                      context,
                      visitPurposes: visitPurposes,
                      selectedVisitPurpose: selectedVisitPurpose,
                    ),
                  );
                  if (selected != null) {
                    setState(() {
                      selectedVisitPurpose = selected;
                      categoryError = null;
                    });
                  }
                },
              ),


              errorText(categoryError),
              SizedBox(height: spacing),

              // Project Sr No
              NewTextField(
                label: 'Project Sr No',
                isRequired: true,
                prefixIconPath: AppAssets.receiptEdittt,
                controller: srNoController,
                hintText: 'Type here',
                validator: (val) {
                  if (val == null || val.trim().isEmpty) {
                    return 'Please enter Project Sr No';
                  }
                  return null;
                },
              ),
              SizedBox(height: spacing),

              // Site
              NewTextField(
                label: 'Site',
                prefixIconPath: AppAssets.monitor,
                controller: siteController,
                isRequired: true,
                hintText: 'Type here',
                validator: (val) {
                  if (val == null || val.trim().isEmpty) {
                    return 'Please enter Site';
                  }
                  return null;
                },
              ),
              SizedBox(height: spacing),

              // Location
              NewTextField(
                label: 'Location',
                prefixIconPath: AppAssets.location1,
                controller: locationController,
                isRequired: true,
                hintText: 'Type here',
                validator: (val) {
                  if (val == null || val.trim().isEmpty) {
                    return 'Please enter Location';
                  }
                  return null;
                },
              ),
              SizedBox(height: spacing),

              // Start Date
              NewTextField(
                label: 'Start Date (DD/MM/YYYY)',
                prefixIconPath: AppAssets.assetNoteFavorite,
                controller: startDateController,
                isRequired: true,
                hintText: 'Select',
                validator: (val) {
                  if (val == null || val.trim().isEmpty) {
                    return 'Please enter Start Date';
                  }
                  return null;
                },
                onTap: () {
                  // TODO: Add date picker logic
                },
              ),
              SizedBox(height: spacing),

              // Target Date
              NewTextField(
                label: 'Target Date of Completion (DD/MM/YYYY)',
                prefixIconPath: AppAssets.assetNoteFavorite,
                controller: targetDateController,
                isRequired: true,
                hintText: 'Select',
                validator: (val) {
                  if (val == null || val.trim().isEmpty) {
                    return 'Please enter Target Date';
                  }
                  return null;
                },
                onTap: () {
                  // TODO: Add date picker logic
                },
              ),
              SizedBox(height: spacing),

              // Assign Engineers
              const AssignEngineerField(
                allEmployees: [
                  Employee(
                    name: 'Rushda Baqui',
                    role: 'iOS developer',
                    imageUrl: 'https://example.com/avatar1.jpg',
                  ),
                  Employee(
                    name: 'Shivangi Abhani',
                    role: 'QA',
                    imageUrl: 'https://example.com/avatar2.jpg',
                  ),
                  Employee(
                    name: 'Bhakti Dalwadi',
                    role: 'Flutter',
                    imageUrl: 'https://example.com/avatar2.jpg',
                  ),
                  Employee(
                    name: 'Shantanu Limje',
                    role: 'QA',
                    imageUrl: 'https://example.com/avatar2.jpg',
                  ),
                  Employee(
                    name: 'Demo',
                    role: 'Flutter',
                    imageUrl: 'https://example.com/avatar2.jpg',
                  ),
                ],
              ),
              SizedBox(height: spacing),

              // Remark
              NewTextField(
                controller: remarkController,
                label: 'Remark',
                hintText: 'Type here',
                prefixIconPath: AppAssets.msgedit,
                maxLines: 10,
                keyboardType: TextInputType.multiline,
                isRequired: true,
                validator: (val) {
                  if (val == null || val.trim().isEmpty) {
                    return 'Please enter Remark';
                  }
                  return null;
                },
              ),
              SizedBox(height: 0.05 * Responsive.getHeight(context)),

              // Submit Button
              Padding(
                padding: EdgeInsets.only(
                  bottom: 50 * Responsive.getResponsive(context),
                ),
                child: MyCoButton(
                  title: 'Submit',
                  onTap: validation,
                  backgroundColor: AppTheme.getColor(context).primary,
                  textStyle: TextStyle(
                    fontSize: 16 * Responsive.getResponsiveText(context),
                    color: AppTheme.getColor(context).onPrimary,
                    fontWeight: FontWeight.w500,
                  ),
                  width: double.infinity,
                  isShadowBottomLeft: true,
                  boarderRadius: 30,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
