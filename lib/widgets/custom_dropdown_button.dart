import 'package:flutter/material.dart';

class CustomPopupDropdownStyled<T> extends StatelessWidget {
  final List<T> items;
  final T? selectedItem;
  final String Function(T) itemToString;
  final String? hintText;
  final void Function(T?, int)? onChanged;
  final double? width;
  final double? height;

  const CustomPopupDropdownStyled({
    super.key,
    required this.items,
    this.selectedItem,
    required this.itemToString,
    this.hintText,
    this.onChanged,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final popupTheme = theme.popupMenuTheme;
    final textTheme = theme.textTheme;
    final primaryColor = theme.colorScheme.primary;
    final secondaryColor = theme.colorScheme.secondary;

    return SizedBox(
      width: width ?? 200,
      height: height ?? 50,
      child: PopupMenuButton<T>(
        itemBuilder: (context) => items.asMap().entries.map((entry) {
          final index = entry.key;
          final item = entry.value;
          return PopupMenuItem<T>(
            value: item,
            child: Text(
              itemToString(item),
              style: textTheme.bodyMedium?.copyWith(color: primaryColor),
            ),
          );
        }).toList(),
        onSelected: (value) {
          final index = items.indexOf(value);
          onChanged?.call(value, index);
        },
        color: popupTheme.color ?? Colors.white,
        elevation: popupTheme.elevation ?? 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(color: primaryColor, width: 1.5),
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          decoration: BoxDecoration(
            color: theme.inputDecorationTheme.fillColor ?? Colors.white,
            borderRadius:
                (theme.inputDecorationTheme.border as OutlineInputBorder?)
                    ?.borderRadius ??
                BorderRadius.circular(8),
            border: Border.all(color: primaryColor, width: 1.5),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  selectedItem != null
                      ? itemToString(selectedItem as T)
                      : hintText ?? 'Select',
                  style: selectedItem != null
                      ? textTheme.bodyMedium?.copyWith(color: primaryColor)
                      : textTheme.bodyMedium?.copyWith(color: primaryColor),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Icon(Icons.arrow_drop_down, color: primaryColor, size: 30),
            ],
          ),
        ),
      ),
    );
  }
}
