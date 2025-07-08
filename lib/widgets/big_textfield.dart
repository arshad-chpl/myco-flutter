import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/responsive.dart';

class BigMyCoTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final Widget? prefixImage;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final bool readOnly;
  final int maxLines;
  final int? maxLength;
  final double? height;
  final double? width;
  final TextAlign textAlign;
  final FocusNode? focusNode;
  final void Function(String)? onChanged;
  final TextStyle? style;
  final TextStyle? hintStyle;
  final String? obscuringCharacter;
  final TextInputType? textInputType;
  final InputBorder? border;
  final bool obscureText;

  const BigMyCoTextField({
    super.key,
    this.controller,
    this.hintText,
    this.prefixImage,
    this.suffixIcon,
    this.validator,
    this.keyboardType,
    this.readOnly = false,
    this.maxLines = 4,
    this.maxLength,
    this.height = 100,
    this.width,
    this.textAlign = TextAlign.start,
    this.focusNode,
    this.onChanged,
    this.style,
    this.hintStyle,
    this.obscuringCharacter,
    this.textInputType,
    this.border,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) => FormField<String>(
    validator: validator,
    autovalidateMode: AutovalidateMode.onUserInteraction,
    builder: (field) {
      final hasError = field.hasError;

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: maxLines == 1 ? height : null,
            constraints: maxLines > 1 && height != null
                ? BoxConstraints(minHeight: height!)
                : null,
            width: width,
            padding: EdgeInsets.symmetric(
              horizontal: 12 * Responsive.getResponsive(context),
              vertical: 12 * Responsive.getResponsive(context),
            ),
            decoration: BoxDecoration(
              color: AppTheme.getColor(context).onPrimary,
              border: Border.all(
                color: hasError
                    ? AppTheme.getColor(context).error
                    : AppTheme.getColor(context).outlineVariant,
              ),
              borderRadius: BorderRadius.circular(
                12 * Responsive.getResponsive(context),
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (prefixImage != null)
                  Padding(
                    padding: EdgeInsets.only(
                      right: 8.0 * Responsive.getResponsive(context),
                      top: 4 * Responsive.getResponsive(context),
                    ),
                    child: prefixImage,
                  ),
                Expanded(
                  child: TextFormField(
                    controller: controller,
                    focusNode: focusNode,
                    keyboardType: textInputType,
                    readOnly: readOnly,
                    maxLines: maxLines,
                    maxLength: maxLength,
                    textAlign: textAlign,
                    style:
                        style ??
                        TextStyle(
                          fontSize: 20 * Responsive.getResponsiveText(context),
                          color: AppTheme.getColor(context).primary,
                        ),
                    onChanged: (value) {
                      field.didChange(value);
                      if (onChanged != null) onChanged!(value);
                    },
                    decoration: InputDecoration(
                      isCollapsed: true,
                      border: InputBorder.none,
                      hintText: hintText ?? "Write here",
                      hintStyle:
                          hintStyle ??
                          TextStyle(
                            color: AppTheme.getColor(context).outline,
                            fontSize:
                                20 * Responsive.getResponsiveText(context),
                          ),
                      suffixIcon: suffixIcon,
                      errorText: null, // Disable internal error text
                    ),
                    obscureText: obscureText ?? false,
                    obscuringCharacter: obscuringCharacter ?? '●',
                  ),
                ),
              ],
            ),
          ),
          if (hasError)
            Padding(
              padding: EdgeInsets.only(
                top: 4 * Responsive.getResponsive(context),
                left: 4 * Responsive.getResponsive(context),
              ),
              child: Text(
                field.errorText!,
                style: TextStyle(
                  color: AppTheme.getColor(context).error,
                  fontSize: 16 * Responsive.getResponsiveText(context),
                ),
              ),
            ),
        ],
      );
    },
  );
}
