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
  });

  @override
  Widget build(BuildContext context) => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CustomText(
              label,
                color: AppColors.textGray,
                fontSize: 16 * getResponsiveText(context),
                fontWeight: FontWeight.bold,
            ),
            if (isRequired)
              CustomText(
                "*",
                  color: AppColors.red,
                  fontSize: 20 * getResponsiveText(context),
                  fontWeight: FontWeight.bold,
              ),
          ],
        ),
        SizedBox(height: 0.005 * getHeight(context)),
        CustomPopupDropdownStyled<T>(
          prefix: prefix,
          prefixImage: prefixImage,
          height: height ?? 0.06 * getHeight(context),
          width: width ?? 0.9 * getWidth(context),
          hintText: hintText,
          hintTextStyle:
              hintTextStyle ??
              TextStyle(
                fontSize: 18 * getResponsiveText(context),
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
          useRadioList: useRadioList??false,
        ),
      ],
    );
}
