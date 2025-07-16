import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/responsive.dart';

class CustomRadioButton extends StatefulWidget {
  final List<String> options;
  final double? height;
  final double? width;
  final ValueChanged<String> onChanged;
  final String? initialValue;
  final String? title;

  const CustomRadioButton({
    super.key,
    required this.options,
    this.height,
    this.width,
    required this.onChanged,
    this.initialValue,
    this.title,
  });

  @override
  State<CustomRadioButton> createState() => _CustomRadioButtonState();
}

class _CustomRadioButtonState extends State<CustomRadioButton> {
  late String selectedOption;

  @override
  void initState() {
    super.initState();
    selectedOption = widget.initialValue ?? widget.options.first;
  }

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      if (widget.title != null) ...[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Text(
            widget.title!,
            style: TextStyle(
              fontFamily: "Gilroy-Bold",
              fontWeight: FontWeight.w400,
              color: AppTheme.getColor(context).onSurfaceVariant,
              fontSize: 13,
            ),
          ),
        ),
      ],
      const SizedBox(height: 5),
      Row(
        children: widget.options.map((option) {
          final isSelected = selectedOption == option;
          return Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: GestureDetector(
                onTap: () {
                  setState(() => selectedOption = option);
                  widget.onChanged(option);
                },
                child: Container(
                  height: widget.height,
                  width: widget.width,
                  decoration: BoxDecoration(
                    color: isSelected ? const Color(0xFFE3F2FD) : Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: isSelected
                          ? AppTheme.getColor(context).primary
                          : Colors.grey.shade400,
                      width: 1,
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    children: [
                      Container(
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: isSelected
                                ? AppTheme.getColor(context).primary
                                : Colors.grey,
                            width: 2,
                          ),
                        ),
                        child: isSelected
                            ? Center(
                          child: Container(
                            width: 12,
                            height: 12,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppTheme.getColor(context).primary,
                            ),
                          ),
                        )
                            : null,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        option,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontFamily: "Gilroy-SemiBold",
                          color: isSelected
                              ? AppTheme.getColor(context).primary
                              : Colors.grey,
                          fontSize: 14 * Responsive.getResponsiveText(context),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    ],
  );
}
