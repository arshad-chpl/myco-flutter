import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:myco_flutter/core/utils/responsive.dart';

class FabButtonModel {
  final String label;
  final IconData? icon;
  final String? imagePath;
  final VoidCallback onTap;
  final Color backgroundColor;
  final Color labelColor;

  FabButtonModel({
    required this.label,
    required this.onTap,
    this.icon,
    this.imagePath,
    this.backgroundColor = Colors.white,
    this.labelColor = const Color(0xFF2F5D83),
  });
}

class CustomFabMenu extends StatefulWidget {
  final List<FabButtonModel> buttons;
  final IconData mainIcon;
  final IconData activeIcon;
  final Color fabBackgroundColor;
  final Color fabForegroundColor;

  const CustomFabMenu({
    super.key,
    required this.buttons,
    this.mainIcon = Icons.add,
    this.activeIcon = Icons.close,
    this.fabBackgroundColor = const Color(0xFF2F5D83),
    this.fabForegroundColor = Colors.white,
  });

  @override
  State<CustomFabMenu> createState() => _CustomFabMenuState();
}

class _CustomFabMenuState extends State<CustomFabMenu> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) => SpeedDial(
    icon: widget.mainIcon,

    activeIcon: widget.activeIcon,
    backgroundColor: widget.fabBackgroundColor,
    foregroundColor: widget.fabForegroundColor,
    overlayColor: Colors.black,
    overlayOpacity: 0.5,
    spacing: 0,
    spaceBetweenChildren: 0,
    childrenButtonSize: Size(
      0.09 * Responsive.getWidth(context),
      0.09 * Responsive.getHeight(context),
    ),
    elevation: 4.0,
    animationCurve: Curves.easeInOut,
    children: widget.buttons
        .map(
          (button) => SpeedDialChild(
            child: button.imagePath != null
                ? ClipOval(
                    child: Image.asset(
                      button.imagePath!,
                      width: 0.04 * Responsive.getWidth(context),
                      height: 0.04 * Responsive.getHeight(context),
                      fit: BoxFit.contain,
                    ),
                  )
                : Icon(
                    button.icon,
                    color: button.labelColor,
                    size: 0.02 * Responsive.getHeight(context),
                  ),
            label: button.label,
            labelBackgroundColor: button.backgroundColor,
            shape: const CircleBorder(),
            labelStyle: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: button.labelColor,
            ),
            backgroundColor: button.backgroundColor,
            onTap: button.onTap,
          ),
        )
        .toList(),
  );
}
