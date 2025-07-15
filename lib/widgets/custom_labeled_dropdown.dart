import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/widgets/custom_dropdown_button.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

class LabeledDropdown<T> extends StatelessWidget {
  final String label;
  final bool isRequired;
  final List<T> items;
  final T? selectedItem;
  final String Function(T) itemToString;
  final void Function(T?, int)? onChanged;
  final String? hintText;
  final TextStyle? hintTextStyle;
  final double? height;
  final double? width;
  final Widget? prefix;
  final String? prefixImage;
  final double? prefixImageWidth;
  final double? prefixImageHeight;
  final void Function()? onTapPrefix;
  final bool? useRadioList;
  final BoxBorder? border;
  final ShapeBorder? popupShape;
  final Color? colorBackground;
  final double? popupElevation;
  final double? borderRadius;
  final double? spacing;
  final Color? textColor;
  final FontWeight? textFontweight;
  final double? textFontSize;
  final TextDecoration? textDecoration;
  final Color? textDecorationColor;
  final TextAlign? textAlign;
  final int? textMaxLine;
  final TextOverflow? textOverflow;
  final bool? suffixIconOn;
  final Widget? suffix;

  const LabeledDropdown({
    super.key,
    required this.label,
    this.isRequired = false,
    required this.items,
    required this.itemToString,
    required this.selectedItem,
    required this.onChanged,
    this.hintText,
    this.hintTextStyle,
    this.height,
    this.width,
    this.prefix,
    this.prefixImage,
    this.spacing,
    this.prefixImageWidth,
    this.prefixImageHeight,
    this.onTapPrefix,
    this.useRadioList,
    this.border,
    this.popupShape,
    this.colorBackground,
    this.popupElevation,
    this.borderRadius,
    this.textColor,
    this.textFontweight,
    this.textFontSize,
    this.textDecoration,
    this.textDecorationColor,
    this.textAlign,
    this.textMaxLine,
    this.textOverflow,
    this.suffixIconOn,
    this.suffix,
  });

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        children: [
          CustomText(
            label,
            color: textColor ?? AppColors.textGray,
            fontSize:
                textFontSize ?? 16 * Responsive.getResponsiveText(context),
            fontWeight: textFontweight ?? FontWeight.bold,
            decoration: textDecoration,
            textAlign: textAlign,
            decorationColor: textDecorationColor,
            maxLines: textMaxLine,
            overflow: textOverflow,
          ),
          if (isRequired)
            CustomText(
              "*",
              color: AppColors.red,
              fontSize: 20 * Responsive.getResponsiveText(context),
              fontWeight: FontWeight.bold,
            ),
        ],
      ),
      SizedBox(height: 0.005 * Responsive.getHeight(context)),
      CustomPopupDropdownStyled<T>(
        prefix: prefix,
        prefixImage: prefixImage,
        height: height ?? 0.06 * Responsive.getHeight(context),
        width: width ?? 0.9 * Responsive.getWidth(context),
        hintText: hintText,
        hintTextStyle:
            hintTextStyle ??
            TextStyle(
              fontSize: 18 * Responsive.getResponsiveText(context),
              color: AppColors.gray,
              fontWeight: FontWeight.bold,
            ),
        items: items,
        selectedItem: selectedItem,
        itemToString: itemToString,
        onChanged: onChanged,
        border: border,
        prefixImageHeight: prefixImageHeight,
        prefixImageWidth: prefixImageWidth,
        colorBackground: colorBackground,
        borderRadius: borderRadius,
        onTapPrefix: onTapPrefix,
        popupElevation: popupElevation,
        popupShape: popupShape,
        useRadioList: useRadioList ?? false,
        spacing: spacing,
        suffixIconOn: suffixIconOn,
        suffix: suffix,
      ),
    ],
  );
}
