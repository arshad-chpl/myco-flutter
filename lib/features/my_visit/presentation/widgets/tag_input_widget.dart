import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myco_flutter/constants/app_assets.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/language_manager.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/core/theme/colors.dart';

class CustomTagInputField extends StatelessWidget {
  final List<String> tags;
  final String hint;
  final Function(String) onAdd;
  final Function(String) onRemove;
  final Future<void> Function()? onArrowTap;

   CustomTagInputField({
    required this.tags,
    required this.hint,
    required this.onAdd,
    required this.onRemove,
    required this.onArrowTap,
    Key? key,
  }) : super(key: key);

  final TextEditingController _controller = TextEditingController();

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.getResponsive(context);
    final responsiveText = Responsive.getResponsiveText(context);
    final themeColor = AppTheme.getColor(context);

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: responsive * 9,
        vertical: responsive * 9,
      ),
      margin: EdgeInsets.only(top: responsive * 6),
      decoration: BoxDecoration(
        border: Border.all(color: themeColor.outline),
        borderRadius: BorderRadius.circular(responsive * 8),
        color: Colors.white,
      ),
      child: Row(
        children: [
          // Tag container
          Expanded(
            child: SingleChildScrollView(
              controller: _scrollController,
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ...tags.map(
                    (tag) => InkWell(
                      onTap: () {
                        onRemove(tag);
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: responsive * 6),
                        padding: EdgeInsets.symmetric(
                          horizontal: responsive * 9,
                          vertical: responsive * 5,
                        ),
                        decoration: BoxDecoration(
                          color: themeColor.primary.withAlpha(30),
                          borderRadius: BorderRadius.circular(responsive * 10),
                        ),
                        child: Row(
                          children: [
                            Text(
                              tag,
                              style: TextStyle(
                                color: themeColor.primary,
                                fontSize: responsiveText * 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: responsive * 6),
                            Icon(
                              Icons.close,
                              size: responsive * 14,
                              color: themeColor.primary,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: responsive * 120),
                    child: TextField(
                      controller: _controller,
                      readOnly: true,
                      maxLines: 1,
                      textAlignVertical: TextAlignVertical.center,
                      style: TextStyle(fontSize: responsiveText * 16),
                      decoration: InputDecoration(
                        isDense: true,
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: responsive * 6,
                        ),
                        hintText: tags.isEmpty
                            ? LanguageManager().get(hint)
                            : '',
                        hintStyle: TextStyle(
                          color: themeColor.outline,
                          fontSize: responsiveText * 12,
                        ),
                      ),
                      onTap: () async {
                        if (onArrowTap != null) {
                          await onArrowTap!();
                        }
                      },
                      onSubmitted: onAdd,
                      onChanged: (val) {
                        if (val.endsWith(',')) {
                          onAdd(val.trim().replaceAll(',', ''));
                          _controller.clear();
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Arrow button
          GestureDetector(
            onTap: () async {
              if (onArrowTap != null) {
                await onArrowTap!();
              }
            },
            child: Padding(
              padding: EdgeInsets.only(left: responsive * 6),
              child: SvgPicture.asset(AppAssets.arrow_down , color: AppColors.primary,
                width: 25 * Responsive.getResponsive(context),
                height: 25 * Responsive.getResponsive(context))
            ),
          ),
        ],
      ),
    );
  }
}
