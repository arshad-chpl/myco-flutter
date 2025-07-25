import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:myco_flutter/constants/app_assets.dart';
import 'package:myco_flutter/constants/constants.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/language_manager.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/lost_and_found/presentation/widgets/custom_image_picker_container/dashed_border_container.dart';

import 'package:myco_flutter/widgets/custom_label_textfield.dart';
import 'package:myco_flutter/widgets/custom_text.dart';
import 'package:myco_flutter/widgets/custom_text_field_new.dart';

//Bottom sheet for show visit report content
// class TestNewVisit extends StatefulWidget {
//   const TestNewVisit({super.key});
//
//   @override
//   State<TestNewVisit> createState() => _TestNewVisitState();
// }

class TestNewVisit extends StatefulWidget {
  const TestNewVisit({super.key});

  @override
  State<TestNewVisit> createState() => _TestNewVisitState();
}

class _TestNewVisitState extends State<TestNewVisit> {
  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(
          left:
              VariableBag.bottomSheetLeftPadding *
              Responsive.getResponsive(context),
          right:
              VariableBag.bottomSheetRightPadding *
              Responsive.getResponsive(context),
          top:
              VariableBag.bottomSheetTopPadding *
              Responsive.getResponsive(context),
          bottom: bottomInset > 0
              ? bottomInset + 30
              : VariableBag.bottomSheetBottomPadding *
                    Responsive.getResponsive(context),
        ),
        child: SingleChildScrollView(
          reverse: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ///Test New Visit Header
                  CustomText(
                    'Test New Visit',
                    fontWeight: FontWeight.w600,
                    fontSize: 17 * Responsive.getResponsiveText(context),
                  ),
                  InkWell(
                    onTap: () => context.pop(),
                    child: SvgPicture.asset(
                      AppAssets.arrowDoubleDown,
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 0.031 * Responsive.getHeight(context)),

              /// Branch field
              NewTextField(
                label: 'Branch',
                hintText: 'Sales',
                prefixIconPath: AppAssets.assetData,
              ),
              SizedBox(height: 0.018 * Responsive.getHeight(context)),

              ///Media Container
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    'Media',
                    fontSize: 14 * Responsive.getResponsiveText(context),
                    fontWeight: FontWeight.w700,
                    color: AppTheme.getColor(context).onSurfaceVariant,
                  ),
                  SizedBox(height: 4 * Responsive.getResponsive(context)),
                  DesignBorderContainer(
                    borderRadius: 12 * Responsive.getResponsive(context),
                    height: 0.088 * Responsive.getHeight(context),
                    width: 0.21 * Responsive.getWidth(context),
                    borderColor: AppTheme.getColor(context).primary,
                    backgroundColor: AppTheme.getColor(
                      context,
                    ).surfaceContainer,
                    padding: EdgeInsets.all(
                      6 * Responsive.getResponsive(context),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 0.047 * Responsive.getHeight(context),
                          width: 0.17 * Responsive.getWidth(context),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              8 * Responsive.getResponsive(context),
                            ),
                            color: AppColors.gray10,
                          ),
                        ),
                        SizedBox(height: 0.005 * Responsive.getHeight(context)),
                        CustomText(
                          "yash.jpg",
                          fontSize: 10,
                          color: Theme.of(context).brightness == Brightness.dark
                              ? AppTheme.getColor(context).surface
                              : AppTheme.getColor(context).onSurface,
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              SizedBox(height: 0.031 * Responsive.getHeight(context)),

              /// Today work field
              NewTextField(
                label: 'Today Work',
                hintText: 'SalesNVISWINDO',
                prefixIconPath: AppAssets.assetDocumentText,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
