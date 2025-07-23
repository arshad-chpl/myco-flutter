import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myco_flutter/constants/app_assets.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/core/utils/util.dart';
import 'package:myco_flutter/features/dashboard/presentation/widgets/timer_and_slider.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

class DashboardAppBar extends StatelessWidget {
  const DashboardAppBar({super.key});

  @override
  Widget build(BuildContext context) => Row(
    spacing: 9,
    children: [
      // TODO: Add NetworkImage for profile picture
      InkWell(
        onTap: () {
          context.pushNamed("my-profile");
        },
        child: CircleAvatar(
          radius: 22 * Responsive.getDashboardResponsiveText(context),
          backgroundImage: const NetworkImage(
            'https://plus.unsplash.com/premium_photo-1690407617542-2f210cf20d7e?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cGVyc29ufGVufDB8fDB8fHww',
          ),
        ),
      ),

      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              children: [
                WidgetSpan(
                  child: CustomText(
                    'Person Name',
                    fontWeight: FontWeight.w700,
                    fontSize:
                        14 * Responsive.getDashboardResponsiveText(context),
                  ),
                ),
                const WidgetSpan(child: SizedBox(width: 10)),
                WidgetSpan(child: Image.asset(AppAssets.verified)),
              ],
            ),
          ),

          CustomText(
            'Designation',
            fontWeight: FontWeight.w600,
            fontSize: 12 * Responsive.getDashboardResponsiveText(context),
            color: AppColors.spanishYellow,
          ),
          LiveClock(
            isAppBar: true,
            fontSize: 10 * Responsive.getDashboardResponsiveText(context),
          ),

          // CustomText(
          //   'date and time now',
          //   fontWeight: FontWeight.w500,
          //   fontSize: 10,
          //   color: AppTheme.getColor(context).onSurfaceVariant,
          // ),
        ],
      ),

      // TODO: Add a button for notifications and search
      const Spacer(),
      Container(
        decoration: BoxDecoration(
          color: Util.applyOpacity(AppColors.myCoCyan, 0.1),

          shape: BoxShape.circle,
        ),
        height: 40,
        width: 40,
        alignment: Alignment.center,
        child: Image.asset(AppAssets.search),
      ),
      Container(
        decoration: BoxDecoration(
          color: Util.applyOpacity(AppColors.myCoCyan, 0.1),

          shape: BoxShape.circle,
        ),
        height: 40,
        width: 40,
        alignment: Alignment.center,
        child: Image.asset(AppAssets.notification),
      ),
      // Container(child: Image.asset('assets/dashboard/notification.png')),
    ],
  );
}
