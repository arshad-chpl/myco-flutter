import 'package:flutter/cupertino.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

class OutOfRangeImageMessageWidget extends StatefulWidget {
  final String imagePath;
  final String message;
  const OutOfRangeImageMessageWidget({required this.imagePath, required this.message, super.key});

  @override
  State<OutOfRangeImageMessageWidget> createState() =>
      _OutOfRangeImageMessageWidgetState();
}

class _OutOfRangeImageMessageWidgetState
    extends State<OutOfRangeImageMessageWidget> {
  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Image(
        image: AssetImage(widget.imagePath),
        width: double.infinity * Responsive.getResponsiveOnWidth(context),
      ),
      const SizedBox(height: 10),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText(
            widget.message,
            fontSize: 21 * Responsive.getResponsiveText(context),
            fontWeight: FontWeight.w700,
            color: AppColors.textGray,
          ),
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Image(
              image: const AssetImage('assets/face_detection/cross.png'),
              color: AppTheme.getColor(context).onSurface,
              height: 0.030 * Responsive.getHeight(context),
              width: 0.030 * Responsive.getWidth(context),
            ),
          ),
        ],
      ),
    ],
  );
}
