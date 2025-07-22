import 'package:flutter/material.dart';
import 'package:myco_flutter/constants/constants.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/widgets/custom_text_field_new.dart';

class AssetsTextFieldWidget extends StatelessWidget {
  final String label;
  final String hintText;
  final String image;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  const AssetsTextFieldWidget({
    required this.label,
    required this.image,
    required this.hintText,
    super.key,
    this.controller,
    this.validator,
  });

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisSize: MainAxisSize.min,
    children: [
      NewTextField(
        label: label,
        controller: controller,
        hintText: hintText,
        maxLines: 1,
        prefixIconPath: image,
        validator: validator,
      ),
      SizedBox(
        height:
            VariableBag.formContentSpacingVertical *
            Responsive.getResponsive(context),
      ),
    ],
  );
}
