import 'package:flutter/material.dart';
import 'package:myco_flutter/constants/app_assets.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/asset/widgets/custom_tab_bar.dart';
import 'package:myco_flutter/features/idea_box/presentation/widgets/common_container.dart';
import 'package:myco_flutter/widgets/custom_appbar.dart';
import 'package:myco_flutter/widgets/custom_searchfield.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

class AppointmentsPage extends StatefulWidget {
  const AppointmentsPage({super.key});

  @override
  State<AppointmentsPage> createState() => _AppointmentsPageState();
}

class _AppointmentsPageState extends State<AppointmentsPage> {

  List<String> appointments = ['Requests', 'My Appointments'];

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: const CustomAppbar(
        title: 'Appointments',
      ),
      body: Padding(
        padding: EdgeInsets.all(13 * Responsive.getResponsive(context)),
        child: Column(
          children: [
            MyCustomTabBar(
                tabs: appointments,
                selectedBgColor: AppTheme.getColor(context).primary,
                unselectedBorderAndTextColor: AppTheme.getColor(context).secondary,
                tabBarBorderColor: AppTheme.getColor(context).primary,
            ),
            SizedBox(height: 21 * Responsive.getResponsive(context),),
            const CustomSearchField(
              hintText: 'Search',
            ),
            SizedBox(height: 17 * Responsive.getResponsive(context),),
            CommonCard(
                title: '05:14 PM, 18th Jun 2025',
                headerPrefixIcon: AppAssets.calendar,
                showHeaderPrefixIcon: true,
                bottomWidget: Padding(
                  padding: EdgeInsets.all(10 * Responsive.getResponsive(context)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                          'Appointment Request By',
                        fontSize: 10,
                        color: AppTheme.getColor(context).primary,
                        fontWeight: FontWeight.w600,
                      )
                    ],
                  ),
                )
            )

          ],
        ),
      ),
    );
}
