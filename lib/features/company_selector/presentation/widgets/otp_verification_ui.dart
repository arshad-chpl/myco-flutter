import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myco_flutter/core/router/route_paths.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/sign_in/presentation/widgets/customotp_bottomsheet.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

class OtpVerificationUi extends StatelessWidget {
  final String contactValue; // Email or phone
  final bool isEmail;
  final int length;
  final void Function(String otp) onSubmit;
  final VoidCallback previousStep;
  final VoidCallback onResend;
  final VoidCallback onEmailOtp;
  final VoidCallback onCallOtp;

  const OtpVerificationUi({
    super.key,
    required this.contactValue,
    required this.onSubmit,
    required this.previousStep,
    required this.onResend,
    required this.onEmailOtp,
    required this.onCallOtp,
    this.isEmail = true,
    this.length = 6,
  });

  @override
  Widget build(BuildContext context) {
    String title = isEmail ? 'Sign In Email' : 'Sign In Phone Number';
    String message = isEmail
        ? 'Sign in code has been sent to $contactValue, check your inbox to continue.'
        : 'Sign in code has been sent to $contactValue, check your messages to continue.';

    String imagePath = isEmail
        ? 'assets/sign_in/email.png'
        : 'assets/sign_in/phone.png';

    String currentOtp = '';

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 24 * Responsive.getResponsive(context),
        vertical: 36,
      ),
      height: 0.7 * Responsive.getHeight(context),
      width: Responsive.getWidth(context),
      decoration: BoxDecoration(
        color: AppTheme.getColor(context).onPrimary,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(40 * Responsive.getResponsive(context)),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 30 * Responsive.getResponsiveText(context)),
          Center(
            child: Column(
              children: [
                MyCoButton(
                  onTap: () {},
                  title: '',
                  height: 0.088 * Responsive.getHeight(context),
                  width: 0.21 * Responsive.getWidth(context),
                  isShadowBottomLeft: true,
                  image: imagePath != null
                      ? Image.asset(
                          imagePath,
                          height: 0.035 * Responsive.getHeight(context),
                          width: 0.035 * Responsive.getHeight(context),
                        )
                      : Image.asset(
                          'assets/images/chpl_logo.png',
                          height: 0.035 * Responsive.getHeight(context),
                          width: 0.035 * Responsive.getHeight(context),
                        ),
                ),
                const SizedBox(height: 20),
                CustomText(
                  title,
                  fontSize: 24 * Responsive.getResponsiveText(context),
                  fontWeight: FontWeight.w900,
                  color: AppTheme.getColor(context).onSurface,
                ),
                const SizedBox(height: 8),
                CustomText(
                  message,
                  textAlign: TextAlign.center,
                  fontSize: 16 * Responsive.getResponsiveText(context),
                  color: AppTheme.getColor(context).onSurfaceVariant,
                ),
              ],
            ),
          ),
          SizedBox(height: 30 * Responsive.getResponsiveText(context)),
          OTPInputField(
            length: length,
            onCompleted: (_) {},
            onChanged: (code) {
              currentOtp = code;
            },
          ),
          SizedBox(height: 30 * Responsive.getResponsiveText(context)),
          Row(
            children: [
              CustomText(
                "Haven't received the code? ",
                fontSize: 20 * Responsive.getResponsiveText(context),
                color: AppTheme.getColor(context).onSurface,
              ),

              InkWell(
                onTap: () {},
                child: CustomText(
                  'Resend it.',
                  fontSize: 20 * Responsive.getResponsiveText(context),
                  color: AppTheme.getColor(context).primary,
                ),
              ),
            ],
          ),
          SizedBox(height: 30 * Responsive.getResponsiveText(context)),
          Center(
            child: RichText(
              text: TextSpan(
                style: TextStyle(
                  fontSize: 16,
                  color: AppTheme.getColor(context).onSurface,
                ),
                children: [
                  TextSpan(
                    text: 'Email for OTP',
                    style: TextStyle(
                      color: AppTheme.getColor(context).primary,
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.w600,
                    ),
                    recognizer: TapGestureRecognizer()..onTap = onEmailOtp,
                  ),
                  const TextSpan(text: ' or '),
                  TextSpan(
                    text: 'Call for OTP',
                    style: TextStyle(
                      color: AppTheme.getColor(context).primary,
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.w600,
                    ),
                    recognizer: TapGestureRecognizer()..onTap = onCallOtp,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 30 * Responsive.getResponsiveText(context)),
          MyCoButton(
            height: .05 * Responsive.getHeight(context),
            onTap: currentOtp.length == length
                ? () {
                    Navigator.pop(context);
                    context.go(RoutePaths.dashboard);
                  }
                : null,
            title: 'Submit',
            boarderRadius: 50 * Responsive.getResponsive(context),
            isShadowBottomLeft: true,
          ),
          SizedBox(height: 30 * Responsive.getResponsiveText(context)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText(
                'Sign in with different method ',
                fontSize: 20 * Responsive.getResponsiveText(context),
                color: AppTheme.getColor(context).onSurface,
              ),

              InkWell(
                onTap: previousStep,
                child: CustomText(
                  'Here.',
                  fontSize: 20 * Responsive.getResponsiveText(context),
                  color: AppTheme.getColor(context).primary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
