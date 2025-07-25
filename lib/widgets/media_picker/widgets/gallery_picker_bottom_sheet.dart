import 'dart:io';
import 'package:flutter/material.dart';
import 'package:myco_flutter/constants/constants.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_text.dart';
import 'package:path/path.dart' as path;

class GalleryPickerBottomSheet {
  static Future<void> showInvalidFilesBottomSheet(
    BuildContext context,
    List<Map<String, dynamic>> invalidFiles,
    VoidCallback onProceedWithValid,
  ) async {
    if (invalidFiles.isEmpty) return;

    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      isDismissible: true,
      enableDrag: false,
      builder: (context) => AnimatedPadding(
        padding: MediaQuery.of(context).viewInsets,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
        child: Container(
          decoration: BoxDecoration(
            color: AppTheme.getColor(context).surface,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(
                VariableBag.bottomSheetBorderRadius *
                    Responsive.getResponsive(context),
              ),
            ),
          ),
          height: Responsive.isTablet(context)
              ? MediaQuery.of(context).size.height * 0.70
              : MediaQuery.of(context).size.height *
                    0.45, // 45% of screen height
          child: Padding(
            padding: EdgeInsets.only(
              top:
                  VariableBag.bottomSheetTopPadding *
                  Responsive.getResponsive(context),
              bottom:
                  VariableBag.bottomSheetBottomPadding *
                  Responsive.getResponsive(context),
              left:
                  VariableBag.bottomSheetLeftPadding *
                  Responsive.getResponsive(context),
              right:
                  VariableBag.bottomSheetRightPadding *
                  Responsive.getResponsive(context),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  'File(s) Restriction',
                  fontSize: 18 * Responsive.getResponsiveText(context),
                  fontWeight: FontWeight.w700,
                  color: AppTheme.getColor(context).primary,
                ),
                SizedBox(height: 0.015 * Responsive.getHeight(context)),
                CustomText(
                  'Some files were discarded because they are either WebP format or larger than 5MB.',
                  fontSize: 14 * Responsive.getResponsiveText(context),
                  fontWeight: FontWeight.w500,
                  color: AppTheme.getColor(context).error,
                ),
                SizedBox(height: 0.020 * Responsive.getHeight(context)),
                Expanded(
                  child: SingleChildScrollView(
                    child: Wrap(
                      spacing: 12,
                      runSpacing: 12,
                      children: invalidFiles.map((item) {
                        final File file = item['file'];
                        final String reason = item['reason'];
                        return Container(
                          padding: EdgeInsets.all(
                            6 * Responsive.getResponsive(context),
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: AppTheme.getColor(context).outline,
                            ),
                            borderRadius: BorderRadius.circular(
                              12 * Responsive.getResponsive(context),
                            ),
                          ),
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.file(
                                  file,
                                  width: 0.2 * Responsive.getWidth(context),
                                  height: Responsive.isTablet(context)
                                      ? 0.200 * Responsive.getHeight(context)
                                      : 0.088 * Responsive.getHeight(context),
                                  fit: BoxFit.cover,
                                  errorBuilder: (_, __, ___) =>
                                      const Icon(Icons.broken_image, size: 40),
                                ),
                              ),
                              SizedBox(
                                height: 0.006 * Responsive.getHeight(context),
                              ),
                              CustomText(
                                reason == 'format'
                                    ? 'due to .webp'
                                    : 'due to size',
                                fontSize:
                                    12 * Responsive.getResponsiveText(context),
                                fontWeight: FontWeight.w500,
                                color: Colors.red,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                SizedBox(height: 0.020 * Responsive.getHeight(context)),
                MyCoButton(
                  height: Responsive.isTablet(context)
                      ? 0.045 * 2 * Responsive.getHeight(context)
                      : 0.045 * Responsive.getHeight(context),
                  onTap: () {
                    Navigator.pop(context);
                    onProceedWithValid();
                  },
                  title: 'Close',
                  boarderRadius: 20 * Responsive.getResponsive(context),
                  isShadowBottomLeft: true,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
