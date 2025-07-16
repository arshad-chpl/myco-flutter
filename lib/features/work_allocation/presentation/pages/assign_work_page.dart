import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myco_flutter/constants/app_assets.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/work_allocation/presentation/widgets/Employee_details.dart';
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
  final List<String> visitPurposes = ['Sales', 'Support', 'Demo'];
  String? selectedVisitPurpose;

  // MARK: Controllers for text fields
  final TextEditingController srNoController = TextEditingController();
  final TextEditingController siteController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController startDateController = TextEditingController();
  final TextEditingController targetDateController = TextEditingController();
  final TextEditingController remarkController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.getColor(context);
    final responsive = Responsive.getResponsive(context);
    final textScale = Responsive.getResponsiveText(context);

    return Scaffold(
      appBar: CustomAppbar(
        appBarBackgoundColor: theme.surface,
        elevation: 0,
        centerTitle: false,
        leading: const BackButton(),
        appBarTitleWidget: CustomText(
          'Assign Work',
          fontSize: 24 * textScale,
          fontWeight: FontWeight.w700,
          color: theme.onSurface,
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: 20 * responsive,
          vertical: 12 * responsive,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // MARK: Work Category
            _buildLabelWithAsterisk(context, 'Category'),
            SizedBox(height: 6 * responsive),
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
                fontSize: 16 * textScale,
                color: theme.outline,
                fontWeight: FontWeight.w600,
              ),
              border: Border.all(color: theme.outline),
            ),
            SizedBox(height: 12 * responsive),

            // MARK: Project Sr No
            _buildLabeledField(
              context,
              label: 'Project Sr No *',
              controller: srNoController,
              icon: AppAssets.receiptEdittt,
              validator: (v) => _validateRequired(v, 'Project Sr No'),
            ),

            // MARK: Site
            _buildLabeledField(
              context,
              label: 'Site *',
              controller: siteController,
              validator: (v) => _validateRequired(v, 'Site'),
            ),

            // MARK: Location
            _buildLabeledField(
              context,
              label: 'Location *',
              controller: locationController,
              validator: (v) => _validateRequired(v, 'Location'),
            ),

            // MARK: Start Date
            _buildLabeledField(
              context,
              label: 'Start Date (DD/MM/YYYY) *',
              hint: 'Select',
              controller: startDateController,
              validator: (v) => _validateRequired(v, 'Start Date'),
            ),

            // MARK: Target Date of Completion
            _buildLabeledField(
              context,
              label: 'Target Date of Completion (DD/MM/YYYY) *',
              hint: 'Select',
              controller: targetDateController,
              validator: (v) =>
                  _validateRequired(v, 'Target Date of Completion'),
            ),

            // MARK: Assign Work Engineer
            AssignEngineerField(
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
              ],
            ),

            SizedBox(height: 12 * responsive),

            // MARK: Remark
            CustomText(
              'Remark',
              isKey: true,
              color: theme.onSurfaceVariant,
              fontSize: 14 * textScale,
              fontWeight: FontWeight.w600,
            ),
            SizedBox(height: 8 * responsive),
            BigMyCoTextField(
              controller: remarkController,
              hintText: 'Type here',
              maxLines: 5,
              height: 120 * responsive,
              textInputType: TextInputType.multiline,
              validator: (v) => _validateRequired(v, 'Remark'),
              hintStyle: TextStyle(
                color: theme.outline,
                fontSize: 16 * textScale,
              ),
              style: TextStyle(fontSize: 16 * textScale, color: theme.primary),
              border: OutlineInputBorder(
                borderSide: const BorderSide(color: AppColors.borderColor),
                borderRadius: BorderRadius.circular(12 * responsive),
              ),
            ),

            SizedBox(height: 12 * responsive),

            // MARK: Submit Button
            MyCoButton(
              title: 'Submit',
              onTap: () {
                // TODO: Add submission logic
              },
              backgroundColor: AppColors.primary,
              textStyle: TextStyle(
                fontSize: 16 * textScale,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
              width: double.infinity,
              isShadowBottomLeft: true,
              boarderRadius: 30,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLabelWithAsterisk(BuildContext context, String label) {
    final textScale = Responsive.getResponsiveText(context);
    return Row(
      children: [
        CustomText(
          label,
          fontSize: 14 * textScale,
          fontWeight: FontWeight.w600,
          color: AppTheme.getColor(context).onSurface,
        ),
        CustomText(
          ' *',
          fontSize: 14 * textScale,
          fontWeight: FontWeight.w600,
          color: Colors.red,
        ),
      ],
    );
  }

  Widget _buildLabeledField(
    BuildContext context, {
    required String label,
    String hint = 'Type here',
    required TextEditingController controller,
    String? icon,
    String? Function(String?)? validator,
  }) {
    final theme = AppTheme.getColor(context);
    final textScale = Responsive.getResponsiveText(context);
    final responsive = Responsive.getResponsive(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LabeledTextField(
          label: label,
          hint: hint,
          hintTextStyle: TextStyle(color: theme.outline),
          controller: controller,
          widthFactor: Responsive.getWidth(context),
          textInputType: TextInputType.text,
          textAlignment: TextAlign.start,
          prefix: icon != null
              ? SvgPicture.asset(icon, fit: BoxFit.scaleDown)
              : null,
          validator: validator,
        ),
        SizedBox(height: 12 * responsive),
      ],
    );
  }

  String? _validateRequired(String? value, String field) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter $field';
    }
    return null;
  }
}
