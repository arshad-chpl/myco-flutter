import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

class PayslipCard extends StatefulWidget {
  final String month;
  final String year;
  final String netPay;
  final String grossSalary;
  final String totalDeduction;
  final VoidCallback? onDownload;
  final VoidCallback? onView;
  final ShapeBorder? cardShape;
  final double? cardElevation;
  final Decoration? headerDecoration;
  final EdgeInsetsGeometry? contentPadding;
  final EdgeInsetsGeometry? expandedPadding;
  final bool isShadowTopLeft;
  final bool isShadowTopRight;
  final bool isShadowBottomRight;
  final bool isShadowBottomLeft;
  final double? headerHeight;

  const PayslipCard({
    required this.month,
    required this.year,
    required this.netPay,
    required this.grossSalary,
    required this.totalDeduction,
    super.key,
    this.onDownload,
    this.onView,
    this.cardShape,
    this.cardElevation,
    this.headerDecoration,
    this.contentPadding,
    this.expandedPadding,
    this.isShadowTopLeft = false,
    this.isShadowTopRight = false,
    this.isShadowBottomRight = false,
    this.isShadowBottomLeft = false,
    this.headerHeight,
  });

  @override
  State<PayslipCard> createState() => _PayslipCardState();
}

class _PayslipCardState extends State<PayslipCard> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) => Card(
    shape:
        widget.cardShape ??
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            8 * Responsive.getResponsive(context),
          ),
          side: BorderSide(color: AppTheme.getColor(context).outline),
        ),
    child: Column(
      children: [
        Stack(
          children: [
            if (true) ...[
              // add conditions for which shadows you want
              Positioned.fill(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(
                    8 * Responsive.getResponsive(context),
                  ),
                  child: CustomPaint(
                    painter: InnerShadowPainter(
                      shadowColor: AppColors.white,
                      blur: 1.4,
                      offset: const Offset(0, 1),
                      borderRadius: 8,
                      isShadowTopLeft: true,
                      isShadowTopRight: true,
                      isShadowBottomRight: false,
                      isShadowBottomLeft: false,
                    ),
                  ),
                ),
              ),
              Positioned.fill(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: CustomPaint(
                    painter: InnerShadowPainter(
                      shadowColor: AppColors.white,
                      blur: 4,
                      offset: const Offset(4, -3),
                      borderRadius: 8,
                      isShadowTopLeft: true,
                      isShadowTopRight: true,
                      isShadowBottomRight: false,
                      isShadowBottomLeft: false,
                    ),
                  ),
                ),
              ),
            ],
            InkWell(
              onTap: () {
                setState(() {
                  isExpanded = !isExpanded;
                });
              },
              child: Container(
                height:
                    widget.headerHeight ??
                    0.045 * Responsive.getHeight(context),
                decoration:
                    widget.headerDecoration ??
                    BoxDecoration(
                      color: AppTheme.getColor(context).secondary,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(
                          8 * Responsive.getResponsive(context),
                        ),
                      ),
                    ),
                padding:
                    widget.contentPadding ??
                    EdgeInsets.symmetric(
                      horizontal: 12 * Responsive.getResponsive(context),
                    ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      '${widget.month} ${widget.year}',
                      fontSize: 15 * Responsive.getResponsiveText(context),
                      fontWeight: FontWeight.w700,
                      color: AppTheme.getColor(context).onPrimary,
                    ),
                    Icon(
                      isExpanded ? Icons.expand_less : Icons.expand_more,
                      color: AppTheme.getColor(context).onPrimary,
                      size: 30,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        AnimatedCrossFade(
          firstChild: Padding(
            padding: widget.expandedPadding ?? const EdgeInsets.all(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  'net_pay',
                  // 'Net Pay',
                  fontSize: 14 * Responsive.getResponsiveText(context),
                  fontWeight: FontWeight.bold,
                ),
                CustomText(
                  '₹${widget.netPay}',
                  fontSize: 14 * Responsive.getResponsiveText(context),
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
          ),
          secondChild: Padding(
            padding: EdgeInsets.all(12 * Responsive.getResponsive(context)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      'gross_pay' + '(A)',
                      // 'Gross Salary (A)',
                      fontSize: 15 * Responsive.getResponsiveText(context),
                      fontWeight: FontWeight.w600,
                    ),
                    CustomText(
                      '₹${widget.grossSalary}',
                      fontSize: 15 * Responsive.getResponsiveText(context),
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      'gross_deduction' + '(B)',
                      // 'Total Deduction (B)',
                      fontSize: 15 * Responsive.getResponsiveText(context),
                      fontWeight: FontWeight.w600,
                    ),
                    CustomText(
                      '₹${widget.totalDeduction}',
                      fontSize: 15 * Responsive.getResponsiveText(context),
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ),
                const DottedLineWidget(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      'net_pay' + '(A-B)',
                      // 'Net Pay (A-B)',
                      fontSize: 15 * Responsive.getResponsiveText(context),
                      fontWeight: FontWeight.bold,
                    ),
                    CustomText(
                      '₹${widget.netPay}',
                      fontSize: 15 * Responsive.getResponsiveText(context),
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: widget.onDownload,
                      child: CustomText(
                        'download_payslip',
                        // 'Download Payslip',
                        fontSize: 14 * Responsive.getResponsiveText(context),
                        color: AppTheme.getColor(context).secondary,
                        decoration: TextDecoration.underline,
                        decorationColor: AppTheme.getColor(context).secondary,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    GestureDetector(
                      onTap: widget.onView,
                      child: CustomText(
                        'view_payslip',
                        // 'View Payslip',
                        fontSize: 13,
                        color: AppTheme.getColor(context).secondary,
                        decoration: TextDecoration.underline,
                        decorationColor: AppTheme.getColor(context).secondary,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          crossFadeState: isExpanded
              ? CrossFadeState.showSecond
              : CrossFadeState.showFirst,
          duration: const Duration(milliseconds: 200),
        ),
      ],
    ),
  );
}

class DottedLineWidget extends StatelessWidget {
  final double height;
  final Color color;

  const DottedLineWidget({
    this.height = 1,
    this.color = Colors.black54,
    super.key,
  });

  @override
  Widget build(BuildContext context) => LayoutBuilder(
    builder: (context, constraints) {
      final boxWidth = constraints.constrainWidth();
      const dashWidth = 8.0;
      const dashSpace = 3.0;
      final dashCount = (boxWidth / (dashWidth + dashSpace)).floor();
      return Padding(
        padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            dashCount,
            (_) => SizedBox(
              width: dashWidth,
              height: height,
              child: DecoratedBox(decoration: BoxDecoration(color: color)),
            ),
          ),
        ),
      );
    },
  );
}
