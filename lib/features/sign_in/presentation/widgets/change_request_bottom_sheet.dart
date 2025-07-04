import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/widgets/big_textfield.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button_theme.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

class ChangeRequestBottomSheet extends StatelessWidget {
  ChangeRequestBottomSheet({super.key});
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) => Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 20 * Responsive.getResponsive(context),
            horizontal: 20 * Responsive.getResponsive(context),
          ),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CustomText(
                      'Change Request Reason ',
                      fontSize: 18 * Responsive.getResponsiveText(context),
                      fontWeight: FontWeight.w700,

                    ),
                    CustomText(
                      '*',
                      color: AppTheme.getColor(context).error,
                      fontSize: 20 * Responsive.getResponsiveText(context),
                    ),
                  ],
                ),
                BigMyCoTextField(
                  hintText: 'Enter your reason',
                  prefixImage: Image.asset(
                    'assets/sign_in/message_edit.png',
                    height: 0.03*Responsive.getHeight(context),
                  ),
                  maxLines: 5,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a reason';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 0.02 * Responsive.getHeight(context)),
                Row(
                  children: [
                    Expanded(
                      child: MyCoButton(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        title: 'CLOSE',
                        backgroundColor: AppTheme.getColor(context).onPrimary,
                        boarderRadius: 30 * Responsive.getResponsive(context),
                        textStyle:
                        MyCoButtonTheme.getWhiteBackgroundTextStyle(
                            context),
                      ),
                    ),
                    SizedBox(width: 0.09 * Responsive.getWidth(context)),
                    Expanded(
                      child: MyCoButton(
                        onTap: () {
                          if (formKey.currentState?.validate() ?? false) {
                            // Handle submit action here
                          }
                          context.go("/dashboard");
                        },
                        title: 'SUBMIT',
                        boarderRadius: 30 * Responsive.getResponsive(context),
                        isShadowBottomLeft: true,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
}
