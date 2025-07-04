import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/responsive.dart';

class CustomDropdownMenu<T> extends StatelessWidget {
  final double widthFactor;
  final String hintText;
  final T? initialSelection;
  final List<DropdownMenuEntry<T>> dropdownItems;
  final Widget leadingIcon;
  final String trailingPngAsset;
  final void Function(T?)? onSelected;

  const CustomDropdownMenu({
    super.key,
    required this.widthFactor,
    required this.hintText,
    required this.initialSelection,
    required this.dropdownItems,
    required this.leadingIcon,
    required this.trailingPngAsset,
    this.onSelected,
  });

  @override
  Widget build(BuildContext context) => Theme(
      data: Theme.of(context).copyWith(
        // Override the default dropdown arrow icon globally for this widget
        inputDecorationTheme: const InputDecorationTheme(
          suffixIconColor: Colors.transparent, // hides arrow space too
        ),
      ),
      child: Stack(
        alignment: Alignment.centerRight,
        children: [
          DropdownMenu<T>(
            width: widthFactor * getWidth(context),
            hintText: hintText,
            initialSelection: initialSelection,
            onSelected: onSelected,
            textStyle: TextStyle(color: AppTheme.getColor(context).outline),
            leadingIcon: leadingIcon,
            trailingIcon: const SizedBox.shrink(), // hide default arrow
            inputDecorationTheme: const InputDecorationTheme(
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
            ),
            dropdownMenuEntries: dropdownItems,
          ),
          // Custom trailing PNG
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: Image.asset(
              trailingPngAsset,
              height: 16,
              width: 16,
            ),
          ),
        ],
      ),
    );
}
