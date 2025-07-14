import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myco_flutter/constants/app_assets.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/visits/presentation/widgets/end_remark.dart';
import 'package:myco_flutter/features/visits/presentation/widgets/person_details.dart';
import 'package:myco_flutter/features/visits/presentation/widgets/share_btn_row.dart';
import 'package:myco_flutter/features/visits/presentation/widgets/start_end_time.dart';
import 'package:myco_flutter/features/visits/presentation/widgets/visit_btn_row.dart';
import 'package:myco_flutter/widgets/common_card.dart';
import 'package:myco_flutter/widgets/custom_appbar.dart';
import 'package:myco_flutter/widgets/custom_text.dart';
import 'package:myco_flutter/widgets/custom_table.dart';

//Visit Details page
class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
    //Custom App Bar
    appBar: CustomAppbar(
      leading: BackButton(),
      title: CustomText(
        'Visit Details',
        fontWeight: FontWeight.w700,
        fontSize: 18 * getResponsiveText(context),
      ),
    ),
    body: Padding(
      padding: EdgeInsets.only(
        left: 31 * getResponsive(context),
        right: 32 * getResponsive(context),
      ),
      child: SingleChildScrollView(
        //Common card
        child: CommonCard(
          showBlackShadowInChild: true,
          headerColor: AppTheme.getColor(context).primary,
          title: 'Mahakali Tractor',
          subTitleIcon: SvgPicture.asset(AppAssets.calendar),
          subTitle: '01st April 2025 (09:45am) to 01st April 2025(12:48pm)',

          //bottomWidget of common card
          bottomWidget: Padding(
            padding: EdgeInsets.all(12 * getResponsive(context)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 0.01 * getWidth(context),
                    vertical: 0.002 * getHeight(context),
                  ),

                  //card children
                  child: Column(
                    children: [
                      //person details widget
                      PersonDetails(),
                      SizedBox(height: 0.016 * getHeight(context)),
                      Divider(color: AppTheme.getColor(context).primary),
                      SizedBox(height: 0.012 * getHeight(context)),

                      //start_end_visit_time
                      StartEndTime(),
                      SizedBox(height: 0.012 * getHeight(context)),
                      Divider(color: AppTheme.getColor(context).primary),
                      SizedBox(height: 0.004 * getHeight(context)),

                      //End_remark status
                      EndRemark(),
                    ],
                  ),
                ),
                SizedBox(height: 0.005 * getHeight(context)),

                Padding(
                  padding: EdgeInsets.only(left: 0.013 * getWidth(context)),
                  child: Row(
                    children: [
                      CustomText(
                        'Visit With',
                        fontSize: 17 * getResponsiveText(context),
                        fontWeight: FontWeight.w600,
                      ),
                      SizedBox(width: 0.015 * getWidth(context)),
                      CustomText(
                        ':',
                        fontSize: 17 * getResponsiveText(context),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 0.005 * getHeight(context)),

                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 7 * getResponsive(context),
                  ),
                  child: Column(
                    children: [
                      //visit_with person Custom Table
                      CustomTableWidget(
                        name: 'Yash Soni',
                        designation: '(UI UX)',
                      ),
                      SizedBox(height: 0.012 * getHeight(context)),

                      //visit_complete and view_attachment row
                      VisitBtnRow(),
                      SizedBox(height: 0.012 * getHeight(context)),

                      //share and view report button row
                      ShareBtn(),
                      SizedBox(height: 0.040 * getHeight(context)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
