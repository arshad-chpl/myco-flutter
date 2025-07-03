import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

class CustomFaceDetectionWidgets extends StatelessWidget {
  final CameraController controller;
  final String scanningState;
  final Animation<double> topLineAlignment;
  final Animation<double> bottomLineAlignment;
  final VoidCallback? retry;

  const CustomFaceDetectionWidgets({
    required this.controller, required this.scanningState, required this.topLineAlignment, required this.bottomLineAlignment, this.retry,  super.key,
  });

  Color getBorderColor(BuildContext context) {
    if(scanningState == 'success') return AppColors.spanishYellow;
    if(scanningState == 'failure') return AppTheme.getColor(context).error;
    return AppTheme.getColor(context).primary;
  }

  Widget buildOverLay() {
    if(scanningState == 'failure') {
      return GestureDetector(
        onTap: retry,
        child: const Align(
          alignment: Alignment.center,
          child: Icon(Icons.refresh, color: AppColors.white, size: 35,),
        ),
      );
    }
    return const SizedBox();
  }

  Widget labelMessage(BuildContext context) {

    if(scanningState == 'success') {
      return Container(
        width: double.infinity,
        padding: const EdgeInsets.all(8),
        color: AppColors.spanishYellow,
        child:  CustomText(
          'Face Scan',
          color: AppTheme.getColor(context).onPrimary,
          fontWeight: FontWeight.w700,
          textAlign: TextAlign.center,

        ),
      );
    } else if (scanningState == 'failure') {
      return Container(
        width: double.infinity,
        padding: const EdgeInsets.all(8),
        color: AppTheme.getColor(context).error,
        child:  CustomText(
          'Failed to match current face with your registered face',
          fontSize: 12,
          color: AppTheme.getColor(context).onPrimary,
          fontWeight: FontWeight.w700,
          textAlign: TextAlign.center,

        ),
      );
    }

    return const SizedBox();
  }

  Widget scanningLines(BuildContext context) {
    if(scanningState != 'scanning' && scanningState == 'success' && scanningState == 'failure') return const SizedBox();

    return AnimatedBuilder(
        animation: topLineAlignment,
        builder: (context, child) => Stack(
          children: [
            Positioned(
              top: topLineAlignment.value,
              left: 0,
              right: 0,
              child: Container(
                height: 3,
                margin: const EdgeInsets.symmetric(horizontal: 40),
                color: AppTheme.getColor(context).primary
              ),
            ),
            Positioned(
              top: bottomLineAlignment.value,
              left: 0,
              right: 0,
              child: Container(
                height: 3,
                margin: const EdgeInsets.symmetric(horizontal: 40),
                  color: AppTheme.getColor(context).primary
              ),
            ),
          ],
        ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 0.35 * getHeight(context),
      width: double.infinity,
      decoration: BoxDecoration(
          border: Border.all(color: getBorderColor(context), width: 4),
          borderRadius: BorderRadius.circular(27)
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(23),
        child: Stack(
          fit: StackFit.expand,
          children: [
            CameraPreview(controller),
            scanningLines(context),
          buildOverLay(),
            Align(alignment: Alignment.bottomCenter, child: labelMessage(context))
          ],
        )
      ),
    );
  }
}

