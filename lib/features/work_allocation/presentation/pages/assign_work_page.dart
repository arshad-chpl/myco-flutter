import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myco_flutter/constants/app_assets.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/work_allocation/presentation/widgets/Employee_details.dart';
import 'package:myco_flutter/features/work_allocation/presentation/widgets/label_with_star.dart';
import 'package:myco_flutter/widgets/big_textfield.dart';
import 'package:myco_flutter/widgets/custom_appbar.dart';
import 'package:myco_flutter/widgets/custom_dropdown_button.dart';
import 'package:myco_flutter/widgets/custom_label_textfield.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

class AssignWorkPage extends StatefulWidget {
  const AssignWorkPage({super.key});

  @override
  State<AssignWorkPage> createState() => _AssignWorkPageState();
}

class _AssignWorkPageState extends State<AssignWorkPage> {
  final List<String> visitPurposes = ['Select', 'Testing', 'AI Tools'];
  String? selectedVisitPurpose;

  // Controllers for text fields
  final TextEditingController srNoController = TextEditingController();
  final TextEditingController siteController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController startDateController = TextEditingController();
  final TextEditingController targetDateController = TextEditingController();
  final TextEditingController remarkController = TextEditingController();

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: const CustomAppbar(title: 'Assign Work'),

    body: SingleChildScrollView(
      padding: EdgeInsets.symmetric(
        horizontal: 16 * Responsive.getResponsive(context),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Work Category
          labelWithAsterisk(context, 'Category'),
          SizedBox(height: 6 * Responsive.getResponsive(context)),
          CustomPopupDropdownStyled<String>(
            items: visitPurposes,
            hintText: '  Work Category',
            prefix: SvgPicture.asset(
              AppAssets.element_1,
              fit: BoxFit.scaleDown,
            ),
            selectedItem: selectedVisitPurpose,
            onChanged: (v, i) => setState(() => selectedVisitPurpose = v),
            itemToString: (item) => item,
            hintTextStyle: TextStyle(
              fontSize: 14 * Responsive.getResponsiveText(context),
              color: AppTheme.getColor(context).outline,
              fontWeight: FontWeight.w600,
            ),
            border: Border.all(color: AppTheme.getColor(context).outline),
          ),
          SizedBox(height: 12 * Responsive.getResponsive(context)),

          //Project Sr No
          buildLabeledField(
            context,
            label: 'Project Sr No *',
            controller: srNoController,
            icon: AppAssets.receiptEdittt,
            validator: (v) => validateRequired(v, 'Project Sr No'),
          ),

          //Site
          buildLabeledField(
            context,
            label: 'Site *',
            controller: siteController,
            icon: AppAssets.monitor,
            validator: (v) => validateRequired(v, 'Site'),
          ),

          //Location
          buildLabeledField(
            context,
            label: 'Location *',
            controller: locationController,
            icon: AppAssets.location1,
            validator: (v) => validateRequired(v, 'Location'),
          ),

          //Start Date
          buildLabeledField(
            context,
            label: 'Start Date (DD/MM/YYYY) *',
            hint: 'Select',
            controller: startDateController,
            icon: AppAssets.assetNoteFavorite,
            validator: (v) => validateRequired(v, 'Start Date'),
          ),

          //Target Date of Completion
          buildLabeledField(
            context,
            label: 'Target Date of Completion (DD/MM/YYYY) *',
            hint: 'Select',
            controller: targetDateController,
            icon: AppAssets.assetNoteFavorite,
            validator: (v) => validateRequired(v, 'Target Date of Completion'),
          ),

          //Assign Work Engineer
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

          SizedBox(height: 12 * Responsive.getResponsive(context)),

          //Remark
          CustomText(
            'Remark',
            isKey: true,
            color: AppTheme.getColor(context).onSurfaceVariant,
            fontSize: 14 * Responsive.getResponsiveText(context),
            fontWeight: FontWeight.w700,
          ),
          SizedBox(height: 8 * Responsive.getResponsive(context)),
          BigMyCoTextField(
            controller: remarkController,
            hintText: 'Type here',
            prefixImage: SvgPicture.asset(AppAssets.msgedit),
            maxLines: 5,
            height: 120 * Responsive.getResponsive(context),
            textInputType: TextInputType.multiline,
            validator: (v) => validateRequired(v, 'Remark'),
            hintStyle: TextStyle(
              color: AppTheme.getColor(context).outline,
              fontSize: 14 * Responsive.getResponsiveText(context),
              fontWeight: FontWeight.w600,
            ),
            style: TextStyle(
              fontSize: 16 * Responsive.getResponsiveText(context),
              color: AppTheme.getColor(context).primary,
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: AppTheme.getColor(context).outline),
              borderRadius: BorderRadius.circular(
                12 * Responsive.getResponsive(context),
              ),
            ),
          ),

          SizedBox(height: 0.050 * Responsive.getHeight(context)),

          //Submit Button
          Padding(
            padding: EdgeInsets.only(
              bottom: 50 * Responsive.getResponsive(context),
            ),
            child: MyCoButton(
              title: 'Submit',
              onTap: () {},
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
  );

  //for label text feild
  Widget buildLabeledField(
    BuildContext context, {
    required String label,
    String hint = 'Type here',
    required TextEditingController controller,
    String? icon,
    String? Function(String?)? validator,
  }) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      LabeledTextField(
        label: label,
        hint: hint,
        hintTextStyle: TextStyle(
          color: AppTheme.getColor(context).outline,
          fontSize: 14 * Responsive.getResponsiveText(context),
          fontWeight: FontWeight.w600,
        ),
        controller: controller,
        widthFactor: Responsive.getWidth(context),
        textInputType: TextInputType.text,
        textAlignment: TextAlign.start,
        prefix: icon != null
            ? SvgPicture.asset(icon, fit: BoxFit.scaleDown)
            : null,
        validator: validator,
      ),
      SizedBox(height: 12 * Responsive.getResponsive(context)),
    ],
  );

  String? validateRequired(String? value, String field) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter $field';
    }
    return null;
  }
}
