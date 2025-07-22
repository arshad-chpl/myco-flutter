import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:myco_flutter/constants/app_assets.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/asset/presentation/widgets/assets_label_text_field.dart';
import 'package:myco_flutter/widgets/custom_appbar.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';

class SwapAssetsPage extends StatefulWidget {
  const SwapAssetsPage({super.key});

  @override
  State<SwapAssetsPage> createState() => _SwapAssetsPageState();
}

class _SwapAssetsPageState extends State<SwapAssetsPage> {
  final TextEditingController custodian1 = TextEditingController();
  final TextEditingController custodian2 = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  // ignore: prefer_expression_function_bodies
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color(0xFFF6F7FB),
      appBar: const CustomAppbar(title: 'swap_asset', titleSpacing: 0),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 0.04 * Responsive.getWidth(context),
        ),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              AssetsTextFieldWidget(
                label: 'custodian',
                hintText: 'select',
                image: AppAssets.assetsUserTick,
                controller: custodian1,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Custodian is required';
                  }
                  return null;
                },
              ),
              AssetsTextFieldWidget(
                label: 'custodian',
                hintText: 'select',
                image: AppAssets.assetsElement,
                controller: custodian2,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Custodian is required';
                  }
                  return null;
                },
              ),
              const Spacer(),
              //Submit button
              MyCoButton(
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    // All fields are valid
                    log("Form is valid. Proceed with submission.");
                  } else {
                    log("Form is invalid. Show errors.");
                  }
                },
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
      ),
    );
  }
}
