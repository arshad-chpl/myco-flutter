import 'package:flutter/material.dart';
import 'package:myco_flutter/constants/app_assets.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/asset/widgets/label_text_field.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

class SwapAssetsPage extends StatefulWidget {
  const SwapAssetsPage({super.key});

  @override
  State<SwapAssetsPage> createState() => _SwapAssetsPageState();
}

class _SwapAssetsPageState extends State<SwapAssetsPage> {
  final TextEditingController custodian1 = TextEditingController();
  final TextEditingController custodian2 = TextEditingController();

  @override
  // ignore: prefer_expression_function_bodies
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color(0xFFF6F7FB),
      appBar: AppBar(
        title: CustomText(
          isKey: true,
          'swap_asset',
          fontSize: 22 * Responsive.getResponsiveText(context),
          fontWeight: FontWeight.w700,
        ),
        titleSpacing: 0,
        leading: const BackButton(),
        // backgroundColor: const Color(0xFFF6F7FB),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 0.04 * Responsive.getWidth(context),
        ),
        child: Column(
          children: [
            LabelTextFieldWidget(
              label: 'custodian',
              hintText: 'select',
              image: AppAssets.assetsUserTick,
              controller: custodian1,
            ),
            LabelTextFieldWidget(
              label: 'custodian',
              hintText: 'select',
              image: AppAssets.assetsElement,
              controller: custodian2,
            ),
            const Spacer(),
            //Submit button
            MyCoButton(
              onTap: () {},
              title: 'Submit',
              isShadowBottomLeft: true,
              boarderRadius: 50,
              fontFamily: 'Gilroy-semiBold',
              fontWeight: FontWeight.w600,
            ),
            SizedBox(height: 0.024 * Responsive.getHeight(context)),
          ],
        ),
      ),
    );
  }
}
