import 'package:flutter/material.dart';
import 'package:myco_flutter/constants/app_assets.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/core/utils/util.dart';

class DashboardAppBar extends StatelessWidget {
  const DashboardAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    // return CustomPaint(painter: RPSCustomPainter());
    return Container(
      child: Row(
        spacing: 9,
        children: [
          // TODO: Add NetworkImage for profile picture
          CircleAvatar(
            radius: 55 * getResponsiveOnWidth(context),
            backgroundImage: NetworkImage(
              'https://plus.unsplash.com/premium_photo-1690407617542-2f210cf20d7e?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cGVyc29ufGVufDB8fDB8fHww',
            ),
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  text: 'Person Name',
                  style: AppTheme.getTextStyle(context).titleLarge,
                  children: [
                    WidgetSpan(child: Image.asset(AppAssets.verified)),
                  ],
                ),
              ),
              // Text('Person Name'),
              Text(
                'Designation',
                style: TextTheme.of(
                  context,
                ).bodyLarge?.copyWith(color: AppColors.spanishYellow),
              ),
              Text(
                'date and time now',
                style: AppTheme.getTextStyle(context).bodySmall,
              ),
            ],
          ),

          // TODO: Add a button for notifications and search
          Spacer(),
          Container(
            decoration: BoxDecoration(
              color: Util.instance.applyOpacity(AppColors.myCoCyan, 0.1),

              shape: BoxShape.circle,
            ),
            height: 40,
            width: 40,
            alignment: Alignment.center,
            child: Image.asset(AppAssets.search),
          ),
          Container(
            decoration: BoxDecoration(
              color: Util.instance.applyOpacity(AppColors.myCoCyan, 0.1),

              shape: BoxShape.circle,
            ),
            height: 40,
            width: 40,
            alignment: Alignment.center,
            child: Image.asset(AppAssets.notification),
          ),
          // Container(child: Image.asset('assets/dashboard/notification.png')),
        ],
      ),
    );
  }
}
