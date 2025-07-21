import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

class NewTextField extends StatelessWidget {
  final String? label;
  final String? prefixIconPath;
  final String? suffixIconPath;
  final int? maxLines;
  final bool isRequired;
  final String? hintText;
  final FormFieldValidator<String>? validator;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final bool? enabled;
  final Function(String)? onChange;
  final Function()? onTap;
  final TextEditingController? controller;

  const NewTextField({
    super.key,
    this.label,
    this.prefixIconPath,
    this.suffixIconPath,
    this.maxLines,
    this.isRequired = false,
    this.hintText,
    this.validator,
    this.focusNode,
    this.keyboardType,
    this.enabled,
    this.onChange,
    this.onTap,
    this.controller,
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
              fontSize: 14 * Responsive.getResponsiveText(context),
              fontWeight: FontWeight.w700,
              isKey: false,
            ),
            if (isRequired) ...[
              CustomText(
                '*',
                color: AppColors.red,
                fontSize: 14 * Responsive.getResponsiveText(context),
                fontWeight: FontWeight.w700,
              ),
            ],
          ],
        ),
        SizedBox(height: 0.005 * Responsive.getHeight(context)),
      ],
      InkWell(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.only(
            left: 10 * Responsive.getResponsive(context),
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              12 * Responsive.getResponsive(context),
            ),
            color: AppTheme.getColor(context).surfaceBright,
            border: Border.all(
              color: AppTheme.getColor(context).outline,
              width: 1.2,
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (prefixIconPath != null)
                Padding(
                  padding: EdgeInsets.only(
                    top: 17.5 * Responsive.getResponsive(context),
                  ),
                  child: SvgPicture.asset(
                    prefixIconPath!,
                    height: 0.022 * Responsive.getHeight(context),
                  ),
                ),
              SizedBox(
                // height:50,
                width: 0.8 * Responsive.getWidth(context),
                child: IgnorePointer(
                  ignoring: onTap != null,
                  child: TextFormField(
                    controller: controller,
                    minLines: 1,
                    maxLines: maxLines ?? 1,
                    style: TextStyle(
                      fontSize: 16 * Responsive.getResponsiveText(context),
                      fontWeight: FontWeight.w600,
                      color: AppTheme.getColor(context).onSurface,
                    ),
                    enabled: enabled,
                    focusNode: focusNode,
                    keyboardType: keyboardType,
                    decoration: InputDecoration(
                      hintText: hintText,
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
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(
                        top: 14 * Responsive.getResponsive(context),
                        left: 12 * Responsive.getResponsive(context),
                        bottom: 13 * Responsive.getResponsive(context),
                      ),
                    ),
                    onChanged: onChange,
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
                ),
              ),
            ],
          ),
        ),
      ),
    ],
  );
}
