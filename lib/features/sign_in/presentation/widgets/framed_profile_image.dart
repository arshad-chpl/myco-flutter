import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myco_flutter/constants/app_assets.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/responsive.dart';

class FramedProfileImage extends StatelessWidget {
  final String? imagePath;
  final double size;
  final double borderWidth;
  final Color borderColor;
  final String defaultAsset;

  const FramedProfileImage({
    super.key,
    this.imagePath,
    this.size = 120,
    this.borderWidth = 4,
    this.borderColor = const Color(0xFF2F648E),
    this.defaultAsset = AppAssets.signUpUser,
  });

  @override
  Widget build(BuildContext context) {
    final bool isNetworkImage =
        imagePath != null && imagePath!.startsWith('http');

    final bool hasImage = imagePath != null && imagePath!.isNotEmpty;

    Widget imageWidget;

    if (hasImage && isNetworkImage) {
      imageWidget = Image.network(
        imagePath!,
        width: size - borderWidth * 2,
        height: size - borderWidth * 2,
        fit: BoxFit.cover,
      );
    } else if (hasImage) {
      imageWidget = Image.file(
        File(imagePath!),
        width: size - borderWidth * 2,
        height: size - borderWidth * 2,
        fit: BoxFit.cover,
      );
    } else {
      imageWidget = Padding(
        padding: EdgeInsets.all(10 * Responsive.getResponsive(context)),
        child: SvgPicture.asset(
          defaultAsset,
          width: size - borderWidth * 2,
          height: size - borderWidth * 2,
          fit: BoxFit.cover,
        ),
      );
    }

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: AppTheme.getColor(context).primary,

        border: Border.all(color: borderColor, width: borderWidth),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.07),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: imageWidget,
      ),
    );
  }
}
