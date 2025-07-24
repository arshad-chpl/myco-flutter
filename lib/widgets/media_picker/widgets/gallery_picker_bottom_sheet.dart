import 'dart:io';
import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_text.dart';
import 'package:path/path.dart' as path;

class GalleryPickerBottomSheet {
  static Future<void> showInvalidFilesBottomSheet(
    // Changed return type to Future<void>
    BuildContext context,
    List<Map<String, dynamic>> invalidFiles,
    VoidCallback onProceedWithValid,
  ) async {
    // Added async
    if (invalidFiles.isEmpty) return;

    await showModalBottomSheet(
      // Await the result of showModalBottomSheet
      context: context,
      isScrollControlled: true,
      // Allows the bottom sheet to take full height
      backgroundColor: Colors.transparent,
      isDismissible: false,
      // Prevents closing by tapping outside
      enableDrag: false,
      // Prevents closing by dragging down
      builder: (context) => AnimatedPadding(
        padding: MediaQuery.of(context).viewInsets,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          // Use a SizedBox with a fixed height or a calculated height
          // For a fixed height, let's say 400 pixels
          height:
              MediaQuery.of(context).size.height *
              0.7, // Example: 70% of screen height

          // OR, if you want a specific fixed height:
          // height: 450, // Example fixed height
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  'File(s) Restriction',
                  fontSize: 18 * Responsive.getResponsiveText(context),
                  fontWeight: FontWeight.w700,
                  color: AppTheme.getColor(context).primary,
                ),
                const SizedBox(height: 15),
                CustomText(
                  'Some files were discarded because they are either WebP format or larger than 5MB.',
                  fontSize: 14 * Responsive.getResponsiveText(context),
                  fontWeight: FontWeight.w500,
                  color: AppTheme.getColor(context).error,
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: SingleChildScrollView(
                    // Removed DraggableScrollableSheet as we are using a fixed height
                    // and want to prevent dragging outside.
                    child: Wrap(
                      spacing: 12,
                      runSpacing: 12,
                      children: invalidFiles.map((item) {
                        final File file = item['file'];
                        final String reason = item['reason'];
                        return Container(
                          width: 100,
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: AppTheme.getColor(context).outline,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.file(
                                  file,
                                  width: 88,
                                  height: 88,
                                  fit: BoxFit.cover,
                                  errorBuilder: (_, __, ___) =>
                                      const Icon(Icons.broken_image, size: 40),
                                ),
                              ),
                              const SizedBox(height: 6),
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
                const SizedBox(height: 20),
                SizedBox(
                  height: 45,
                  width: double.infinity,
                  child: MyCoButton(
                    onTap: () {
                      Navigator.pop(context); // This will pop the bottom sheet
                      onProceedWithValid();
                    },
                    title: 'Close',
                    boarderRadius: 20,
                    isShadowBottomLeft: true,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
