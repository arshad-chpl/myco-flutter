import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button_theme.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

class GetReasonUi extends StatelessWidget {
  const GetReasonUi({super.key});

  @override
  Widget build(BuildContext context) => Padding(
    padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
    child: Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Align(
              alignment: Alignment.centerLeft,
              child: CustomText(
                'Change Reason *',
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: AppTheme.getColor(context).onSurfaceVariant,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.all(8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: SvgPicture.asset(
                      'assets/login/ic_ui_message_edit.svg',
                      height: 20,
                      width: 20,
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Expanded(
                    child: TextField(
                      maxLines: 4,
                      minLines: 4,
                      keyboardType: TextInputType.multiline,
                      textInputAction: TextInputAction.newline,
                      decoration: InputDecoration(
                        hintText: 'Type Here',
                        alignLabelWithHint: true,
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 5,
                          horizontal: 12,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: MyCoButton(
                    title: 'Close',
                    height: Responsive.getHeight(context) * .05,
                    boarderRadius: 30 * Responsive.getResponsive(context),
                    width: Responsive.getWidth(context) * .450,
                    backgroundColor: AppColors.white,
                    border: Border.all(
                      color: AppTheme.getColor(context).primary,
                    ),
                    textStyle: MyCoButtonTheme.getWhiteBackgroundTextStyle(
                      context,
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: MyCoButton(
                    title: 'Submit',
                    height: Responsive.getHeight(context) * .05,
                    isShadowBottomLeft: true,
                    boarderRadius: 30,
                    width: Responsive.getWidth(context) * .450,
                    onTap: () {},
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
