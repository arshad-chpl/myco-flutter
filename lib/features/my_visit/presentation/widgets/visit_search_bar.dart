import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/widgets/custom_text_field.dart';

class VisitSearchBar extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final String hintText;

  const VisitSearchBar({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) => SizedBox(
      height: 45 * Responsive.getResponsiveText(context),
      child: MyCoTextfield(
        controller: controller,
        focusNode: focusNode,
        hintText: hintText,
        fillColor: Colors.white,
        boarderRadius: 10,
        contentPadding: EdgeInsets.symmetric(vertical: 12 * Responsive.getResponsiveText(context)),
        prefix: Padding(
          padding: EdgeInsets.only(
            left: 12 * Responsive.getResponsiveText(context),
            right: 8 * Responsive.getResponsiveText(context),
          ),
          child: Icon(
            CupertinoIcons.search,
            color: AppColors.primary,
            size: 24 * Responsive.getResponsiveText(context),
          ),
        ),
        typingtextStyle: TextStyle(fontSize: 14 * Responsive.getResponsiveText(context)),
        hintTextStyle: TextStyle(
          fontSize: 14 * Responsive.getResponsiveText(context),
          color: AppColors.textPrimary,
        ),
        textAlignment: TextAlign.start,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10 * Responsive.getResponsiveText(context))),
          borderSide: BorderSide(color: AppTheme.getColor(context).outline),
        ),
      ),
    );
}
