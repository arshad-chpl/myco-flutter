import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';

import 'package:myco_flutter/widgets/custom_text.dart';

import '../../../asset/widgets/custom_appbar.dart';
import '../../../lost_and_found/presentation/widgets/text_field.dart';

class AddDocumentScreen extends StatefulWidget {
  const AddDocumentScreen({super.key});

  @override
  State<AddDocumentScreen> createState() => _AddDocumentScreenState();
}

class _AddDocumentScreenState extends State<AddDocumentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        appBarBackgoundColor: AppTheme.getColor(context).surface,
        elevation: 0,
        title: CustomText(
          'Employee Document',
          fontSize: 20 * Responsive.getResponsiveText(context),
          fontWeight: FontWeight.w700,
          color: AppTheme.getColor(context).onSurface,
        ),
        leading: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 0.020 * Responsive.getWidth(context),
          ),
          child: Icon(
            Icons.arrow_back,
            size: 0.025 * Responsive.getHeight(context),
          ),
        ),
        leadingWidth: 60 * Responsive.getResponsive(context),
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(vertical: 16.0, horizontal: 16.0),
        child: Column(
          children: [
            MyCoTextField(
              isSuffixIconOn: false,
              preFixImage: 'assets/lost_and_found/search-normal.png',
              iconHeight: 30,
              iconWidth: 30,
              hintText: 'Search',
              fillColor: Colors.white,
              color: Colors.white,
              boarderRadius: 12,
            
              height: 44,
            ),
          ],
        ),
      ),
    );
  }
}
