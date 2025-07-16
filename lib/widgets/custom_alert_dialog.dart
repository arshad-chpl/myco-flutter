import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';

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
    super.key,
    required this.alertType,
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

  Widget _getAlertAnimation(AlertType type, BuildContext context) {
    final size = 200 * Responsive.getResponsive(context);

    switch (type) {
      case AlertType.error:
        return Lottie.asset(
          'assets/animations/error_alert.json',
          width: size,
          height: size,
        );
      case AlertType.success:
        return Lottie.asset(
          'assets/animations/success_alert.json',
          width: size,
          height: size,
        );
      case AlertType.warning:
      case AlertType.alert:
        return Lottie.asset(
          'assets/animations/warning_alert.json',
          width: size,
          height: size,
        );
      case AlertType.delete:
        return Lottie.asset(
          'assets/animations/delete_alert.json',
          width: size,
          height: size,
        );
      case AlertType.logout:
        return Lottie.asset(
          'assets/animations/logout_alert.json',
          width: size,
          height: size,
        );
      case AlertType.gpsOff:
        return Lottie.asset(
          'assets/animations/gps_alert.json',
          width: size,
          height: size,
        );
      case AlertType.onlinePaymentRestrict:
        return Image.asset(
          'assets/icons/ic_ui_online_payment_restrict.png',
          width: size,
          height: size,
        );
      case AlertType.defaultType:
        return Lottie.asset(
          'assets/animations/info_alert.json',
          width: size,
          height: size,
        );
      case AlertType.custom:
        if (icon == null) return const SizedBox.shrink();
        if (icon!.endsWith('.svg')) {
          return SvgPicture.asset(
            icon!,
            width: size,
            height: size,
          );
        } else if (icon!.startsWith('http')) {
          return Image.network(
            icon!,
            width: size,
            height: size,
          );
        } else {
          return Image.asset(
            icon!,
            width: size,
            height: size,
          );
        }
    }
  }

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

          _getAlertAnimation(alertType, context),

          if (_isNotEmpty(title)) ...[
            const SizedBox(height: 20),
            Text(
              title!,
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
          ],

          if (_isNotEmpty(content)) ...[
            const SizedBox(height: 8),
            Text(
              content!,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
          ],

          const SizedBox(height: 20),

          if ((!hideCancelButton && _isNotEmpty(cancelText)) ||
              (!hideConfirmButton && _isNotEmpty(confirmText)))
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (!hideCancelButton && _isNotEmpty(cancelText))
                  Expanded(
                    child: MyCoButton(
                      isShadowBottomLeft: true,
                      height: .05 * Responsive.getHeight(context),
                      boarderRadius: 50 * Responsive.getResponsive(context),
                      onTap: onCancel ?? () => Navigator.of(context).pop(),
                      title: cancelText!,
                      textStyle: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: textColor,
                      ),
                    ),
                  ),
                if (!hideCancelButton &&
                    _isNotEmpty(cancelText) &&
                    !hideConfirmButton &&
                    _isNotEmpty(confirmText))
                  const SizedBox(width: 8),
                if (!hideConfirmButton && _isNotEmpty(confirmText))
                  Expanded(
                    child: MyCoButton(
                      isShadowBottomLeft: true,
                      height: .05 * Responsive.getHeight(context),
                      boarderRadius: 50 * Responsive.getResponsive(context),
                      onTap: onConfirm ?? () => Navigator.of(context).pop(),
                      title: confirmText!,
                      textStyle: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: textColor,
                      ),
                    ),
                  ),
              ],
            ),

          if (showNeutralButton && _isNotEmpty(neutralText)) ...[
            const SizedBox(height: 8),
            MyCoButton(
              isShadowBottomLeft: true,
              height: .05 * Responsive.getHeight(context),
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
