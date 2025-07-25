import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/language_manager.dart';
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
  final GlobalKey<FormFieldState>? formFieldKey;
  final bool? isKey;
  final Widget? suffix;
  final Widget? prefix;
  final int? minLines;

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
    this.formFieldKey,
    this.isKey = true,
    this.suffix,
    this.prefix,
    this.minLines,
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
              isKey: isKey ?? false,
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
      FormField<String>(
        key: formFieldKey,
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
        builder: (FormFieldState<String> field) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: onTap,
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 10 * Responsive.getResponsive(context),
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
                  children: [
                    if (prefix != null)
                      Center(child: prefix)
                    else if (prefixIconPath != null)
                      Padding(
                        padding: EdgeInsets.only(
                          right: 8 * Responsive.getResponsive(context),
                        ),
                        child: SvgPicture.asset(
                          prefixIconPath!,
                          height: 0.022 * Responsive.getHeight(context),
                        ),
                      ),
                    Expanded(
                      child: SizedBox(
                        width: 0.8 * Responsive.getWidth(context),
                        child: IgnorePointer(
                          ignoring: onTap != null,
                          child: TextFormField(
                            minLines: minLines??1,
                            maxLines: maxLines ?? 1,
                            style: TextStyle(
                              fontSize:
                                  16 * Responsive.getResponsiveText(context),
                              fontWeight: FontWeight.w600,
                              color: AppTheme.getColor(context).onSurface,
                            ),
                            enabled: enabled,
                            focusNode: focusNode,
                            keyboardType: keyboardType,
                            controller: controller,
                            decoration: InputDecoration(
                              hintText: LanguageManager().get(
                                hintText.toString(),
                              ),
                              suffixIcon: suffixIconPath == null
                                  ? suffix
                                  : suffixIconPath != null
                                  ? Padding(
                                      padding: EdgeInsets.only(
                                        left:
                                            8 *
                                            Responsive.getResponsive(context),
                                        right:
                                            12 *
                                            Responsive.getResponsive(context),
                                      ),
                                      child: SvgPicture.asset(
                                        suffixIconPath!,
                                        height:
                                            0.022 *
                                            Responsive.getHeight(context),
                                      ),
                                    )
                                  : null,
                              suffixIconConstraints: suffixIconPath != null
                                  ? BoxConstraints(
                                      minHeight:
                                          0.022 * Responsive.getHeight(context),
                                      minWidth:
                                          (12 + 8) *
                                              Responsive.getResponsive(
                                                context,
                                              ) +
                                          0.022 * Responsive.getHeight(context),
                                    )
                                  : null,
                              filled: true,
                              hintStyle: TextStyle(
                                fontSize:
                                    16 * Responsive.getResponsiveText(context),
                                fontWeight: FontWeight.w600,
                                color: AppTheme.getColor(context).outline,
                              ),
                              fillColor: AppTheme.getColor(
                                context,
                              ).surfaceBright,
                              contentPadding: EdgeInsets.only(
                                top: 14 * Responsive.getResponsive(context),
                                left: 12 * Responsive.getResponsive(context),
                                bottom: 13 * Responsive.getResponsive(context),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                ),
                                borderRadius: BorderRadius.circular(
                                  12 * Responsive.getResponsive(context),
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                ),
                                borderRadius: BorderRadius.circular(
                                  12 * Responsive.getResponsive(context),
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                ),
                                borderRadius: BorderRadius.circular(
                                  12 * Responsive.getResponsive(context),
                                ),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                ),
                                borderRadius: BorderRadius.circular(
                                  12 * Responsive.getResponsive(context),
                                ),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                ),
                                borderRadius: BorderRadius.circular(
                                  12 * Responsive.getResponsive(context),
                                ),
                              ),
                              disabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                ),
                              ),
                            ),
                            onChanged: (value) {
                              onChange?.call(value);
                              field.didChange(value);
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            if (field.hasError && controller!.text.isNotEmpty)
              Padding(
                padding: EdgeInsets.only(
                  top: 4 * Responsive.getResponsive(context),
                  left: 10 * Responsive.getResponsive(context),
                ),
                child: CustomText(
                  field.errorText ?? 'Validation error',
                  color: AppColors.red,
                  fontSize: 12 * Responsive.getResponsiveText(context),
                  fontWeight: FontWeight.w600,
                ),
              ),
          ],
        ),
      ),
    ],
  );
}
