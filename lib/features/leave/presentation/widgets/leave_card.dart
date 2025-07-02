import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/widgets/common_card.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

class LeaveEntry {
  final String date;
  final String leaveType;
  final String subType;
  final String leaveTime;
  final String reason;
  final String approvedBy;
  final String status;
  final String payStatus;

  LeaveEntry({
    required this.date,
    required this.leaveType,
    required this.subType,
    required this.leaveTime,
    required this.reason,
    required this.approvedBy,
    required this.status,
    required this.payStatus,
  });
}

class LeaveCard extends StatelessWidget {
  final LeaveEntry leave;

  const LeaveCard({required this.leave, super.key});

  @override
  Widget build(BuildContext context) {
    final responsive = getResponsive(context);
    final textResponsive = getResponsiveText(context);

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
            suffixIcon: leave.status == 'Pending'
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
                          size: 0.022 * getHeight(context),
                          color: AppColors.white,
                        ),
                      ),

                      IconButton(
                        onPressed: () =>
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Still Work Left As no UI'),
                              ),
                            ),
                        icon: Icon(
                          Icons.delete_outline,
                          size: 0.022 * getHeight(context),
                          color: AppColors.white,
                        ),
                      ),
                    ],
                  )
                : null,
            title: leave.date,
            headerColor: leave.status == 'Pending'
                ? AppColors.spanishYellow
                : AppColors.primary,
            bottomWidget: Padding(
              padding: EdgeInsets.all(10 * responsive),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Leave type and time
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildBadge(leave.subType, Colors.blue),
                      CustomText(
                        leave.leaveTime,
                        fontSize: 12 * textResponsive,
                        color: Colors.grey.shade600,
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  // Reason
                  CustomText(
                    'Leave Reason : ${leave.reason}',
                    fontSize: 12 * textResponsive,
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
                          text: 'Approved By :',
                          style: TextStyle(
                            color: AppColors.primary,
                            fontSize: 13 * textResponsive,
                          ),
                        ),
                        TextSpan(
                          text: leave.approvedBy,
                          style: TextStyle(
                            color: AppColors.black,
                            fontSize: 13 * textResponsive,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 6),
                  // Pay Status & View Details
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            leave.leaveType,
                            fontSize: 13 * textResponsive,
                            fontWeight: FontWeight.w600,
                          ),
                          CustomText(
                            leave.payStatus,
                            fontSize: 12 * textResponsive,
                            color: Colors.grey.shade700,
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          CustomText(
                            leave.status,
                            fontSize: 12 * textResponsive,
                            color: leave.status.toLowerCase() == 'approved'
                                ? Colors.green
                                : Colors.orange,
                          ),
                          const SizedBox(height: 4),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primary,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 6,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6),
                              ),
                            ),
                            child: CustomText(
                              'View Details',
                              fontSize: 12 * textResponsive,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
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
