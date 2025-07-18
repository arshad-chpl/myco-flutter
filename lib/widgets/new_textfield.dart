import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

class NewTextfield extends StatelessWidget {
  final String? label;
  final String? prefixIconPath;
  final String? suffixIconPath;
  final int? maxLines;
  final bool isRequired;
  final String? hintText;
  final FormFieldValidator<String>? validator;

  const NewTextfield({
    super.key,
    this.label,
    this.prefixIconPath,
    this.suffixIconPath,
    this.maxLines,
    this.isRequired = false,
    this.hintText,
    this.validator,
  });

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisSize: MainAxisSize.min,
    children: [
      if (label != null && label!.isNotEmpty) ...[
        Row(
          children: [
            CustomText(
              label!,
              color: AppTheme.getColor(context).onSurfaceVariant,
              fontSize: 12 * Responsive.getResponsiveText(context),
              fontWeight: FontWeight.w700,
              isKey: false,
            ),
            if (isRequired) ...[
              CustomText(
                "*",
                color: AppColors.red,
                fontSize: 12 * Responsive.getResponsiveText(context),
                fontWeight: FontWeight.w700,
              ),
            ],
          ],
        ),
        SizedBox(height: 0.005 * Responsive.getHeight(context)),
      ],
      TextFormField(
        minLines: 1,
        maxLines: maxLines ?? 1,
        style: TextStyle(
          fontSize: 14 * Responsive.getResponsiveText(context),
          fontWeight: FontWeight.w600,
          color: AppTheme.getColor(context).onSurface,
        ),
        decoration: InputDecoration(
          hintText: hintText,
          prefix: maxLines != null && prefixIconPath != null
              ? Padding(
                  padding: EdgeInsets.only(
                    left: 12 * Responsive.getResponsive(context),
                    right: 8 * Responsive.getResponsive(context),
                  ),
                  child: SvgPicture.asset(
                    prefixIconPath!,
                    height: 0.022 * Responsive.getHeight(context),
                  ),
                )
              : null,
          prefixIcon: maxLines == null && prefixIconPath != null
              ? Padding(
                  padding: EdgeInsets.only(
                    left: 12 * Responsive.getResponsive(context),
                    right: 8 * Responsive.getResponsive(context),
                  ),
                  child: SvgPicture.asset(
                    prefixIconPath!,
                    height: 0.022 * Responsive.getHeight(context),
                  ),
                )
              : null,
          prefixIconConstraints: prefixIconPath != null
              ? BoxConstraints(
                  minHeight: 0.022 * Responsive.getHeight(context),
                  minWidth:
                      (12 + 8) * Responsive.getResponsive(context) +
                      0.022 * Responsive.getHeight(context),
                )
              : null,
          suffixIcon: suffixIconPath != null
              ? Padding(
                  padding: EdgeInsets.only(
                    left: 8 * Responsive.getResponsive(context),
                    right: 12 * Responsive.getResponsive(context),
                  ),
                  child: SvgPicture.asset(
                    suffixIconPath!,
                    height: 0.022 * Responsive.getHeight(context),
                  ),
                )
              : null,
          suffixIconConstraints: suffixIconPath != null
              ? BoxConstraints(
                  minHeight: 0.022 * Responsive.getHeight(context),
                  minWidth:
                      (12 + 8) * Responsive.getResponsive(context) +
                      0.022 * Responsive.getHeight(context),
                )
              : null,
          filled: true,
          hintStyle: TextStyle(
            fontSize: 16 * Responsive.getResponsiveText(context),
            fontWeight: FontWeight.w600,
            color: AppTheme.getColor(context).outline,
          ),
          fillColor: AppTheme.getColor(context).surfaceBright,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppTheme.getColor(context).outline,
              width: 1.2,
            ),
            borderRadius: BorderRadius.circular(
              12 * Responsive.getResponsive(context),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppTheme.getColor(context).outline,
              width: 1.2,
            ),
            borderRadius: BorderRadius.circular(
              12 * Responsive.getResponsive(context),
            ),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppTheme.getColor(context).outline,
              width: 1.2,
            ),
            borderRadius: BorderRadius.circular(
              12 * Responsive.getResponsive(context),
            ),
          ),
          contentPadding: EdgeInsets.only(
            top: 18 * Responsive.getResponsive(context),
            left: 10 * Responsive.getResponsive(context),
            right: 0,
            bottom: 16 * Responsive.getResponsive(context),
          ),
        ),
        onChanged: (value) {
          // Handle text changes
        },
        validator:
            validator ??
            (isRequired
                ? (value) {
                    if (value == null || value.isEmpty) {
                      return 'This field is required';
                    }
                    return null;
                  }
                : null),
      ),
    ],
  );
}
