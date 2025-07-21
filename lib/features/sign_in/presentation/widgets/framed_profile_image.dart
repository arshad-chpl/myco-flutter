import 'dart:io';

import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';

class FramedProfileImage extends StatelessWidget {
  final File? selectedImage;
  final double size;
  final double borderWidth;
  final Color borderColor;
  final String defaultAsset;

  const FramedProfileImage({
    super.key,
    this.selectedImage,
    this.size = 120,
    this.borderWidth = 4,
    this.borderColor = const Color(0xFF2F648E), // Use your brand color
    this.defaultAsset = 'assets/sign_in/contact_frame.png',
  });

  @override
  Widget build(BuildContext context) => selectedImage != null
      ? Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            color: AppTheme.getColor(context).surface,
            // Optional background color
            border: Border.all(color: borderColor, width: borderWidth),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.07),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.file(
              selectedImage!,
              width: size - borderWidth * 2,
              height: size - borderWidth * 2,
              fit: BoxFit.cover,
            ),
          ),
        )
      : Image.asset(
          defaultAsset,
          width: size - borderWidth * 2,
          height: size - borderWidth * 2,
          fit: BoxFit.cover,
        );
}
