import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myco_flutter/constants/app_assets.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/my_visit/presentation/widgets/dashed_border_container.dart';
import 'package:myco_flutter/widgets/custom_media_picker_container/media_picker.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

class SelectAttachmentWidget extends StatelessWidget {
  final String iconPath;
  final String label;

  const SelectAttachmentWidget({
    super.key,
    required this.iconPath,
    required this.label,
  });

  @override
  Widget build(BuildContext context) => Container(
    width: Responsive.getWidth(context),
    color: AppTheme.getColor(context).surfaceContainer,
    height: 0.11 * Responsive.getHeight(context),
    child: DashedBorderContainer(
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {

          //media picker bottom sheet 
          showMediaFilePicker(
            isDialog: false,
            isCameraShow: true,
            isGalleryShow: true,
            isDocumentShow: true,
            context: context,
          );
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(iconPath, fit: BoxFit.scaleDown),

            SizedBox(height: 0.010 * Responsive.getHeight(context)),

            //label for Select Attachement
            CustomText(
              label,
              fontSize: 14 * Responsive.getResponsive(context),
              fontWeight: FontWeight.w600,
            ),
          ],
        ),
      ),
    ),
  );
}
