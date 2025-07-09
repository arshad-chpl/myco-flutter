import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/core/theme/colors.dart';

class TagInputField extends StatefulWidget {
  final List<String> tags;
  final String hint;
  final Function(String) onAdd;
  final Function(String) onRemove;
  final Future<void> Function()? onarrowbtn;

  const TagInputField({
    required this.tags,
    required this.hint,
    required this.onAdd,
    required this.onRemove,
    required this.onarrowbtn,
    Key? key,
  }) : super(key: key);

  @override
  State<TagInputField> createState() => _TagInputFieldState();
}

class _TagInputFieldState extends State<TagInputField> {
  @override
  Widget build(BuildContext context) {
    double multiplier = Responsive.getResponsiveText(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      margin: const EdgeInsets.only(top: 6),
      decoration: BoxDecoration(
        border: Border.all(color:  AppTheme.getColor(context).outline),
        borderRadius: BorderRadius.circular(
          Responsive.getResponsive(context) * 8,
        ),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Wrap(
              alignment: WrapAlignment.start,
              spacing: 3,
              runSpacing: 4,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                ...widget.tags.map(
                  (tag) => Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        color: AppTheme.getColor(context).primary.withAlpha(30),
                        borderRadius: BorderRadius.circular(
                          Responsive.getResponsive(context) * 10,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              tag,
                              style: TextStyle(
                                color: AppTheme.getColor(context).primary,
                                fontSize:
                                    Responsive.getResponsiveText(context) * 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 8),
                            GestureDetector(
                              onTap: () {
                                widget.onRemove(tag);
                                setState(() {});
                              },
                              child: Icon(
                                Icons.close,
                                size: Responsive.getResponsiveText(context) * 14,
                                color: AppTheme.getColor(context).primary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                ConstrainedBox(
                  constraints: const BoxConstraints(
                    minWidth: 50,
                    maxWidth: 120,
                  ),
                  child: TextField(
                    readOnly: true,
                    onTap: () async {
                      if (widget.onarrowbtn != null) {
                        await widget.onarrowbtn!();
                      }
                    },
                    onSubmitted: widget.onAdd,
                    onChanged: (val) {
                      if (val.endsWith(',')) {
                        widget.onAdd(val);
                      }
                    },
                    maxLines: null,
                    minLines: 1,
                    decoration: InputDecoration(
                      isDense: true,
                      border: InputBorder.none,
                      hintText: widget.tags.isEmpty ? widget.hint : '',
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 6,
                      ),
                      hintStyle: TextStyle(
                        color: AppTheme.getColor(context).outline,
                        fontSize: Responsive.getResponsiveText(context) * 12,
                      ),
                    ),
                    style: TextStyle(
                      fontSize: Responsive.getResponsiveText(context) * 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            child: Icon(
              Icons.keyboard_arrow_down,
              color: AppColors.primary,
              size: Responsive.getResponsiveText(context) * 30,
            ),
            onTap: () async {
              if (widget.onarrowbtn != null) {
                await widget.onarrowbtn!();
              }
            },
          ),
        ],
      ),
    );
  }
}
