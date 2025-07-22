import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

class CommonRow extends StatefulWidget {
  final String title;
  final String value;
  final Widget? valueWidget;
  final Color textColor;
  final TextDecoration? decoration;

  const CommonRow({
    super.key,
    required this.title,
    required this.value,
    this.valueWidget,
    required this.textColor, // Slightly faded like image
    this.decoration,
  });

  @override
  State<CommonRow> createState() => _CommonRowState();
}

class _CommonRowState extends State<CommonRow> {
  @override
  Widget build(BuildContext context) => Padding(
      padding: const EdgeInsets.symmetric(vertical: 2), // match row height
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          /// Title (left side)
          Expanded(
            flex: 5,
            child: CustomText(
              widget.title,
              fontWeight: FontWeight.w600,
              fontSize: 17 * Responsive.getResponsiveText(context),
              color: AppTheme.getColor(context).onSurface,
            ),
          ),

          /// Colon
          CustomText(
            ':',
            fontWeight: FontWeight.w500,
            fontSize: 17 * Responsive.getResponsiveText(context),
            color: AppTheme.getColor(context).onSurface,
          ),
          SizedBox(width: 0.020 * Responsive.getWidth(context)),

          /// Value (right side)
          Expanded(
            flex: 5,
            child: InkWell(
              child: widget.valueWidget ??
                  CustomText(
                    widget.value,
                    decoration: widget.decoration,
                    color: widget.textColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 17 * Responsive.getResponsiveText(context),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
            ),
          ),
        ],
      ),
    );
}
