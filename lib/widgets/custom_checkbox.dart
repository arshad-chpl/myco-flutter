import 'package:flutter/material.dart';

class CustomCheckbox extends StatelessWidget {
  final bool value;
  final Function(bool) onChanged;
  final Color borderColor;
  final Color activeColor;
  final Color checkColor;
  final double height;
  final double width;
  final Color unCheckedBackground;

  const CustomCheckbox({
    Key? key,
    required this.value,
    required this.onChanged,
    required this.borderColor,
    required this.activeColor,
    required this.checkColor,
    required this.height,
    required this.width,
    required this.unCheckedBackground,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => GestureDetector(
      onTap: () => onChanged(!value),
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: value ? activeColor : unCheckedBackground,
          border: Border.all(color: borderColor, width: 1),
          borderRadius: BorderRadius.circular(4),
        ),
        child: value
            ? Icon(Icons.check, size: 18, color: checkColor)
            : null,
      ),
    );
}
