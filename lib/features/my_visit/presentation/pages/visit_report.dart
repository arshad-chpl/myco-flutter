import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myco_flutter/constants/app_assets.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/visits/presentation/pages/visit_report_bottom_sheet.dart';
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
        title: CustomText(
          'Visit Report',
          fontWeight: FontWeight.w700,
          fontSize: 18 * getResponsiveText(context),
        ),
      ),

      body: ListView.builder(
        itemCount: 2,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(
              left: 32 * getResponsive(context),
              right: 32 * getResponsive(context),
              bottom: 16 * getResponsive(context),
            ),

            //Common card
            child: CommonCard(
              showBlackShadowInChild: true,
              title: '05 June 2025',
              suffixIcon: InkWell(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(10 * getResponsive(context)),
                      ),
                    ),
                    builder: (context) => TestNewVisit(),
                  );
                },
                child: SvgPicture.asset(AppAssets.arrow),
              ),

              bottomWidget: Padding(
                padding: EdgeInsets.all(12 * getResponsive(context)),

                //Card child
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          'Test New Visit',
                          fontSize: 16 * getResponsiveText(context),
                          fontWeight: FontWeight.w700,
                        ),
                        SizedBox(height: 0.001 * getHeight(context)),
                        CustomText(
                          'Submitted on:05 Jun 2025 10:20 AM',
                          fontSize: 14 * getResponsiveText(context),
                          fontWeight: FontWeight.w500,
                        ),
                        SizedBox(height: 0.008 * getHeight(context)),

                        //Horizontal dashed line
                        HorizontalDashedLine(
                          width: double.maxFinite,
                          thickness: 2,
                          color: AppTheme.getColor(context).outline,
                        ),

                        SizedBox(height: 0.005 * getHeight(context)),

                        //Download report
                        Align(
                          alignment: Alignment.bottomRight,
                          child: CustomText(
                            'Download Report',
                            fontSize: 12 * getResponsiveText(context),
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
