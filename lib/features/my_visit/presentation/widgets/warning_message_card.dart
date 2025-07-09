import 'package:flutter/material.dart';
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
      child: const Column(
        children: [
          WarningsAlertsMessages(
            imagePath: 'assets/face_detection/danger.png',
            msg: 'Remove before scanning',
          ),
          SizedBox(height: 13),
          WarningsAlertsMessages(
            imagePath: 'assets/face_detection/circle.png',
            msg: 'Sunglasses',
          ),
          WarningsAlertsMessages(
            imagePath: 'assets/face_detection/circle.png',
            msg: 'Masks',
          ),
          WarningsAlertsMessages(
            imagePath: 'assets/face_detection/circle.png',
            msg: 'Cap/Hat',
          ),
        ],
      ),
    ),
  );
}
