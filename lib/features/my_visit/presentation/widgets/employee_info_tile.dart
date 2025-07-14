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
  Widget build(BuildContext context) {
    final double multiplier = Responsive.getResponsiveText(context);
    final double screenWidth = Responsive.getWidth(context);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: Image.asset(
          imagePath,
          width: 80 * multiplier,
          height: 80 * multiplier,
          fit: BoxFit.contain,
        ),
        title: CustomText(
          name,
          color: AppColors.primary,
          fontWeight: FontWeight.bold,
          fontSize: 14 * multiplier,
        ),
        subtitle: CustomText(
          role,
          color: AppColors.textfieldBorder,
          fontSize: 12 * multiplier,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
