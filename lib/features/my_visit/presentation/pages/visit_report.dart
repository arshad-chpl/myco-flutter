import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myco_flutter/constants/app_assets.dart';
import 'package:myco_flutter/constants/constants.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/language_manager.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/my_visit/presentation/widgets/bottom_sheet_test_new_visit.dart';
import 'package:myco_flutter/widgets/common_card.dart';
import 'package:myco_flutter/widgets/custom_appbar.dart';
import 'package:myco_flutter/widgets/horizontal_border.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

//Visit Report page
class VisitReport extends StatelessWidget {
  const VisitReport({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Custom app bar
      appBar: CustomAppbar(
        leading: BackButton(),
        title: LanguageManager().get('visit_report'),
      ),

      body: ListView.builder(
        itemCount: 2,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: VariableBag.commonCardHorizontalPadding,
              vertical: VariableBag.commonCardVerticalPadding,
            ),

            //Common card
            child: CommonCard(
              borderRadius: VariableBag.commonCardBorderRadius,
              showBlackShadowInChild: true,
              title: '05 June 2025',
              suffixIcon: InkWell(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(
                          VariableBag.bottomSheetBorderRadius *
                              Responsive.getResponsive(context),
                        ),
                      ),
                    ),
                    builder: (context) => TestNewVisit(),
                  );
                },
                child: SvgPicture.asset(AppAssets.arrowRight),
              ),

              bottomWidget: Padding(
                padding: EdgeInsets.all(12 * Responsive.getResponsive(context)),

                //Card child
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          'Test New Visit',
                          fontSize: 16 * Responsive.getResponsiveText(context),
                          fontWeight: FontWeight.w700,
                        ),
                        // SizedBox(height: 0.001 * Responsive.getHeight(context)),
                        CustomText(
                          'Submitted on:05 Jun 2025 10:20 AM',
                          fontSize: 14 * Responsive.getResponsiveText(context),
                          fontWeight: FontWeight.w500,
                        ),
                        SizedBox(height: 0.012 * Responsive.getHeight(context)),

                        //Horizontal dashed line
                        HorizontalDashedLine(
                          width: double.maxFinite,
                          thickness: 2,
                          color: AppTheme.getColor(context).outline,
                        ),

                        SizedBox(height: 0.005 * Responsive.getHeight(context)),

                        //Download report
                        Align(
                          alignment: Alignment.bottomRight,
                          child: CustomText(
                            LanguageManager().get('download_report'),
                            fontSize:
                            12 * Responsive.getResponsiveText(context),
                            color: AppTheme.getColor(context).secondary,
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.w700,
                            decorationColor: AppTheme.getColor(
                              context,
                            ).secondary,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}