// ignore_for_file: prefer_expression_function_bodies

import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';

class CustomPopupDropdownStyled<T> extends StatelessWidget {
  final List<T> items;
  final T? selectedItem;
  final String Function(T) itemToString;
  final String? hintText;
  final void Function(T?, int)? onChanged;
  final double? width;
  final double? height;
  final Widget? prefix;
  final String? prefixImage;
  final double? prefixImageWidth;
  final double? prefixImageHeight;
  final void Function()? onTapPrefix;
  final TextStyle? hintTextStyle;
  final bool useRadioList;
  final BoxBorder? border;
  final ShapeBorder? popupShape;
  final Color? colorBackground;
  final double? popupElevation;
  final double? borderRadius;
  final double? spacing;

  const CustomPopupDropdownStyled({
    super.key,
    required this.items,
    this.selectedItem,
    required this.itemToString,
    this.hintText,
    this.onChanged,
    this.width,
    this.height,
    this.prefix,
    this.prefixImage,
    this.prefixImageWidth,
    this.prefixImageHeight,
    this.onTapPrefix,
    this.hintTextStyle,
    this.useRadioList = false,
    this.popupShape,
    this.border,
    this.colorBackground,
    this.popupElevation,
    this.borderRadius,
    this.spacing,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? 50,
      child: PopupMenuButton<T>(
        itemBuilder: (context) {
          return items.asMap().entries.map((entry) {
            final index = entry.key;
            final item = entry.value;

            return PopupMenuItem<T>(
              value: item,
              enabled: !useRadioList,
              child: useRadioList
                  ? RadioListTile<T>(
                      value: item,
                      groupValue: selectedItem,
                      onChanged: (val) {
                        Navigator.pop(context);
                        onChanged?.call(val, index);
                      },
                      title: Text(
                        itemToString(item),
                        style: TextStyle(
                          fontSize: 14 * getResponsiveText(context),
                          color: AppColors.primary,
                        ),
                      ),
                      activeColor: AppColors.primary,
                      contentPadding: EdgeInsets.zero,
                      dense: true,
                    )
                  : Text(
                      itemToString(item),
                      style: TextStyle(
                        // fontSize:
                        // AppTheme.lightTheme.textTheme.bodyMedium?.fontSize,
                        color: AppColors.primary,
                      ),
                    ),
            );
          }).toList();
        },
        onSelected: useRadioList
            ? null
            : (value) {
                final index = items.indexOf(value);
                onChanged?.call(value, index);
              },
        color: colorBackground ?? AppColors.white,
        elevation: popupElevation ?? 4,
        shape:
            popupShape ??
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side: const BorderSide(color: AppColors.primary, width: 1.5),
            ),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: colorBackground ?? AppColors.white,
            borderRadius: BorderRadius.circular(borderRadius ?? 8),
            border: border ?? Border.all(color: AppColors.primary),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (prefix != null)
                prefix!
              else if (prefixImage != null && prefixImage!.isNotEmpty)
                GestureDetector(
                  onTap: onTapPrefix,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: Image.asset(
                      prefixImage!,
                      height: prefixImageHeight ?? 18,
                      width: prefixImageWidth ?? 18,
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              else
                const SizedBox.shrink(),

              SizedBox(width: spacing ?? 0.01 * getWidth(context)),
              Text(
                selectedItem != null
                    ? itemToString(selectedItem as T)
                    : hintText ?? 'Select',
                // style: selectedItem != null
                //     ? AppTheme.lightTheme.textTheme.bodyMedium?.copyWith(
                //   color: AppColors.primary,
                // )
                //     : hintTextStyle ??
                //     AppTheme.lightTheme.textTheme.bodyMedium?.copyWith(
                //       color: AppColors.primary,
                //     ),
                overflow: TextOverflow.ellipsis,
              ),
              const Icon(
                Icons.arrow_drop_down,
                color: AppColors.primary,
                size: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//below given code is the example of the usage of the above code in ui

//  final List<String> leavetype = ['Paid leave', 'Unpaid leave', 'Casual leave'];
//   String? selectedleavetype;
// CustomPopupDropdownStyled<String>(
//                     items: leavetype,
//                     hintText: 'Select Leave Type',
//                     // width: double.infinity,
//                     selectedItem: selectedleavetype,
//                     itemToString: (item) => item,
//                     onChanged: (value, index) {
//                       setState(() {
//                         selectedleavetype = value;
//                       });
//                     },
//                     useRadioList: true,
//                   ),
