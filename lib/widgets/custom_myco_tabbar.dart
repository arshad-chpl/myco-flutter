import 'package:flutter/material.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';

class MyCustomTabBar extends StatelessWidget {
  final List<String> tabs;
  final List<Color> selectedBgColors;
  final List<TextStyle>? selectedTextStyles;
  final double? height;
  final double? width;
  final Color unselectedBorderAndTextColor;
  final Color tabBarBorderColor;
  final TextStyle? unselectedTextStyle;
  final double? borderRadius;
  final bool? isShadowTopLeft;
  final bool? isShadowTopRight;
  final bool? isShadowBottomRight;
  final bool? isShadowBottomLeft;
  final Color? tabBarBackgroundColor;
  final int selectedIndex;
  final Function(int index)? onTabChange;

  const MyCustomTabBar({
    super.key,
    required this.tabs,
    required this.selectedBgColors,
    required this.unselectedBorderAndTextColor,
    required this.tabBarBorderColor,
    required this.selectedIndex,
    this.height,
    this.width,
    this.selectedTextStyles,
    this.unselectedTextStyle,
    this.borderRadius,
    this.isShadowTopLeft = false,
    this.isShadowTopRight = false,
    this.isShadowBottomRight = false,
    this.isShadowBottomLeft = false,
    this.tabBarBackgroundColor,
    this.onTabChange,
  }) : assert(
         selectedBgColors.length == tabs.length,
         "Each tab must have a corresponding selectedBgColor",
       );

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
    height: height ?? 0.06 * Responsive.getHeight(context),
    width: width ?? 0.9 * Responsive.getWidth(context),
    decoration: BoxDecoration(
      border: Border.all(color: tabBarBorderColor),
      borderRadius: BorderRadius.circular(borderRadius ?? 50),
      color: tabBarBackgroundColor ?? Colors.transparent,
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(tabs.length, (index) {
        final isSelected = index == selectedIndex;

        return Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: MyCoButton(
              isShadowBottomLeft: isSelected
                  ? isShadowBottomLeft ?? false
                  : false,
              isShadowBottomRight: isSelected
                  ? isShadowBottomRight ?? false
                  : false,
              isShadowTopLeft: isSelected ? isShadowTopLeft ?? false : false,
              isShadowTopRight: isSelected ? isShadowTopRight ?? false : false,
              title: tabs[index],
              onTap: () => onTabChange?.call(index),
              backgroundColor: isSelected
                  ? selectedBgColors[index]
                  : Colors.transparent,
              borderColor: isSelected
                  ? selectedBgColors[index]
                  : Colors.transparent,
              borderWidth: isSelected ? null : 1.5,
              boarderRadius: borderRadius ?? 50,
              textStyle: isSelected
                  ? TextStyle(
                      fontSize: 13 * Responsive.getResponsiveText(context),
                      color: Colors.white,
                      fontFamily: 'Gilroy-Bold',
                      fontWeight: FontWeight.w700,
                    )
                  : TextStyle(
                      fontFamily: 'Gilroy-Bold',
                      color: selectedBgColors[index],
                      fontSize: 13 * Responsive.getResponsiveText(context),
                      fontWeight: FontWeight.w700,
                    ),
            ),
          ),
        );
      }),
    ),
  );
}
