import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myco_flutter/constants/app_assets.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/my_visit/presentation/widgets/close_end_visit_button_widget.dart';
import 'package:myco_flutter/features/my_visit/presentation/widgets/follow_up_widget.dart';
import 'package:myco_flutter/features/my_visit/presentation/widgets/select_attachment_widget.dart';
import 'package:myco_flutter/features/my_visit/presentation/widgets/visit_type_selection.dart';
import 'package:myco_flutter/widgets/custom_checkbox.dart';
import 'package:myco_flutter/widgets/custom_label_textfield.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

class RemarkBottomSheet extends StatefulWidget {
  const RemarkBottomSheet({super.key});

  @override
  State<RemarkBottomSheet> createState() => _RemarkBottomSheetState();
}

class _RemarkBottomSheetState extends State<RemarkBottomSheet> {
  String selectedGender = '';
  String? selectedVisitTime;
  String? selectedVisitDate;
  bool autoStartVisit = false;

  final List<String> visitTimes = [
    '08:00 AM',
    '09:00 AM',
    '10:00 AM',
    '11:00 AM',
    '12:00 PM',
    '01:00 PM',
    '02:00 PM',
    '03:00 PM',
    '04:00 PM',
    '05:00 PM',
    '06:00 PM',
  ];

  final List<String> visitDates = [
    '09 Jul 2025',
    '10 Jul 2025',
    '11 Jul 2025',
    '12 Jul 2025',
    '13 Jul 2025',
    '14 Jul 2025',
    '15 Jul 2025',
    '16 Jul 2025',
    '17 Jul 2025',
    '18 Jul 2025',
    '19 Jul 2025',
    '20 Jul 2025',
    '21 Jul 2025',
    '22 Jul 2025',
  ];

  @override
  Widget build(BuildContext context) => Padding(
    padding: EdgeInsets.symmetric(
      horizontal: 16.0 * Responsive.getResponsive(context),
    ),
    child: SingleChildScrollView(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        left: 16.0 * Responsive.getResponsive(context),
        right: 16.0 * Responsive.getResponsive(context),
        top: 20 * Responsive.getResponsive(context),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        spacing: 12 * Responsive.getResponsive(context),
        children: [
          SizedBox(height: 0.03 * Responsive.getHeight(context)),

          // Remark text field
          LabeledTextField(
            textAlignment: TextAlign.start,
            label: 'Remark',
            hint: 'Type here',
            isSuffixIconOn: false,
            fontWeight: FontWeight.w700,
            widthFactor: Responsive.getWidth(context),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: AppTheme.getColor(context).outline),
              borderRadius: BorderRadius.circular(
                10 * Responsive.getResponsive(context),
              ),
            ),
            prefix: SvgPicture.asset(
              AppAssets.assetMessageEdit,
              fit: BoxFit.scaleDown,
            ),
          ),

          //  widget Follow-up time and date selection
          FollowUpWidget(
            visitTimes: visitTimes,
            selectedVisitTime: selectedVisitTime,
            visitDates: visitDates,
            selectedVisitDate: selectedVisitDate,
          ),

          // widget for visit type selector
          VisitTypeSelector(
            initialSelection: 'Field Visit',
            onChanged: (val) {},
          ),

          // Textfield for Visit Area
          LabeledTextField(
            textAlignment: TextAlign.start,
            label: 'Visit Area',
            hint: 'Type here',
            isSuffixIconOn: false,
            fontWeight: FontWeight.w700,
            widthFactor: Responsive.getWidth(context),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: AppTheme.getColor(context).outline),
              borderRadius: BorderRadius.circular(
                10 * Responsive.getResponsive(context),
              ),
            ),
            prefix: SvgPicture.asset(
              AppAssets.assetArrowSquare,
              fit: BoxFit.scaleDown,
            ),
          ),

          //TextField for Visit Catalogue
          LabeledTextField(
            textAlignment: TextAlign.start,
            label: 'Visit Catalogue',
            hint: 'Type here',
            isSuffixIconOn: false,
            fontWeight: FontWeight.w700,
            widthFactor: Responsive.getWidth(context),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: AppTheme.getColor(context).outline),
              borderRadius: BorderRadius.circular(
                10 * Responsive.getResponsive(context),
              ),
            ),
            prefix: SvgPicture.asset(
              AppAssets.assetNoteFavorite,
              fit: BoxFit.scaleDown,
            ),
          ),

          //Textfield for Contact Person Name
          LabeledTextField(
            textAlignment: TextAlign.start,
            label: 'Visit Contact Person Name',
            hint: 'Type here',
            isSuffixIconOn: false,
            fontWeight: FontWeight.w700,
            widthFactor: Responsive.getWidth(context),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: AppTheme.getColor(context).outline),
              borderRadius: BorderRadius.circular(
                10 * Responsive.getResponsive(context),
              ),
            ),
            prefix: SvgPicture.asset(
              AppAssets.assetProfileCircle,
              fit: BoxFit.scaleDown,
            ),
          ),

          // label for Attachment
          CustomText(
            'Attachment',
            fontWeight: FontWeight.w700,
            fontSize: 16 * Responsive.getResponsiveText(context),
            color: AppTheme.getColor(context).onSurfaceVariant,
          ),

          // Media Picker container
          const SelectAttachmentWidget(
            label: 'Select Attachment',
            iconPath: AppAssets.assetBookmark_2,
          ),

          SizedBox(height: 0.05 * Responsive.getHeight(context)),

          // Checkbox for "Order Placed?"
          Row(
            spacing: 8 * Responsive.getResponsive(context),
            children: [
              CustomCheckbox(
                value: autoStartVisit,
                onChanged: (value) => setState(() => autoStartVisit = value),
                borderColor: AppTheme.getColor(context).onSurface,
                activeColor: AppTheme.getColor(context).primary,
                checkColor: AppTheme.getColor(context).onPrimary,
                height: 0.02 * Responsive.getHeight(context),
                width: 0.042 * Responsive.getWidth(context),
                unCheckedBackground: AppTheme.getColor(context).onSecondary,
              ),
              const CustomText('Order Placed ?'),
            ],
          ),

          // Buttons Close & End Visit
          const CloseEndVistButtonWidget(),
          SizedBox(height: 0.06 * Responsive.getHeight(context)),
        ],
      ),
    ),
  );
}
