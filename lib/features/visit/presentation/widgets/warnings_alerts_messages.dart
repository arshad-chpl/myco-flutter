import 'package:flutter/cupertino.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

class WarningsAlertsMessages extends StatelessWidget {
  final String imagePath;
  final String msg;

  const WarningsAlertsMessages({super.key, required this.imagePath, required this.msg});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image(image: AssetImage(imagePath), height: 23, width: 23, color: AppColors.black,),
        SizedBox(width: 10,),
        CustomText(msg, fontWeight: FontWeight.w600,)
      ],
    );
  }
}
