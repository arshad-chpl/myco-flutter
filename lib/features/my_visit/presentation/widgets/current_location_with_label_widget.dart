import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/widgets/border_container_wraper.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

class CurrentLocationWithLabelWidget extends StatefulWidget {
  final String address;
  const CurrentLocationWithLabelWidget({required this.address, super.key});

  @override
  State<CurrentLocationWithLabelWidget> createState() => _CurrentLocationWithLabelWidgetState();
}

class _CurrentLocationWithLabelWidgetState extends State<CurrentLocationWithLabelWidget> {
  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
            'current location',
            color: AppColors.textGray,
            fontSize: 16 * Responsive.getResponsiveText(context),
            fontWeight: FontWeight.bold
        ),
        const SizedBox(height: 5,),
        BorderContainerWraper(
          borderColor: AppColors.borderColor,
          width: double.infinity,
          backgroundColor: AppColors.removeBackground,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: 5 * Responsive.getResponsive(context),
                ),
                child: Image(
                  image: const AssetImage(
                    'assets/face_detection/location_icon.png',
                  ),
                  height: 0.060 * Responsive.getHeight(context),
                  width: 0.060 * Responsive.getWidth(context),
                  color: const Color.fromARGB(255, 34, 42, 110),
                ),
              ),
              const SizedBox(width: 10),
              CustomText(
                widget.address,
                color: const Color.fromARGB(255, 34, 42, 110),
                fontWeight: FontWeight.w600,
                fontSize: 15 * Responsive.getResponsiveText(context),
              ),
              const SizedBox(width: 19),
              const Image(
                image: AssetImage(
                  'assets/face_detection/location_preview.png',
                ),
                height: 72,
                width: 72,
              ),
            ],
          ),
        ),
      ],
    );
}
