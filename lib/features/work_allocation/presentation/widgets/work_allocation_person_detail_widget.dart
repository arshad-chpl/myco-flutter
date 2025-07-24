import 'package:flutter/material.dart';
import 'package:myco_flutter/constants/constants.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

class WorkAllocationPersonDetailWidget extends StatefulWidget {
  final String imagePath;
  final String empName;
  final String designation;
  final String fieldWithCity;

  const WorkAllocationPersonDetailWidget({
    required this.imagePath,
    required this.empName,
    required this.designation,
    required this.fieldWithCity,
    super.key,
  });

  @override
  State<WorkAllocationPersonDetailWidget> createState() =>
      _WorkAllocationPersonDetailWidgetState();
}

class _WorkAllocationPersonDetailWidgetState
    extends State<WorkAllocationPersonDetailWidget> {
  @override
  Widget build(BuildContext context) => Row(
    spacing:
        VariableBag.commonCardHorizontalPadding *
        Responsive.getResponsive(context),
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      ClipRRect(
        borderRadius: BorderRadius.circular(
          35 * Responsive.getResponsive(context),
        ),
        child: Image.network(
          widget.imagePath,
          width: 50,
          height: 50,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) => Container(
            width: 60,
            height: 60,
            color: Colors.grey.shade300,
            child: Icon(
              Icons.person,
              color: AppTheme.getColor(context).onPrimary,
            ),
          ),
        ),
      ),

      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              widget.empName,
              fontWeight: FontWeight.w600,
              fontSize: 12 * Responsive.getResponsiveText(context),
              color: AppTheme.getColor(context).onSurfaceVariant,
            ),
            const SizedBox(height: 4),
            CustomText(
              widget.designation,
              isKey: true,
              color: AppColors.textGray,
              fontWeight: FontWeight.w600,
              fontSize: 10 * Responsive.getResponsiveText(context),
            ),
            CustomText(
              widget.fieldWithCity,
              color: AppColors.textGray,
              fontWeight: FontWeight.w600,
              fontSize: 10 * Responsive.getResponsiveText(context),
            ),
          ],
        ),
      ),
    ],
  );
}
