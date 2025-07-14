import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/widgets/custom_text.dart';
import 'package:myco_flutter/widgets/custom_text_field.dart';

class LabeledTextField extends StatelessWidget {
  final String label;
  final String hint;
  final double widthFactor;
  final TextEditingController? controller;
  final TextStyle? hintTextStyle;
  final TextStyle? labelTextStyle;
  final bool? isReadOnly;
  final bool? obscureText;
  final String? obscuringCharacter;
  final TextInputType? textInputType;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final void Function(String?)? onSaved;
  final Widget? prefix;
  final Widget? suffix;
  final int? maxLength;
  final TextAlign? textAlignment;
  final List<TextInputFormatter>? inputFormatters;
  final double? heightFactor;
  final Color? fillColor;
  final double? textFieldHeight;
  final double? textFieldwidth;
  final double? width;
  // final double? height;
  final String? labelText;
  final String? hintText;
  final bool? isSuffixIconOn;
  final String? image1;
  final String? image2;
  final Color? color;
  final EdgeInsetsGeometry? contentPadding;
  final double? height;
  final void Function()? onTap1;
  final void Function()? onTap2;
  final FontWeight? fontWeight;
  final double? titleTextSize;
  final Color? titleColor;
  final bool? isLabelOn;
  final void Function()? onClick;
  final FocusNode? focusNode;
  final double? iconHeight;
  final double? iconWidth;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final bool? autoFocus;
  final TextStyle? typingtextStyle;
  final double? boarderRadius;
  final String? preFixImage;
  final InputBorder? border;
  final int? maxLenght;
  final List<TextInputFormatter>? inputFormater;
  final double? prefixImageWidth;
  final double? prefixImageHeight;
  final Color? textColor;
  final FontWeight? textFontweight;
  final double? textFontSize;
  final TextDecoration? textDecoration;
  final Color? textDecorationColor;
  final TextAlign? textAlign;
  final int? textMaxLine;
  final TextOverflow? textOverflow;

  const LabeledTextField({
    Key? key,
    required this.label,
    required this.hint,
    this.widthFactor = 0.4,
    this.controller,
    this.hintTextStyle,
    this.labelTextStyle,
    this.isReadOnly,
    this.obscureText,
    this.obscuringCharacter,
    this.textInputType,
    this.validator,
    this.onChanged,
    this.onSaved,
    this.prefix,
    this.suffix,
    this.maxLength,
    this.textAlignment,
    this.inputFormatters,
    this.heightFactor,
    this.fillColor,
    this.textFieldHeight,
    this.textFieldwidth,
    this.width,
    this.labelText,
    this.hintText,
    this.isSuffixIconOn,
    this.image1,
    this.image2,
    this.color,
    this.contentPadding,
    this.height,
    this.onTap1,
    this.onTap2,
    this.fontWeight,
    this.titleTextSize,
    this.titleColor,
    this.isLabelOn,
    this.onClick,
    this.focusNode,
    this.iconHeight,
    this.iconWidth,
    this.floatingLabelBehavior,
    this.autoFocus,
    this.typingtextStyle,
    this.boarderRadius,
    this.preFixImage,
    this.border,
    this.maxLenght,
    this.inputFormater,
    this.prefixImageWidth,
    this.prefixImageHeight,
    this.textColor,
    this.textFontweight,
    this.textFontSize,
    this.textDecoration,
    this.textDecorationColor,
    this.textAlign,
    this.textMaxLine,
    this.textOverflow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      CustomText(
        label,
        color: textColor?? AppColors.textGray,
        fontSize: textFontSize?? 16 * Responsive.getResponsiveText(context),
        fontWeight:textFontweight?? FontWeight.bold,
        decoration: textDecoration,
        textAlign: textAlign,
        decorationColor: textDecorationColor,
        maxLines: textMaxLine,
        overflow: textOverflow,
      ),
      SizedBox(height: 0.005 * Responsive.getHeight(context)),
      SizedBox(
        height: heightFactor,
        width: widthFactor,
        child: MyCoTextfield(
          controller: controller,
          hintText: hint,
          hintTextStyle:
              hintTextStyle ??
              TextStyle(
                fontSize: 18 * Responsive.getResponsiveText(context),
                color: AppColors.gray,
                fontWeight: FontWeight.bold,
              ),
          labelText: null,
          isLabelOn: false,
          isReadOnly: isReadOnly,
          obscureText: obscureText,
          obscuringCharacter: obscuringCharacter,
          textInputType: textInputType,
          validator: validator,
          onChanged: onChanged,
          onSaved: onSaved,
          prefix: prefix,
          suffix: suffix,
          maxLenght: maxLength,
          textAlignment: textAlignment,
          inputFormater: inputFormatters,
          fillColor: fillColor,
          width: textFieldwidth,
          height: textFieldHeight,
          border: border,
          titleColor: titleColor,
          prefixImageWidth: prefixImageWidth,
          prefixImageHeight: prefixImageHeight,
          color: color,
          boarderRadius: boarderRadius,
          contentPadding: contentPadding,
          autoFocus: autoFocus,
          floatingLabelBehavior: floatingLabelBehavior,
          focusNode: focusNode,
          fontWeight: fontWeight,
          iconHeight: iconHeight,
          iconWidth: iconWidth,
          image1: image1,
          image2: image2,
          isSuffixIconOn: isSuffixIconOn ?? false,
          labelTextStyle: labelTextStyle,
          onClick: onClick,
          onTap1: onTap1,
          onTap2: onTap2,
          preFixImage: preFixImage,
          titleTextSize: titleTextSize,
          typingtextStyle: typingtextStyle,
        ),
      ),
    ],
  );
}
