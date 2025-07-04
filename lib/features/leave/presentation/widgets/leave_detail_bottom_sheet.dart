import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/widgets/common_card.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';

class LeaveDetailBottomSheet extends StatelessWidget {
  final String requestDate;
  final String approvedDate;
  final String leaveType;
  final String leaveDuration;
  final String reason;
  final String altPhone;
  final String taskDependency;
  final String dependencyHandle;
  final String status;
  final Color detailColor;
  final List<String> attachments;

  const LeaveDetailBottomSheet({
    required this.requestDate,
    required this.approvedDate,
    required this.leaveType,
    required this.leaveDuration,
    required this.reason,
    required this.altPhone,
    required this.taskDependency,
    required this.dependencyHandle,
    required this.attachments,
    required this.status,
    required this.detailColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Responsive.init(context);
    double textScale = getResponsiveText(context);

    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: SingleChildScrollView(
        child: CommonCard(
          headerColor: detailColor,
          bottomWidget: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    _buildDateRow(
                      context,
                      Icons.calendar_month,
                      'Request Date',
                      requestDate,
                    ),
                    _buildDateRow(
                      context,
                      Icons.verified,
                      'Approved Date',
                      approvedDate,
                    ),
                  ],
                ),
              ),
              // SizedBox(height: Responsive.scaleHeight(16)),
              _buildTabHeader(context),
              // SizedBox(height: Responsive.scaleHeight(16)),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildLabelValueRow(context, 'Leave Reason:', reason),
                    const Divider(),
                    _buildLabelValueRow(
                      context,
                      'Alt. phone Number:',
                      altPhone,
                    ),
                    const Divider(),
                    _buildLabelValueRow(
                      context,
                      'Task dependency:',
                      taskDependency,
                    ),
                    const Divider(),
                    _buildLabelValueColumn(
                      context,
                      'Dependency Handle:',
                      dependencyHandle,
                    ),
                  ],
                ),
              ),
              SizedBox(height: Responsive.scaleHeight(16)),
              Center(
                child: GestureDetector(
                  onTap: () {

                      Fluttertoast.showToast(msg: 'No Attachment attached');
                  },
                  child: Text(
                    'View attachments',
                    style: TextStyle(
                      color: AppColors.primary,
                      decoration: TextDecoration.underline,
                      fontSize: 14 * textScale,
                    ),
                  ),
                ),
              ),
              SizedBox(height: Responsive.scaleHeight(20)),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 38.0,
                  vertical: 10,
                ),
                child: MyCoButton(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  title: 'CLOSE',
                  isShadowBottomLeft: true,
                  boarderRadius: 50,
                ),
              ),
            ],
          ),
          title: requestDate,
          secondTitle: 'By, $approvedDate',
          headerHeight: 0.1 * getHeight(context),
          suffixIcon: StatusBadge(
            status: status,

            borderColor: AppColors.white,
            textColor: AppColors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildDateRow(
    BuildContext context,
    IconData icon,
    String label,
    String value,
  ) {
    double textScale = getResponsiveText(context);
    return Padding(
      padding: EdgeInsets.only(bottom: Responsive.scaleHeight(8)),
      child: Row(
        children: [
          Icon(icon, size: Responsive.scaleWidth(18), color: Colors.grey[700]),
          SizedBox(width: Responsive.scaleWidth(8)),
          Text('$label :', style: TextStyle(fontSize: 13 * textScale)),
          SizedBox(width: Responsive.scaleWidth(4)),
          Flexible(
            child: Text(
              value,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 13 * textScale,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabHeader(BuildContext context) {
    double textScale = getResponsiveText(context);
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: Responsive.scaleHeight(12)),
            decoration: BoxDecoration(
              color: detailColor.withValues(alpha: 0.4),
              border: const Border.symmetric(
                horizontal: BorderSide(color: AppColors.gray10, width: 2),
              ),
              // borderRadius: BorderRadius.only(topLeft: Radius.circular(10)),
            ),
            alignment: Alignment.center,
            child: Text(
              leaveType,
              style: TextStyle(
                fontSize: 14 * textScale,
                fontWeight: FontWeight.w600,
                color: detailColor,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 0.059 * getHeight(context),
          child: const VerticalDivider(
            color: AppColors.gray10,
            width: 1,
            thickness: 2,
          ),
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: Responsive.scaleHeight(12)),
            decoration: BoxDecoration(
              color: detailColor.withValues(alpha: 0.4),
              border: const Border.symmetric(
                horizontal: BorderSide(color: AppColors.gray10, width: 2),
              ),
            ),
            alignment: Alignment.center,
            child: Text(
              leaveDuration,
              style: TextStyle(
                fontSize: 14 * textScale,
                fontWeight: FontWeight.w600,
                color: detailColor,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLabelValueRow(BuildContext context, String label, String value) {
    final double textScale = getResponsiveText(context);
    return Padding(
      padding: EdgeInsets.only(bottom: Responsive.scaleHeight(12)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 12 * textScale,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: Responsive.scaleHeight(4)),
          Expanded(
            child: Text(
              ' $value',
              style: TextStyle(
                fontSize: 13 * textScale,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLabelValueColumn(
    BuildContext context,
    String label,
    String value,
  ) {
    final double textScale = getResponsiveText(context);
    return Padding(
      padding: EdgeInsets.only(bottom: Responsive.scaleHeight(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 12 * textScale,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: Responsive.scaleHeight(4)),
          Text(
            value,
            style: TextStyle(
              fontSize: 13 * textScale,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}

class StatusBadge extends StatelessWidget {
  final String status;
  final Color borderColor;
  final Color textColor;
  final Color backgroundColor;
  final double? fontSize;

  const StatusBadge({
    required this.status,
    super.key,
    this.borderColor = const Color(0xFF31C5B5),
    this.textColor = const Color(0xFF31C5B5),
    this.backgroundColor = Colors.transparent,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    double scale = getResponsiveText(context);

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Responsive.scaleWidth(12),
        vertical: Responsive.scaleHeight(6),
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: borderColor),
      ),
      child: Text(
        status,
        style: TextStyle(
          color: textColor,
          fontSize: (fontSize ?? 12) * scale,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
