import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/leave/domain/intities/leave_history_response_entity.dart';
import 'package:myco_flutter/widgets/common_card.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
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
  final Widget onViewDetailWidget;
  final LeaveHistoryEntity leaveEntity;

  LeaveEntry({
    required this.date,
    required this.leaveType,
    required this.subType,
    required this.leaveTime,
    required this.reason,
    required this.approvedBy,
    required this.status,
    required this.payStatus,
    required this.onViewDetailWidget,
    required this.leaveEntity,
  });
}

class LeaveCard extends StatelessWidget {
  final LeaveEntry leave;
  final Function({required LeaveHistoryEntity leave})? onEdit;
  final Function({required String? leaveId})? onDelete;

  const LeaveCard({required this.leave, this.onEdit, this.onDelete, super.key});

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.getResponsive(context);
    final textResponsive = Responsive.getResponsiveText(context);

    // Determine if delete icon should be visible
    final showDeleteIcon =
        leave.status == 'Pending' &&
        (leave.leaveEntity.convertedFromAutoLeave == null ||
            leave.leaveEntity.convertedFromAutoLeave!.trim().isEmpty ||
            leave.leaveEntity.convertedFromAutoLeave!.trim() != '1');
    // Determine if edit icon should be visible based on Java conditions
    final showEditIcon =
        (leave.status == 'Pending') ||
        ((leave.leaveEntity.autoLeave ?? false) &&
            !(leave.leaveEntity.isSalaryGenerated ?? false));

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
            suffixIcon: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (showEditIcon)
                  IconButton(
                    onPressed: () {
                      onEdit!(leave: leave.leaveEntity);
                    },
                    icon: Icon(
                      Icons.edit_outlined,
                      size: 0.022 * Responsive.getHeight(context),
                      color: AppColors.white,
                    ),
                  ),
                if (showDeleteIcon)
                  IconButton(
                    onPressed: () {
                      onDelete!(leaveId: leave.leaveEntity.leaveId);
                    },
                    icon: Icon(
                      Icons.delete_outline,
                      size: 0.022 * Responsive.getHeight(context),
                      color: AppColors.white,
                    ),
                  ),
              ],
            ),
            title: leave.date,
            headerColor: leave.status == 'Pending'
                ? AppColors.spanishYellow
                : leave.status == 'Reject'
                ? AppColors.red
                : AppColors.secondary,
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
                            leave.status,
                            fontSize: 12 * textResponsive,
                            color: leave.status == 'Pending'
                                ? AppColors.spanishYellow
                                : leave.status == 'Reject'
                                ? AppColors.red
                                : AppColors.secondary,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          CustomText(
                            leave.payStatus,
                            fontSize: 12 * textResponsive,
                            color: leave.status.toLowerCase() == 'approved'
                                ? Colors.green
                                : leave.status.toLowerCase() == 'reject'
                                ? Colors.red
                                : Colors.orange,
                          ),
                          const SizedBox(height: 4),
                          MyCoButton(
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(20),
                                  ),
                                ),
                                builder: (_) => Padding(
                                  padding: EdgeInsets.all(20 * responsive),
                                  child: leave.onViewDetailWidget,
                                ),
                              );
                            },
                            title: 'View Details',
                            textStyle: TextStyle(
                              fontSize: 10 * textResponsive,
                              color: AppTheme.getColor(context).surface,
                            ),
                            width: 0.2 * Responsive.getWidth(context),
                            height: 0.025 * Responsive.getHeight(context),
                          ),
                          // ElevatedButton(
                          //   onPressed: () async {
                          //     showModalBottomSheet(
                          //       context: context,
                          //       isScrollControlled: true,
                          //
                          //       shape: const RoundedRectangleBorder(
                          //         borderRadius: BorderRadius.vertical(
                          //           top: Radius.circular(20),
                          //         ),
                          //       ),
                          //       builder: (_) => Padding(
                          //         padding: EdgeInsets.all(20 * responsive),
                          //         child: leave.onViewDetailWidget,
                          //       ),
                          //     );
                          //   },
                          //   style: ElevatedButton.styleFrom(
                          //     backgroundColor: AppColors.primary,
                          //     padding: const EdgeInsets.symmetric(
                          //       horizontal: 12,
                          //       vertical: 6,
                          //     ),
                          //     shape: RoundedRectangleBorder(
                          //       borderRadius: BorderRadius.circular(6),
                          //     ),
                          //   ),
                          //   child: CustomText(
                          //     'View Details',
                          //     fontSize: 12 * textResponsive,
                          //     color: Colors.white,
                          //   ),
                          // ),
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
      color: color.withOpacity(0.1),
      border: Border.all(color: color),
      borderRadius: BorderRadius.circular(6),
    ),
    child: CustomText(label, color: color, fontSize: 12),
  );
}
