import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myco_flutter/constants/app_assets.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/my_visit/presentation/pages/reschedule_visit_page.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

class RescheduleAndIconsRow extends StatelessWidget {
  final BuildContext context;
  final Map<String, dynamic> visit;

  const RescheduleAndIconsRow({
    super.key,
    required this.context,
    required this.visit,
  });

  @override
  Widget build(BuildContext context) => Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const RescheduleVisitPage()),
          ),
          child: CustomText(
            'Reschedule Visit?',
            isKey: true,
            fontWeight: FontWeight.w600,
            fontSize: 14 * Responsive.getResponsiveText(context),
            color: AppTheme.getColor(context).primary,
            decoration: TextDecoration.underline,
          ),
        ),
        Row(
          children: [
            if (visit['showWhatsapp'] == true)
              ...[
                SvgPicture.asset(AppAssets.whatsapp),
                SizedBox(width: Responsive.getWidth(context) * 0.03),
              ],
            if (visit['showShare'] == true)
              ...[
                SvgPicture.asset(AppAssets.share),
                SizedBox(width: Responsive.getWidth(context) * 0.03),
              ],
            if (visit['showDelete'] == true)
              SvgPicture.asset(AppAssets.delete),
          ],
        ),

      ],
    );
}
