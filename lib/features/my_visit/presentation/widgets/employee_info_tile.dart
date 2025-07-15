import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

class EmployeeInfoTile extends StatelessWidget {
  final String imagePath;
  final String name;
  final String role;

  const EmployeeInfoTile({
    super.key,
    required this.imagePath,
    required this.name,
    required this.role,
  });

  @override
  Widget build(BuildContext context) => Padding(
      padding: EdgeInsets.symmetric(horizontal: Responsive.getWidth(context) * 0.02),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: Image.asset(
          imagePath,
          width: 80 * Responsive.getResponsiveText(context),
          height: 80 * Responsive.getResponsiveText(context),
          fit: BoxFit.contain,
        ),
        title: CustomText(
          name,
          color: AppColors.primary,
          fontWeight: FontWeight.bold,
          fontSize: 14 * Responsive.getResponsiveText(context),
        ),
        subtitle: CustomText(
          role,
          color: AppColors.textfieldBorder,
          fontSize: 12 * Responsive.getResponsiveText(context),
          fontWeight: FontWeight.w400,
        ),
      ),
    );
}
