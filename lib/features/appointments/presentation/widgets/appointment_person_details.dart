import 'package:flutter/material.dart';
import 'package:myco_flutter/constants/app_assets.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

class AppointmentPersonDetails extends StatefulWidget {
  final String imagePath;
  final String empName;
  final String designation;
  final String fieldWithCity;

  const AppointmentPersonDetails({
    required this.imagePath,
    required this.empName,
    required this.designation,
    required this.fieldWithCity,
    super.key,
  });

  @override
  State<AppointmentPersonDetails> createState() =>
      _AppointmentPersonDetailsState();
}

class _AppointmentPersonDetailsState extends State<AppointmentPersonDetails> {
  @override
  Widget build(BuildContext context) => ListTile(
    leading: Image.network(
      widget.imagePath,
      width: 0.12 * Responsive.getWidth(context),
      height: 0.06 * Responsive.getHeight(context),
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) => Image.asset(
        AppAssets.myCoLogo,
        width: 0.12 * Responsive.getWidth(context),
        height: 0.06 * Responsive.getHeight(context),
        fit: BoxFit.cover,
      ),
    ),
    title: CustomText(widget.empName, fontWeight: FontWeight.w600),
    subtitle: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          widget.designation,
          isKey: true,
          color: AppColors.textGray,
          fontWeight: FontWeight.w500,
        ),
        CustomText(
          widget.fieldWithCity,
          color: AppColors.textGray,
          fontWeight: FontWeight.w500,
        ),
      ],
    ),
  );
}
