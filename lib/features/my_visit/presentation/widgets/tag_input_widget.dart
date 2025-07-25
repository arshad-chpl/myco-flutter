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
  Widget build(BuildContext context) => Container(
      padding: EdgeInsets.symmetric(
        horizontal:  Responsive.getResponsive(context) * 9,
        vertical:  Responsive.getResponsive(context) * 9,
      ),
      margin: EdgeInsets.only(top:  Responsive.getResponsive(context) * 6),
      decoration: BoxDecoration(
        border: Border.all(color: AppTheme.getColor(context).outline),
        borderRadius: BorderRadius.circular( Responsive.getResponsive(context) * 8),
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
                        margin: EdgeInsets.only(right:  Responsive.getResponsive(context) * 6),
                        padding: EdgeInsets.symmetric(
                          horizontal:  Responsive.getResponsive(context) * 9,
                          vertical:  Responsive.getResponsive(context) * 5,
                        ),
                        decoration: BoxDecoration(
                          color: AppTheme.getColor(context).inversePrimary,
                          borderRadius: BorderRadius.circular( Responsive.getResponsive(context) * 10),
                        ),
                        child: Row(
                          children: [
                            Text(
                              tag,
                              style: TextStyle(
                                color: AppTheme.getColor(context).primary,
                                fontSize:  Responsive.getResponsiveText(context) * 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width:  Responsive.getResponsive(context) * 6),
                            Icon(
                              Icons.close,
                              size:  Responsive.getResponsive(context) * 14,
                              color: AppTheme.getColor(context).primary,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  ConstrainedBox(
                    constraints: BoxConstraints(maxWidth:  Responsive.getResponsive(context) * 120),
                    child: TextField(
                      controller: _controller,
                      readOnly: true,
                      maxLines: 1,
                      textAlignVertical: TextAlignVertical.center,
                      style: TextStyle(fontSize:  Responsive.getResponsiveText(context) * 16),
                      decoration: InputDecoration(
                        isDense: true,
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal:  Responsive.getResponsive(context) * 6,
                        ),
                        hintText: tags.isEmpty
                            ? LanguageManager().get(hint)
                            : '',
                        hintStyle: TextStyle(
                          color: AppTheme.getColor(context).outline,
                          fontSize:  Responsive.getResponsiveText(context) * 12,
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
              padding: EdgeInsets.only(left:  Responsive.getResponsive(context) * 6),
              child: SvgPicture.asset(AppAssets.arrow_down , color: AppColors.primary,
                width: 25 * Responsive.getResponsive(context),
                height: 25 * Responsive.getResponsive(context))
            ),
          ),
        ],
      ),
    );
}
