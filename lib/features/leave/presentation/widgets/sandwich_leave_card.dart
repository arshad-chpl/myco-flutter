import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/widgets/common_card.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

class SandwichLeaveEntry {
  final String date;
  final String subType;
  final String reason;
  final String status;
  final bool isSalaryGenerated;
  SandwichLeaveEntry({
    required this.date,
    required this.subType,
    required this.reason,
    required this.status,
    required this.isSalaryGenerated,
  });
}

class SandwichLeaveCard extends StatelessWidget {
  final SandwichLeaveEntry leave;

  const SandwichLeaveCard({required this.leave, super.key});

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.getResponsive(context);
    final textResponsive = Responsive.getResponsiveText(context);

    return Container(
      margin: EdgeInsets.symmetric(vertical: 8 * responsive),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(10 * responsive),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonCard(
            showHeaderPrefixIcon: true,
            suffixIcon: leave.isSalaryGenerated
                ? Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: () =>
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Still Work Left As no UI'),
                        ),
                      ),
                  icon: Icon(
                    Icons.edit_outlined,
                    size: 0.022 * Responsive.getHeight(context),
                    color: AppColors.white,
                  ),
                ),
              ],
            )
                : null,
            title: leave.date,
            headerColor: AppColors.secondary,
            bottomWidget: Padding(
              padding: EdgeInsets.all(10 * responsive),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildBadge(leave.subType, Colors.blue),
                    ],
                  ),
                  const SizedBox(height: 4),
                  // Reason
                  CustomText(
                    leave.reason,
                    fontSize: 14 * textResponsive,
                    color: Colors.black,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 2),
                  // Approved by
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: '${leave.status} ',
                          style: TextStyle(
                            color: AppColors.secondary,
                            fontSize: 13 * textResponsive,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Pay Status & View Details
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBadge(String label, Color color) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
    decoration: BoxDecoration(
      color: color.withValues(alpha: 0.1),
      border: Border.all(color: color),
      borderRadius: BorderRadius.circular(6),
    ),
    child: CustomText(label, color: color, fontSize: 12),
  );
}
