import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button_theme.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

/// Enum representing different alert types supported by [CustomAlertDialog]
enum AlertType {
  defaultType,
  error,
  success,
  warning,
  delete,
  alert,
  logout,
  gpsOff,
  onlinePaymentRestrict,
  custom,
}

///
/// A reusable custom alert dialog widget with animation/icon,
/// text content, and action buttons (confirm, cancel, neutral).
///
/// To use this dialog:
/// ```dart
/// showModalBottomSheet(
///   context: context,
///   isScrollControlled: true,
///   shape: RoundedRectangleBorder(
///     borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
///   ),
///   builder: (_) => CustomAlertDialog(
///     alertType: AlertType.success,
///     title: "Success",
///     content: "Your operation was completed.",
///     confirmText: "OK",
///     onConfirm: () {},
///   ),
/// );
/// ```
class CustomAlertDialog extends StatelessWidget {
  final AlertType alertType;
  final String? title;
  final String? content;
  final String? icon;
  final String? confirmText;
  final String? cancelText;
  final String? neutralText;
  final VoidCallback? onConfirm;
  final VoidCallback? onCancel;
  final VoidCallback? onNeutral;
  final bool hideConfirmButton;
  final bool hideCancelButton;
  final bool showNeutralButton;

  const CustomAlertDialog({
    required this.alertType, super.key,
    this.title,
    this.content,
    this.icon,
    this.confirmText,
    this.cancelText,
    this.neutralText,
    this.onConfirm,
    this.onCancel,
    this.onNeutral,
    this.hideConfirmButton = false,
    this.hideCancelButton = false,
    this.showNeutralButton = false,
  });

  /// Returns the appropriate animation or icon based on the [AlertType]
  Widget _getAlertAnimation(AlertType type, BuildContext context) {
    final size = 200 * Responsive.getResponsive(context);

    switch (type) {
      case AlertType.error:
        return Lottie.asset('assets/animations/error_alert.json', width: size, height: size);
      case AlertType.success:
        return Lottie.asset('assets/animations/success_alert.json', width: size, height: size);
      case AlertType.warning:
      case AlertType.alert:
        return Lottie.asset('assets/animations/warning_alert.json', width: size, height: size);
      case AlertType.delete:
        return Lottie.asset('assets/animations/delete_alert.json', width: size, height: size);
      case AlertType.logout:
        return Lottie.asset('assets/animations/logout_alert.json', width: size, height: size);
      case AlertType.gpsOff:
        return Lottie.asset('assets/animations/gps_alert.json', width: size, height: size);
      case AlertType.onlinePaymentRestrict:
        return Image.asset('assets/icons/ic_ui_online_payment_restrict.png', width: size, height: size);
      case AlertType.defaultType:
        return Lottie.asset('assets/animations/info_alert.json', width: size, height: size);
      case AlertType.custom:
        if (icon == null) return const SizedBox.shrink();
        if (icon!.endsWith('.svg')) {
          return SvgPicture.asset(icon!, width: size, height: size);
        } else if (icon!.startsWith('http')) {
          return Image.network(icon!, width: size, height: size);
        } else {
          return Image.asset(icon!, width: size, height: size);
        }
    }
  }

  /// Helper to check if a string is not null or empty
  bool _isNotEmpty(String? value) => value != null && value.trim().isNotEmpty;

  @override
  Widget build(BuildContext context) {
    final Color surfaceColor = AppTheme.getColor(context).surface;
    final Color textColor = AppTheme.getColor(context).onSurface;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: surfaceColor,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 20),

          // Animation or icon based on alert type
          _getAlertAnimation(alertType, context),

          // Optional title
          if (_isNotEmpty(title)) ...[
            const SizedBox(height: 20),
            CustomText(title!, color: textColor, textAlign: TextAlign.center),
          ],

          // Optional content text
          if (_isNotEmpty(content)) ...[
            const SizedBox(height: 20),
            CustomText(
              content!,
              color: AppTheme.getColor(context).onSurfaceVariant,
              textAlign: TextAlign.center,
            ),
          ],

          const SizedBox(height: 20),

          // Confirm and Cancel buttons
          // Single or double button layout
          if ((!hideCancelButton && _isNotEmpty(cancelText)) &&
              (!hideConfirmButton && _isNotEmpty(confirmText))) ...[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: MyCoButton(
                    title: cancelText!,
                    height: Responsive.getHeight(context) * .05,
                    boarderRadius: 30 * Responsive.getResponsive(context),
                    width: Responsive.getWidth(context) * .450,
                    backgroundColor: AppColors.white,
                    border: Border.all(
                      color: AppTheme.getColor(context).primary,
                    ),
                    textStyle: MyCoButtonTheme.getWhiteBackgroundTextStyle(context),
                    onTap: onCancel ?? () => Navigator.of(context).pop(),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: MyCoButton(
                    title: confirmText!,
                    height: Responsive.getHeight(context) * .05,
                    isShadowBottomLeft: true,
                    boarderRadius: 30,
                    width: Responsive.getWidth(context) * .450,
                    onTap: onConfirm ?? () => Navigator.of(context).pop(),
                  ),
                ),
              ],
            )
          ] else if (!hideCancelButton && _isNotEmpty(cancelText)) ...[
            MyCoButton(
              title: cancelText!,
              height: Responsive.getHeight(context) * .05,
              boarderRadius: 30 * Responsive.getResponsive(context),
              width: double.infinity,
              backgroundColor: AppColors.white,
              border: Border.all(
                color: AppTheme.getColor(context).primary,
              ),
              textStyle: MyCoButtonTheme.getWhiteBackgroundTextStyle(context),
              onTap: onCancel ?? () => Navigator.of(context).pop(),
            ),
          ] else if (!hideConfirmButton && _isNotEmpty(confirmText)) ...[
            MyCoButton(
              title: confirmText!,
              height: Responsive.getHeight(context) * .05,
              isShadowBottomLeft: true,
              boarderRadius: 30,
              width: double.infinity,
              onTap: onConfirm ?? () => Navigator.of(context).pop(),
            ),
          ],

          // Neutral button (optional third action)
          if (showNeutralButton && _isNotEmpty(neutralText)) ...[
            const SizedBox(height: 20),
            MyCoButton(
              isShadowBottomLeft: true,
              height: Responsive.getHeight(context) * .05,
              boarderRadius: 50 * Responsive.getResponsive(context),
              onTap: onNeutral ?? () => Navigator.of(context).pop(),
              title: neutralText!,
              textStyle: TextStyle(
                fontWeight: FontWeight.w600,
                color: textColor,
              ),
            ),
          ],

          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
