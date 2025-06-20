// import 'package:flutter/material.dart';
// import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';

// class MyCustomTabBar extends StatefulWidget {
//   final List<String> tabs;
//   final Color selectedBgColor;
//   final Color unselectedBorderAndTextColor;
//   final Color tabBarBorderColor;
//   final TextStyle? selectedTextStyle;
//   final TextStyle? unselectedTextStyle;
//   final double? borderRadius;
//   final bool? isShadowTopLeft;
//   final bool? isShadowTopRight;
//   final bool? isShadowBottomRight;
//   final bool? isShadowBottomLeft;
//   final Color? tabBarBackgroundColor;

//   const MyCustomTabBar({
//     super.key,
//     required this.tabs,
//     required this.selectedBgColor,
//     required this.unselectedBorderAndTextColor,
//     required this.tabBarBorderColor,
//     this.selectedTextStyle,
//     this.unselectedTextStyle,
//     this.borderRadius,
//     this.isShadowTopLeft = false,
//     this.isShadowTopRight = false,
//     this.isShadowBottomRight = false,
//     this.isShadowBottomLeft = false,
//     this.tabBarBackgroundColor,
//   });

//   @override
//   State<MyCustomTabBar> createState() => _MyCustomTabBarState();
// }

// class _MyCustomTabBarState extends State<MyCustomTabBar> {
//   int selectedIndex = 0;

//   @override
//   Widget build(BuildContext context) => Container(
//     padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
//     decoration: BoxDecoration(
//       border: Border.all(color: widget.tabBarBorderColor),
//       borderRadius: BorderRadius.circular(widget.borderRadius ?? 50),
//       color: widget.tabBarBackgroundColor ?? Colors.white,
//     ),
//     child: Row(
//       mainAxisSize: MainAxisSize.min,
//       children: List.generate(widget.tabs.length, (index) {
//         final isSelected = index == selectedIndex;

//         return Expanded(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 4),
//             child: MyCoButton(
//               isShadowBottomLeft: isSelected
//                   ? widget.isShadowBottomLeft ?? false
//                   : false,
//               isShadowBottomRight: isSelected
//                   ? widget.isShadowBottomRight ?? false
//                   : false,
//               isShadowTopLeft: isSelected
//                   ? widget.isShadowTopLeft ?? false
//                   : false,
//               isShadowTopRight: isSelected
//                   ? widget.isShadowTopRight ?? false
//                   : false,
//               title: widget.tabs[index],
//               onTap: () => setState(() => selectedIndex = index),
//               backgroundColor: isSelected
//                   ? widget.selectedBgColor
//                   : Colors.transparent,
//               borderColor: isSelected
//                   ? null
//                   : widget.unselectedBorderAndTextColor,
//               borderWidth: isSelected ? null : 1.5,
//               boarderRadius: widget.borderRadius ?? 50,
//               textStyle: isSelected
//                   ? (widget.selectedTextStyle ??
//                         const TextStyle(
//                           color: Colors.white,
//                           fontWeight: FontWeight.w600,
//                         ))
//                   : (widget.unselectedTextStyle ??
//                         TextStyle(
//                           color: widget.unselectedBorderAndTextColor,
//                           fontWeight: FontWeight.w500,
//                         )),
//             ),
//           ),
//         );
//       }),
//     ),
//   );
// }

import 'package:flutter/material.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';

class MyCustomTabBar extends StatelessWidget {
  final List<String> tabs;
  final List<Color> selectedBgColors;
  final List<TextStyle>? selectedTextStyles;
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
        decoration: BoxDecoration(
          border: Border.all(color: tabBarBorderColor),
          borderRadius: BorderRadius.circular(borderRadius ?? 50),
          color: tabBarBackgroundColor ?? Colors.white,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(tabs.length, (index) {
            final isSelected = index == selectedIndex;

            return Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: MyCoButton(
                  isShadowBottomLeft:
                      isSelected ? isShadowBottomLeft ?? false : false,
                  isShadowBottomRight:
                      isSelected ? isShadowBottomRight ?? false : false,
                  isShadowTopLeft:
                      isSelected ? isShadowTopLeft ?? false : false,
                  isShadowTopRight:
                      isSelected ? isShadowTopRight ?? false : false,
                  title: tabs[index],
                  onTap: () => onTabChange?.call(index),
                  backgroundColor:
                      isSelected ? selectedBgColors[index] : Colors.transparent,
                  borderColor:
                      isSelected ? selectedBgColors[index] : Colors.transparent,
                  borderWidth: isSelected ? null : 1.5,
                  boarderRadius: borderRadius ?? 50,
                  textStyle: isSelected
                      ? const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        )
                      : TextStyle(
                          color: selectedBgColors[index],
                          fontWeight: FontWeight.w500,
                        ),
                ),
              ),
            );
          }),
        ),
      );
}
