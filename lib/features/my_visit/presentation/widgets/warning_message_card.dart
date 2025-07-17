import 'package:flutter/material.dart';
import 'package:myco_flutter/constants/app_assets.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/my_visit/presentation/widgets/warnings_alerts_messages.dart';
import 'package:myco_flutter/widgets/border_container_wraper.dart';

class WarningMessageCard extends StatelessWidget {
  const WarningMessageCard({super.key});

  @override
  Widget build(BuildContext context) => BorderContainerWraper(
    width: double.infinity,
    child: Padding(
      padding: EdgeInsets.all(8.0 * Responsive.getResponsive(context)),
      child: Column(
        children: [
          const WarningsAlertsMessages(
            imagePath: AppAssets.assetsDanger,
            msg: 'Remove before scanning',
          ),
          SizedBox(height: 0.013 * Responsive.getHeight(context)),
          const WarningsAlertsMessages(
            imagePath: AppAssets.assetCircle,
            msg: 'Sunglasses',
          ),
          const WarningsAlertsMessages(
            imagePath: AppAssets.assetCircle,
            msg: 'Masks',
          ),
          const WarningsAlertsMessages(
            imagePath: AppAssets.assetCircle,
            msg: 'Cap/Hat',
          ),
        ],
      ),
    ),
  );
}
