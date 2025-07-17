import 'package:flutter/cupertino.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

class WarningsAlertsMessages extends StatelessWidget {
  final String imagePath;
  final String msg;

  const WarningsAlertsMessages({
    required this.imagePath,
    required this.msg,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Row(
    children: [
      Image(
        image: AssetImage(imagePath),
        height: 0.023 * Responsive.getHeight(context),
        width: 0.023 * Responsive.getHeight(context),
        color: AppTheme.getColor(context).onSurface,
      ),
      SizedBox(width: 0.013 * Responsive.getWidth(context)),
      CustomText(
        msg,
        // isKey: true,
        fontWeight: FontWeight.w600,
      ),
    ],
  );
}
