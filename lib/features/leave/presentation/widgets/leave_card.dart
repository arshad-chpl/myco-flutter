import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
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
  });
}

class LeaveCard extends StatelessWidget {
  final LeaveEntry leave;

  const LeaveCard({required this.leave, super.key});

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

                      IconButton(
                        onPressed: () =>
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Still Work Left As no UI'),
                              ),
                            ),
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
                            color: AppColors.black,
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
      color: color.withValues(alpha: 0.1),
      border: Border.all(color: color),
      borderRadius: BorderRadius.circular(6),
    ),
    child: CustomText(label, color: color, fontSize: 12),
  );
}
