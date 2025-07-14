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
  Widget build(BuildContext context) {
    final double multiplier = Responsive.getResponsiveText(context);

    return SizedBox(
      height: 45 * multiplier,
      child: MyCoTextfield(
        controller: controller,
        focusNode: focusNode,
        hintText: hintText,
        fillColor: Colors.white,
        boarderRadius: 10,
        contentPadding: EdgeInsets.symmetric(vertical: 12 * multiplier),
        prefix: Padding(
          padding: EdgeInsets.only(
            left: 12 * multiplier,
            right: 8 * multiplier,
          ),
          child: Icon(
            CupertinoIcons.search,
            color: AppColors.primary,
            size: 24 * multiplier,
          ),
        ),
        typingtextStyle: TextStyle(fontSize: 14 * multiplier),
        hintTextStyle: TextStyle(
          fontSize: 14 * multiplier,
          color: AppColors.textPrimary,
        ),
        textAlignment: TextAlign.start,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10 * multiplier)),
          borderSide: BorderSide(color: AppTheme.getColor(context).outline),
        ),
      ),
    );
  }
}
