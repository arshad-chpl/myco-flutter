import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

class LeaveDetail {
  final String leaveAgainst;
  final String expireOn;
  final String isUsed;
  final String type;

  LeaveDetail({
    required this.leaveAgainst,
    required this.expireOn,
    required this.isUsed,
    required this.type,
  });
}

void showLeaveDatesBottomSheet(
  BuildContext context,
  List<LeaveDetail> leaveList,
) {
  final responsive = getResponsive(context);
  final textResponsive = getResponsiveText(context);

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) => DraggableScrollableSheet(
      initialChildSize: 0.4,
      maxChildSize: 0.95,
      minChildSize: 0.4,
      builder: (context, scrollController) => Container(
        padding: EdgeInsets.all(12 * responsive),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20 * responsive),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 40,
                height: 4,
                margin: const EdgeInsets.only(bottom: 12),
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),

            Container(
              height: 0.03 * getHeight(context),
              width: getWidth(context),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  // Bottom-right shadow (darker)
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.2),
                    offset: const Offset(2, 2),
                    blurRadius: 4,
                    spreadRadius: 1,
                  ),
                  // Top-left highlight (lighter)
                  BoxShadow(
                    color: Colors.white.withValues(alpha: 0.2),
                    offset: const Offset(-2, -2),
                    blurRadius: 4,
                    spreadRadius: 1,
                  ),
                ],
              ),
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: CustomText(
                'Leave Dates',
                fontSize: 18 * textResponsive,
                fontWeight: FontWeight.bold,
                color: AppColors.white,
              ),
            ),

            CustomText(
              'Leaves',
              fontSize: 16 * textResponsive,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              // padding: EdgeInsets.symmetric(
              //   horizontal: 16 * responsive,
              //   vertical: 8 * responsive,
              // ),
              // backgroundColor: AppColors.primary,
              // borderRadius: BorderRadius.circular(8 * responsive),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: ListView.separated(
                controller: scrollController,
                itemCount: leaveList.length,
                separatorBuilder: (_, __) => SizedBox(height: 10 * responsive),
                itemBuilder: (context, index) {
                  final leave = leaveList[index];
                  return Container(
                    padding: EdgeInsets.all(12 * responsive),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12 * responsive),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 4,
                          offset: Offset(0, 2),
                        ),
                      ],
                      border: Border.all(
                        color: AppColors.primary.withValues(alpha: 0.2),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _leaveRow(
                          Icons.calendar_today,
                          'Leave Against',
                          leave.leaveAgainst,
                          textResponsive,
                        ),
                        _leaveRow(
                          Icons.calendar_today_outlined,
                          'Leave Expire On',
                          leave.expireOn,
                          textResponsive,
                        ),
                        _leaveRow(
                          Icons.check_circle_outline,
                          'Is Leave Used',
                          leave.isUsed,
                          textResponsive,
                        ),
                        _leaveRow(
                          Icons.access_time,
                          'Leave Type',
                          leave.type,
                          textResponsive,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget _leaveRow(
  IconData icon,
  String label,
  String value,
  double textResponsive,
) => Padding(
  padding: const EdgeInsets.symmetric(vertical: 4.0),
  child: Row(
    children: [
      Icon(icon, size: 18, color: AppColors.primary),
      const SizedBox(width: 6),
      Expanded(
        child: CustomText(
          '$label : $value',
          fontSize: 13 * textResponsive,
          fontWeight: FontWeight.w500,
          color: Colors.black87,
        ),
      ),
    ],
  ),
);
