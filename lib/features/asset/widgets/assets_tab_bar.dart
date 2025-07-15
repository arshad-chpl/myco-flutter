import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';

class MyCustomTabBar extends StatefulWidget {
  final List<String> tabs;
  final Color selectedBgColor;
  final Color unselectedBorderAndTextColor;
  final Color tabBarBorderColor;
  final TextStyle? selectedTextStyle;
  final TextStyle? unselectedTextStyle;
  final double? borderRadius;
  final bool? isShadowTopLeft;
  final bool? isShadowTopRight;
  final bool? isShadowBottomRight;
  final bool? isShadowBottomLeft;

  const MyCustomTabBar({
    super.key,
    required this.tabs,
    required this.selectedBgColor,
    required this.unselectedBorderAndTextColor,
    required this.tabBarBorderColor,
    this.selectedTextStyle,
    this.unselectedTextStyle,
    this.borderRadius,
    this.isShadowTopLeft = false,
    this.isShadowTopRight = false,
    this.isShadowBottomRight = false,
    this.isShadowBottomLeft = false,
  });

  @override
  State<MyCustomTabBar> createState() => _MyCustomTabBarState();
}

class _MyCustomTabBarState extends State<MyCustomTabBar> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) => Container(
    padding: EdgeInsets.symmetric(
      horizontal: 6 * Responsive.getResponsive(context),
      vertical: 6 * Responsive.getResponsive(context),
    ),
    decoration: BoxDecoration(
      border: Border.all(color: widget.tabBarBorderColor),
      borderRadius: BorderRadius.circular(
        widget.borderRadius ?? 50 * Responsive.getResponsive(context),
      ),
      color: AppColors.white,
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(widget.tabs.length, (index) {
        final isSelected = index == selectedIndex;

        return Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 4 * Responsive.getResponsive(context),
            ),
            child: MyCoButton(
              isShadowBottomLeft: isSelected
                  ? widget.isShadowBottomLeft ?? false
                  : false,
              isShadowBottomRight: isSelected
                  ? widget.isShadowBottomRight ?? false
                  : false,
              isShadowTopLeft: isSelected
                  ? widget.isShadowTopLeft ?? false
                  : false,
              isShadowTopRight: isSelected
                  ? widget.isShadowTopRight ?? false
                  : false,
              title: widget.tabs[index],
              onTap: () => setState(() => selectedIndex = index),
              backgroundColor: isSelected
                  ? widget.selectedBgColor
                  : Colors.transparent,
              borderColor: isSelected
                  ? null
                  : widget.unselectedBorderAndTextColor,
              borderWidth: isSelected
                  ? null
                  : 1.5 * Responsive.getResponsive(context),
              boarderRadius:
                  widget.borderRadius ?? 50 * Responsive.getResponsive(context),
              textStyle: isSelected
                  ? (widget.selectedTextStyle ??
                        const TextStyle(
                          color: AppColors.white,
                          fontWeight: FontWeight.w600,
                        ))
                  : (widget.unselectedTextStyle ??
                        TextStyle(
                          color: widget.unselectedBorderAndTextColor,
                          fontWeight: FontWeight.w500,
                        )),
            ),
          ),
        );
      }),
    ),
  );
}
