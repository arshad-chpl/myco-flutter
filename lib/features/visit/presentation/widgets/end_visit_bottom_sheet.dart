import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
    final multiplier = getResponsiveText(context);
    final screenWidth = Responsive.screenWidth();
    final screenHeight = Responsive.screenHeight();

    String? selectedExpenseType;

    final List<String> expenseTypes = [ 'Travel', 'Food', 'Accommodation', 'Office Supplies', 'Entertainment', 'Miscellaneous', 'Fuel', 'Internet', 'Medical', 'Training', ];

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
              fontSize: 18 * multiplier,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 20),

          /// Image
          Center(
            child: Image.asset(
              'assets/visit/svgs/visit_report.png',
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: 24),

          CustomPopupDropdownStyled<String>(
            items: expenseTypes,
            hintText: 'Visit Template',
            prefix: SvgPicture.asset(
              'assets/visit/svgs/message_edit.svg',
              fit: BoxFit.scaleDown,
            ),
            hintTextStyle: TextStyle(
              fontSize: 18 * getResponsiveText(context),
              color: AppTheme.getColor(context).primary,
              fontWeight: FontWeight.w600,
            ),
            spacing: 0.02 * getWidth(context),
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

          CustomPopupDropdownStyled<String>(
            items: expenseTypes,
            hintText: 'Test New Visit *',
            prefix: SvgPicture.asset(
              'assets/visit/svgs/message_edit.svg',
              fit: BoxFit.scaleDown,
            ),
            hintTextStyle: TextStyle(
              fontSize: 18 * getResponsiveText(context),
              color: AppTheme.getColor(context).primary,
              fontWeight: FontWeight.w600,
            ),
            spacing: 0.02 * getWidth(context),
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
          // Button Row
          Row(
            children: [
              Expanded(
                child: MyCoButton(
                  onTap: () => Navigator.pop(context),
                  title: 'CLOSE',
                  textStyle: TextStyle(
                    color: AppColors.primary,
                    fontSize: 14 * multiplier,
                    fontWeight: FontWeight.bold,
                  ),
                  backgroundColor: Colors.transparent,
                  boarderRadius: 30,
                  borderColor: AppColors.primary,
                ),
              ),
              SizedBox(width: screenWidth * 0.04),
              Expanded(
                child: MyCoButton(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  title: 'CONTINUE',
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 14 * multiplier,
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
