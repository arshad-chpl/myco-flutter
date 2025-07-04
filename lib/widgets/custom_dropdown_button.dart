import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
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
  final double ? iconSize;
  final Icon? icon;
  final Color? iconColor;
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
    this.borderRadius, this.iconSize, this.icon, this.iconColor, this.spacing,

  });

  @override
  Widget build(BuildContext context) => SizedBox(
      width: width ?? double.infinity,
      height: height ??  50,
      child: PopupMenuButton<T>(
        itemBuilder: (context) => items.asMap().entries.map((entry) {
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
                    fontSize: AppTheme
                        .getTextStyle(context).bodyMedium!.fontSize,
                    color: AppTheme.getColor(context).primary,

                  ),
                ),
                activeColor: AppTheme.getColor(context).primary,
                contentPadding: EdgeInsets.zero,
                dense: true,
              )
                  : Text(
                itemToString(item),
                style: TextStyle(
                  fontSize: AppTheme
                      .getTextStyle(context).bodyMedium!.fontSize,
                  color: AppTheme.getColor(context).primary,

                ),
              ),
            );
          }).toList(),
        onSelected: useRadioList
            ? null
            : (value) {
          final index = items.indexOf(value);
          onChanged?.call(value, index);
        },
        color: colorBackground ?? AppTheme.getColor(context).onPrimary,
        elevation: popupElevation ?? 4 * getResponsive(context),
        shape: popupShape ??
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8 * getResponsive(context)),
              side: BorderSide(color: AppTheme.getColor(context).primary, width: 0.002 * getWidth(context) ),
            ),
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 12 * getResponsive(context),
          ),
          decoration: BoxDecoration(
            color: colorBackground ?? AppTheme.getColor(context).onPrimary,
            borderRadius: BorderRadius.circular(borderRadius ?? 8 * getResponsive(context)),
            border: border ?? Border.all(color: AppTheme.getColor(context).primary, width: 0.002 * getWidth(context)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (prefix != null)
                prefix!
              else if (prefixImage != null && prefixImage!.isNotEmpty)
                GestureDetector(
                  onTap: onTapPrefix,
                  child: Padding(
                    padding: EdgeInsets.only(right: 16.0 * getResponsive(context)),
                    child: Image.asset(
                      prefixImage!,
                      height: prefixImageHeight ?? 0.018 * getHeight(context),
                      width: prefixImageWidth ?? 0.018 *getWidth(context),
                      fit: BoxFit.contain,
                    ),
                  ),
                )
              else
                const SizedBox.shrink(),
              
              SizedBox(width: spacing??0,),
              Expanded(
                child: Text(
                  selectedItem != null
                      ? itemToString(selectedItem as T)
                      : hintText ?? 'Select',
                  style: selectedItem != null
                      ? AppTheme.getTextStyle(context).bodyMedium?.copyWith(
                    color: AppTheme.getColor(context).primary,
                  )
                      : hintTextStyle ??
                      AppTheme.getTextStyle(context).bodyMedium?.copyWith(
                        color: AppTheme.getColor(context).primary,
                      ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Icon(icon?.icon ?? Icons.keyboard_arrow_down, color:iconColor??  AppTheme.getColor(context).primary, size:iconSize?? 30 * getResponsive(context)),
            ],
          ),
        ),
      ),
    );
}

//below given code is the example of the usage of the above code in ui

//  final List<String> leavetype = ['Paid leave', 'Unpaid leave', 'Casual leave'];
//   String? selectedleavetype;
// //CustomPopupDropdownStyled<String>(
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