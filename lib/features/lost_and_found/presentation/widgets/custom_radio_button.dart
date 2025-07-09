import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

class CustomRadioButton extends StatefulWidget {
  final List<String> options;
  final double? height;
  final double? width;
  final ValueChanged<String> onChanged;
  final String? initialValue;
  final String? title;
  final double? titleTextSize;
  final Color? titleTextColor;
  final FontWeight? titleFontWeight;

  const  CustomRadioButton({
    required this.options, required this.onChanged, super.key,
    this.height,
    this.width,
    this.initialValue,
    this.title,
     this.titleTextSize, this.titleTextColor, this.titleFontWeight,
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
            child: CustomText(
              widget.title!,
              fontWeight: FontWeight.w700,
              fontSize: 13 * getResponsive(context),
              color:AppTheme.getColor(context).onSurfaceVariant,

             
            ),
          ),
          // const SizedBox(height: 10),
        ],
        const SizedBox(height: 5),

        Row(
          children: widget.options.map((option) {
            final isSelected = selectedOption == option;
            return Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() => selectedOption = option);
                  widget.onChanged(option);
                },
                child: Container(
                  height: widget.height,
                  width: widget.width,
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                    color: isSelected ? const Color(0xFFE3F2FD) : Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: isSelected
                          ? AppTheme.getColor(context).primary
                          : Colors.grey.shade400,
                      // ignore: avoid_redundant_argument_values
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
                            color: isSelected ? AppTheme.getColor(context).primary : Colors.grey,
                            width: 2,
                          ),
                        ),
                        child: isSelected
                            ? Center(
                                child: Container(
                                  width: 12,
                                  height: 12,
                                  decoration:  BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppTheme.getColor(context).primary,
                                  ),
                                ),
                              )
                            : null,
                      ),
                      const SizedBox(width: 10),
                      CustomText(
                        option,
                        fontSize: widget.titleTextSize ?? 14 * getResponsive(context),
                        fontWeight: widget.titleFontWeight ?? FontWeight.w600,
                        color: widget.titleTextColor ?? (isSelected ? AppTheme.getColor(context).primary : Colors.grey),

                      ),
                    ],
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
}
