import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/language_manager.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/core/theme/colors.dart';

class CustomTagInputField extends StatefulWidget {
  final List<String> tags;
  final String hint;
  final Function(String) onAdd;
  final Function(String) onRemove;
  final Future<void> Function()? onArrowTap;

  const CustomTagInputField({
    required this.tags,
    required this.hint,
    required this.onAdd,
    required this.onRemove,
    required this.onArrowTap,
    Key? key,
  }) : super(key: key);

  @override
  State<CustomTagInputField> createState() => _CustomTagInputFieldState();
}

class _CustomTagInputFieldState extends State<CustomTagInputField> {
  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.getResponsive(context);
    final responsiveText = Responsive.getResponsiveText(context);
    final themeColor = AppTheme.getColor(context);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: responsive * 9, vertical: responsive * 9),
      margin: EdgeInsets.only(top: responsive * 6),
      decoration: BoxDecoration(
        border: Border.all(color: themeColor.outline),
        borderRadius: BorderRadius.circular(responsive * 8),
        color: Colors.white,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Wrap(
              spacing: 4,
              runSpacing: 4,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                ...widget.tags.map(
                      (tag) => Container(
                    padding: EdgeInsets.symmetric(horizontal: responsive * 9),
                    decoration: BoxDecoration(
                      color: themeColor.primary.withAlpha(30),
                      borderRadius: BorderRadius.circular(responsive * 10),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(responsive * 3),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            tag,
                            style: TextStyle(
                              color: themeColor.primary,
                              fontSize: responsiveText * 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: responsive * 9),
                          GestureDetector(
                            onTap: () {
                              widget.onRemove(tag);
                              setState(() {});
                            },
                            child: Icon(
                              Icons.close,
                              size: responsive * 14,
                              color: themeColor.primary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(
                    minWidth: responsive * 14,
                    maxWidth: responsive * 120,
                  ),
                  child: TextField(
                    readOnly: true,
                    onTap: () async {
                      if (widget.onArrowTap != null) {
                        await widget.onArrowTap!();
                      }
                    },
                    onSubmitted: widget.onAdd,
                    onChanged: (val) {
                      if (val.endsWith(',')) {
                        widget.onAdd(val.trim().replaceAll(',', ''));
                      }
                    },
                    maxLines: null,
                    minLines: 1,
                    decoration: InputDecoration(
                      isDense: true,
                      border: InputBorder.none,
                      hintText: widget.tags.isEmpty
                          ? LanguageManager().get(widget.hint)
                          : '',
                      contentPadding: EdgeInsets.symmetric(
                        vertical: responsive * 5,
                        horizontal: responsive * 6,
                      ),
                      hintStyle: TextStyle(
                        color: themeColor.outline,
                        fontSize: responsiveText * 12,
                      ),
                    ),
                    style: TextStyle(
                      fontSize: responsiveText * 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () async {
              if (widget.onArrowTap != null) {
                await widget.onArrowTap!();
              }
            },
            child: Icon(
              Icons.keyboard_arrow_down,
              color: AppColors.primary,
              size: responsiveText * 30,
            ),
          ),
        ],
      ),
    );
  }
}
