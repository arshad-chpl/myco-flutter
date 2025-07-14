import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myco_flutter/constants/app_assets.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/widgets/custom_dropdown_button.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

class EndVisitBottomSheet extends StatefulWidget {
  const EndVisitBottomSheet({super.key});

  @override
  State<EndVisitBottomSheet> createState() => _EndVisitBottomSheetState();
}

class _EndVisitBottomSheetState extends State<EndVisitBottomSheet> {
  @override
  Widget build(BuildContext context) {
    Responsive.init(context);
    String? selectedExpenseType;

    final List<String> expenseTypes = [
      'Travel', 'Food', 'Accommodation', 'Office Supplies', 'Entertainment',
      'Miscellaneous', 'Fuel', 'Internet', 'Medical', 'Training',
    ];

    return Padding(
      padding: EdgeInsets.only(
        left: Responsive.responsivePadding(),
        right: Responsive.responsivePadding(),
        bottom: MediaQuery.of(context).viewInsets.bottom + 16,
        top: 24,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          /// Title
          Align(
            alignment: Alignment.centerLeft,
            child: CustomText(
              'Visit Report',
              fontSize: 18 * Responsive.getResponsiveText(context),
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 20),

          /// Image
          Center(
            child: Image.asset(
              AppAssets.visitReport,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: 24),

          /// Dropdown 1
          CustomPopupDropdownStyled<String>(
            items: expenseTypes,
            hintText: 'Visit Template',
            prefix: SvgPicture.asset(
              AppAssets.message_edit,
              fit: BoxFit.scaleDown,
            ),
            hintTextStyle: TextStyle(
              fontSize: 18 * Responsive.getResponsiveText(context),
              color: AppTheme.getColor(context).primary,
              fontWeight: FontWeight.w600,
            ),
            spacing: 0.02 * Responsive.getWidth(context),
            selectedItem: selectedExpenseType,
            itemToString: (item) => item,
            onChanged: (value, index) {
              setState(() {
                selectedExpenseType = value;
              });
            },
            border: BoxBorder.all(
              color: AppTheme.getColor(context).outline,
            ),
          ),
          const SizedBox(height: 24),

          /// Dropdown 2
          CustomPopupDropdownStyled<String>(
            items: expenseTypes,
            hintText: 'Test New Visit *',
            prefix: SvgPicture.asset(
              AppAssets.message_edit,
              fit: BoxFit.scaleDown,
            ),
            hintTextStyle: TextStyle(
              fontSize: 18 * Responsive.getResponsiveText(context),
              color: AppTheme.getColor(context).primary,
              fontWeight: FontWeight.w600,
            ),
            spacing: 0.02 * Responsive.getWidth(context),
            selectedItem: selectedExpenseType,
            itemToString: (item) => item,
            onChanged: (value, index) {
              setState(() {
                selectedExpenseType = value;
              });
            },
            border: BoxBorder.all(
              color: AppTheme.getColor(context).outline,
            ),
          ),
          const SizedBox(height: 24),

          /// Button Row
          Row(
            children: [
              Expanded(
                child: MyCoButton(
                  onTap: () => Navigator.pop(context),
                  title: 'CLOSE',
                  textStyle: TextStyle(
                    color: AppColors.primary,
                    fontSize: 14 * Responsive.getResponsiveText(context),
                    fontWeight: FontWeight.bold,
                  ),
                  backgroundColor: Colors.transparent,
                  boarderRadius: 30,
                  borderColor: AppColors.primary,
                ),
              ),
              SizedBox(width: 0.04 * Responsive.getWidth(context)),
              Expanded(
                child: MyCoButton(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  title: 'CONTINUE',
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 14 * Responsive.getResponsiveText(context),
                    fontWeight: FontWeight.bold,
                  ),
                  backgroundColor: AppColors.primary,
                  boarderRadius: 30,
                  wantBorder: false,
                  isShadowBottomLeft: true,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

}
