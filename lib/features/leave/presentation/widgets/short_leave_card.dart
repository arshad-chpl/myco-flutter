import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/leave/domain/intities/leave_history_response_entity.dart';
import 'package:myco_flutter/widgets/common_card.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

class ShortLeaveEntry {
  final String date;
  final String subType;
  final String leaveTime;
  final String reason;
  final String approvedBy;
  final String status;
  final String rejectReason;
  final Color detailColor;

  final LeaveHistoryEntity leaveEntity;

  ShortLeaveEntry({
    required this.date,
    required this.subType,
    required this.leaveTime,
    required this.reason,
    required this.approvedBy,
    required this.status,
    required this.rejectReason,
    required this.detailColor,
    required this.leaveEntity,
  });
}

class ShortLeaveCard extends StatelessWidget {
  final ShortLeaveEntry leave;
  final void Function({
  required String? fullName,
  required String? sandwichLeaveId,
  required String? userId,
  required String? leaveDate,
  })? onDelete;
  const ShortLeaveCard({required this.leave, this.onDelete, super.key});

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
            suffixIcon: leave.status == 'Pending'
                ? Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {
                          final entity = leave.leaveEntity;
                          onDelete?.call(
                            fullName: entity.userFullName,
                            sandwichLeaveId: entity.shortLeaveId,
                            userId: entity.userId,
                            leaveDate: entity.shortLeaveDate,
                          );
                        },
                        icon: Icon(
                          Icons.delete_outline,
                          size: 0.022 * Responsive.getHeight(context),
                          color: AppColors.white,
                        ),
                      ),
                    ],
                  )
                : null,
            title: leave.date,
            headerColor: leave.detailColor,
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
                          text: '${leave.status} ',
                          style: TextStyle(
                            color: leave.detailColor,
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
                  if (leave.rejectReason.isNotEmpty)
                    CustomText(
                      'Reject Reason : ${leave.rejectReason}',
                      fontSize: 12 * textResponsive,
                      color: Colors.black,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  const SizedBox.shrink(),
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
