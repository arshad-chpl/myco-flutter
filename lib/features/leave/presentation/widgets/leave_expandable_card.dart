import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

class LeaveExpandableCard extends StatefulWidget {
  final String title;
  final String? subTitle;
  final String? secondTitle;
  final bool isButton;
  final String buttonText;
  final Widget collapsedChild;
  final Widget expandedChild;
  final void Function()? onTap;
  final double? headerHeight;
  final double? borderRadius;
  final EdgeInsetsGeometry? headerPadding;
  final Color? headerColor;
  final Color? borderColor;
  final bool? showHeaderPrefixIcon;
  final String? headerPrefixIcon;
  final Color? headerPrefixIconColor;

  const LeaveExpandableCard({
    super.key,
    required this.title,
    required this.collapsedChild,
    required this.expandedChild,
    this.isButton = false,
    this.buttonText = '',
    this.onTap,
    this.headerHeight,
    this.borderColor,
    this.headerPadding,
    this.showHeaderPrefixIcon,
    this.headerPrefixIcon,
    this.headerPrefixIconColor,
    this.subTitle,
    this.secondTitle,
    this.borderRadius,
    this.headerColor,
  });

  @override
  State<LeaveExpandableCard> createState() => _LeaveExpandableCardState();
}

class _LeaveExpandableCardState extends State<LeaveExpandableCard> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    final radius =
        (widget.borderRadius ?? 12) * Responsive.getResponsive(context);
    final colors = AppTheme.getColor(context);

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        border: Border.all(color: widget.borderColor ?? colors.outline),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Header
          ClipRRect(
            borderRadius: BorderRadius.circular(0),
            child: Container(
              height:
              widget.headerHeight ?? 0.06 * Responsive.getHeight(context),
              padding:
              widget.headerPadding ??
                  EdgeInsets.all(10 * Responsive.getResponsive(context)),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(radius),
                ),
                boxShadow: [
                  BoxShadow(
                    color: widget.headerColor?.withAlpha(200) ??
                        colors.secondary.withAlpha(200),
                  ),
                  BoxShadow(
                    color: widget.headerColor ?? colors.secondary,
                    spreadRadius: -4.0,
                    blurRadius: 6.0,
                  ),
                ],
              ),
              child: Row(
                children: [
                  if (widget.showHeaderPrefixIcon == true)
                    Image.asset(
                      widget.headerPrefixIcon ?? 'assets/images/calendar.png',
                      height: 0.1 * Responsive.getHeight(context),
                      width: 0.06 * Responsive.getWidth(context),
                      color: widget.headerPrefixIconColor,
                    ),
                  if (widget.showHeaderPrefixIcon == true)
                    SizedBox(width: 0.02 * Responsive.getWidth(context)),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          widget.title,
                          color: colors.onPrimary,
                          fontSize: 17 * Responsive.getResponsiveText(context),
                          fontWeight: FontWeight.bold,
                        ),
                        if (widget.secondTitle != null)
                          CustomText(
                            '${widget.secondTitle}',
                            color: colors.onPrimary,
                            fontSize:
                            17 * Responsive.getResponsiveText(context),
                            fontWeight: FontWeight.bold,
                          ),
                        if (widget.subTitle != null)
                          CustomText(
                            '${widget.subTitle}',
                            color: colors.onPrimary,
                            fontSize:
                            15 * Responsive.getResponsiveText(context),
                            fontWeight: FontWeight.bold,
                          ),
                      ],
                    ),
                  ),
                  if (widget.isButton)
                    SizedBox(width: 0.02 * Responsive.getWidth(context)),
                  if (widget.isButton)
                    MyCoButton(
                      onTap: widget.onTap,
                      title: widget.buttonText,
                      textStyle: TextStyle(
                        fontSize: 13 * Responsive.getResponsiveText(context),
                        color: colors.onPrimary,
                      ),
                      width: 0.16 * Responsive.getWidth(context),
                      boarderRadius: 30 * Responsive.getResponsive(context),
                      height: 0.03 * Responsive.getHeight(context),
                      isShadowBottomLeft: true,
                      enabled: true,
                    ),
                  IconButton(
                    icon: Icon(
                      _expanded
                          ? Icons.keyboard_arrow_up
                          : Icons.keyboard_arrow_down,
                      color: colors.onPrimary,
                    ),
                    onPressed: () => setState(() => _expanded = !_expanded),
                  ),
                ],
              ),
            ),
          ),

          // Always visible collapsed content
          widget.collapsedChild,

          // Expanded content only when expanded
          AnimatedCrossFade(
            duration: const Duration(milliseconds: 300),
            crossFadeState: _expanded
                ? CrossFadeState.showFirst
                : CrossFadeState.showSecond,
            firstChild: widget.expandedChild,
            secondChild: const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}
