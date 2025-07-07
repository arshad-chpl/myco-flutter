import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/widgets/bottom_sheet.dart';
import 'package:myco_flutter/widgets/common_card.dart';
import 'package:myco_flutter/widgets/horizontal_border.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

class VisitReport extends StatelessWidget {
  const VisitReport({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        title: CustomText('Visit Report', fontWeight: FontWeight.w700),
      ),
      body: ListView.builder(
        itemCount: 2,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: CommonCard(
              showBlackShadowInChild: true,
              title: '05 June 2025',
              suffixIcon: InkWell(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => TestNewVisit(),
                  );
                },
                child: SvgPicture.asset('assets/visit_svgs/arrow-down.svg'),
              ),
              bottomWidget: Padding(
                padding: const EdgeInsets.all(12.0),
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
                        SizedBox(height: 0.001 * Responsive.getHeight(context)),
                        CustomText(
                          'Submitted on:05 Jun 2025 10:20 AM',
                          fontSize: 14 * Responsive.getResponsiveText(context),
                          fontWeight: FontWeight.w500,
                        ),
                        SizedBox(height: 0.008 * Responsive.getHeight(context)),
                        HorizontalDashedLine(
                          width: double.maxFinite,
                          thickness: 2,
                          color: AppTheme.getColor(context).outline,
                        ),

                        SizedBox(
                          height: 0.0055 * Responsive.getHeight(context),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            CustomText(
                              'Download Report',
                              fontSize:
                                  12 * Responsive.getResponsiveText(context),
                              color: AppTheme.getColor(context).secondary,
                              decoration: TextDecoration.underline,
                              fontWeight: FontWeight.w700,
                              decorationColor: AppTheme.getColor(
                                context,
                              ).secondary,
                            ),
                          ],
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
