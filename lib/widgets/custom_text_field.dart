import 'dart:developer';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';

import 'package:url_launcher/url_launcher.dart';

class MyCoTextfield extends StatefulWidget {
  final double? width;
  // final double? height;
  final String? labelText;
  final String? hintText;
  final TextEditingController? controller;
  final void Function(String?)? onSaved;
  final bool? isSuffixIconOn;
  final String? image1;
  final String? image2;
  final Color? color;
  final Widget? prefix;
  final EdgeInsetsGeometry? contentPadding;
  final double? height;
  final Color? fillColor;
  final void Function()? onTap1;
  final void Function()? onTap2;
  final FontWeight? fontWeight;
  final double? titleTextSize;
  final Color? titleColor;
  final bool? isLabelOn;
  final Widget? suffix;
  final void Function()? onClick;
  final bool? isReadOnly;
  final TextStyle? hintTextStyle;
  final TextStyle? labelTextStyle;
  final FocusNode? focusNode;
  final bool? obscureText;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final double? iconHeight;
  final double? iconWidth;
  final String? obscuringCharacter;
  final TextInputType? textInputType;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final bool? autoFocus;
  final TextStyle? typingtextStyle;
  final double? boarderRadius;
  final String? preFixImage;
  final InputBorder? border;
  final int? maxLenght;
  final TextAlign? textAlignment;
  final List<TextInputFormatter>? inputFormater;
  final double? prefixImageWidth;
  final double? prefixImageHeight;

  const MyCoTextfield({
    super.key,
    this.labelText,
    this.width,
    this.hintText,
    this.controller,
    this.onSaved,
    this.isSuffixIconOn,
    this.image1,
    this.image2,
    this.color,
    this.prefix,
    this.contentPadding,
    this.height,
    this.onTap1,
    this.onTap2,
    this.fontWeight,
    this.titleTextSize,
    this.titleColor,
    this.isLabelOn,
    this.onClick,
    this.isReadOnly,
    this.hintTextStyle,
    this.labelTextStyle,
    this.fillColor,
    this.focusNode,
    this.obscureText,
    this.onChanged,
    this.validator,
    this.iconHeight,
    this.iconWidth,
    this.obscuringCharacter,
    this.textInputType,
    this.floatingLabelBehavior,
    this.autoFocus,
    this.suffix,
    this.typingtextStyle,
    this.boarderRadius,
    this.preFixImage,
    this.prefixImageWidth,
    this.prefixImageHeight,
    this.maxLenght,
    this.textAlignment,
    this.inputFormater,
    this.border,
  });

  @override
  State<MyCoTextfield> createState() => _MyCoTextfieldState();
}

class _MyCoTextfieldState extends State<MyCoTextfield> {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return height < 1100
        ? TextFieldFormMobile(
            labelText: widget.labelText,
            isSuffixIconOn: widget.isSuffixIconOn,
            controller: widget.controller,
            isLabelOn: widget.isLabelOn,
            image1: widget.image1,
            image2: widget.image2,
            contentPadding: widget.contentPadding,
            titleTextSize: widget.titleTextSize,
            fontWeight: widget.fontWeight,
            prefix: widget.prefix,
            isReadOnly: widget.isReadOnly,
            onClick: widget.onClick,
            onSaved: widget.onSaved,
            height: widget.height,
            key: widget.key,
            onTap1: widget.onTap1,
            onTap2: widget.onTap2,
            hintTextStyle: widget.hintTextStyle,
            labelTextStyle: widget.labelTextStyle,
            color: widget.color,
            fillColor: widget.fillColor,
            titleColor: widget.titleColor,
            focusNode: widget.focusNode,
            obscureText: widget.obscureText,
            onChanged: widget.onChanged,
            validator: widget.validator,
            iconHeight: widget.iconHeight,
            iconWidth: widget.iconWidth,
            textInputType: widget.textInputType,
            hintText: widget.hintText,
            floatingLabelBehavior: widget.floatingLabelBehavior,
            autoFocus: widget.autoFocus,
            typingtextStyle: widget.typingtextStyle,
            boarderRadius: widget.boarderRadius,
            prefixImage: widget.preFixImage,
            prefixImageHeight: widget.prefixImageHeight,
            prefixImageWidth: widget.prefixImageWidth,
            maxLenght: widget.maxLenght,
            textAlignment: widget.textAlignment,
            inputFormater: widget.inputFormater,
            border: widget.border,
          )
        : TextfieldFormTablet(
            labelText: widget.labelText,
            isSuffixIconOn: widget.isSuffixIconOn ?? false,
            controller: widget.controller,
            isLabelOn: widget.isLabelOn,
            image1: widget.image1,
            image2: widget.image2,
            contentPadding: widget.contentPadding,
            fillColor: widget.fillColor,
            titleTextSize: widget.titleTextSize,
            fontWeight: widget.fontWeight,
            prefix: widget.prefix,
            color: widget.color,
            isReadOnly: widget.isReadOnly,
            onClick: widget.onClick,
            titleColor: widget.titleColor,
            onSaved: widget.onSaved,
            height: widget.height,
            key: widget.key,
            onTap1: widget.onTap1,
            onTap2: widget.onTap2,
            hintTextStyle: widget.hintTextStyle,
            labelTextStyle: widget.labelTextStyle,
            focusNode: widget.focusNode,
            obscureText: widget.obscureText,
            onChanged: widget.onChanged,
            validator: widget.validator,
            iconHeight: widget.iconHeight,
            iconWidth: widget.iconWidth,
            autoFocus: widget.autoFocus,
            textInputType: widget.textInputType,
            hintText: widget.hintText,
            floatingLabelBehavior: widget.floatingLabelBehavior,
            typingtextStyle: widget.typingtextStyle,
            textAlignment: widget.textAlignment,
          );
  }
}

class TextfieldFormTablet extends StatelessWidget {
  final String? labelText;
  final String? hintText;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final TextEditingController? controller;
  final void Function(String?)? onSaved;
  final bool isSuffixIconOn;
  final String? image1;
  final String? image2;
  final Color? color;
  final Widget? prefix;
  final EdgeInsetsGeometry? contentPadding;
  final double? height;
  final Color? fillColor;
  final void Function()? onTap1;
  final void Function()? onTap2;
  final FontWeight? fontWeight;
  final double? titleTextSize;
  final Color? titleColor;
  final bool? isLabelOn;
  final void Function()? onClick;
  final bool? isReadOnly;
  final TextStyle? hintTextStyle;
  final TextStyle? labelTextStyle;
  final FocusNode? focusNode;
  final bool? obscureText;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final double? iconHeight;
  final double? iconWidth;
  final String? obscuringCharacter;
  final TextInputType? textInputType;
  final bool? autoFocus;
  final TextStyle? typingtextStyle;
  final int? maxLenght;
  final TextAlign? textAlignment;
  final List<TextInputFormatter>? inputFormater;

  const TextfieldFormTablet({
    required this.labelText,
    required this.isSuffixIconOn,
    super.key,
    this.controller,
    this.onSaved,
    this.image1,
    this.image2,
    this.color,
    this.prefix,
    this.contentPadding,
    this.height,
    this.fillColor,
    this.onTap1,
    this.onTap2,
    this.fontWeight,
    this.titleTextSize,
    this.titleColor,
    this.isLabelOn,
    this.onClick,
    this.isReadOnly,
    this.hintTextStyle,
    this.labelTextStyle,
    this.focusNode,
    this.obscureText,
    this.onChanged,
    this.validator,
    this.iconHeight,
    this.iconWidth,
    this.obscuringCharacter,
    this.textInputType,
    this.hintText,
    this.floatingLabelBehavior,
    this.autoFocus,
    this.typingtextStyle,
    this.maxLenght,
    this.textAlignment,
    this.inputFormater,
  });

  @override
  Widget build(BuildContext context) => TextFormField(
    readOnly: isReadOnly ?? false,
    onTap: onClick,
    onSaved: onSaved,
    controller: controller,
    focusNode: focusNode,
    autofocus: autoFocus ?? false,
    maxLength: maxLenght,
    textAlign: textAlignment ?? TextAlign.start,
    inputFormatters: inputFormater,
    decoration: InputDecoration(
      floatingLabelBehavior: floatingLabelBehavior,
      filled: true,
      fillColor: fillColor ?? AppColors.white,
      border: InputBorder.none,

      // OutlineInputBorder(
      //   borderSide: BorderSide(color: AppColors.borderColor, width: 1.2),
      //   borderRadius: BorderRadius.circular(7.0),
      // ),
      // focusedBorder: OutlineInputBorder(
      //   borderSide: BorderSide(
      //     color: Theme.of(context).AppColors.primary,
      //     width: 1.2,
      //   ),
      //   borderRadius: BorderRadius.circular(7.0),
      // ),
      // enabledBorder: OutlineInputBorder(
      //   borderSide: BorderSide(color: AppColors.borderColor, width: 1.2),
      //   borderRadius: BorderRadius.circular(7.0),
      // ),
      contentPadding:
          contentPadding ??
          EdgeInsets.only(
            left: 0.003 * getResponsive(context),
            top: 0.005 * getResponsive(context),
          ),
      labelText: isLabelOn == true ? labelText : null,

      hintText: hintText,
      hintStyle:
          hintTextStyle ??
          TextStyle(
            fontSize: titleTextSize ?? 14 * getResponsiveText(context),
            color: AppColors.primary,
            fontWeight: fontWeight ?? FontWeight.w500,
          ),
      labelStyle:
          labelTextStyle ??
          TextStyle(
            fontSize: titleTextSize ?? 14 * getResponsiveText(context),
            color: AppColors.primary,
            fontWeight: fontWeight ?? FontWeight.w500,
          ),
      prefixIcon: prefix,
      suffixIcon: isSuffixIconOn
          ? Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (image1 != null)
                  GestureDetector(
                    onTap: onTap1,
                    child: Image.asset(
                      image1!,
                      height: iconHeight ?? 0.022 * getHeight(context),
                    ),
                  ),
                SizedBox(width: 0.03 * getWidth(context)),
                if (image2 != null)
                  GestureDetector(
                    onTap: onTap2,
                    child: Image.asset(
                      image2!,
                      height: iconHeight ?? 0.022 * getHeight(context),
                    ),
                  ),
                SizedBox(width: 0.03 * getWidth(context)),
              ],
            )
          : null,
    ),
    style:
        typingtextStyle ??
        TextStyle(
          fontWeight: fontWeight ?? FontWeight.w500,
          fontSize: titleTextSize ?? 14 * getResponsiveText(context),
          color: AppColors.primary,
        ),
    cursorColor: AppColors.primary,
    validator: validator,
    onChanged: onChanged,
    obscureText: obscureText ?? false,
    obscuringCharacter: obscuringCharacter ?? '●',
    keyboardType: textInputType,
  );
}

class TextFieldFormMobile extends StatelessWidget {
  final String? labelText;
  final String? hintText;
  final TextEditingController? controller;
  final void Function(String?)? onSaved;
  final bool? isSuffixIconOn;
  final String? image1;
  final String? image2;
  final Color? color;
  final Widget? prefix;
  final EdgeInsetsGeometry? contentPadding;
  final double? height;
  final double? width;
  final Color? fillColor;
  final void Function()? onTap1;
  final void Function()? onTap2;
  final FontWeight? fontWeight;
  final double? titleTextSize;
  final Color? titleColor;
  final bool? isLabelOn;
  final void Function()? onClick;
  final bool? isReadOnly;
  final TextStyle? hintTextStyle;
  final TextStyle? labelTextStyle;
  final FocusNode? focusNode;
  final bool? obscureText;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final double? iconHeight;
  final double? iconWidth;
  final String? obscuringCharacter;
  final TextInputType? textInputType;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final bool? autoFocus;
  final String? clickableText;
  final bool? isRichClickableTextMode;
  final TextStyle? typingtextStyle;
  final double? boarderRadius;
  final String? prefixImage;
  final double? prefixImageWidth;
  final double? prefixImageHeight;
  final InputBorder? border;
  final int? maxLenght;
  final TextAlign? textAlignment;
  final List<TextInputFormatter>? inputFormater;
  const TextFieldFormMobile({
    super.key,
    this.labelText,
    this.hintText,
    this.controller,
    this.onSaved,
    this.isSuffixIconOn,
    this.image1,
    this.image2,
    this.color,
    this.prefix,
    this.contentPadding,
    this.height,
    this.fillColor,
    this.onTap1,
    this.onTap2,
    this.fontWeight,
    this.titleTextSize,
    this.titleColor,
    this.isLabelOn,
    this.onClick,
    this.isReadOnly,
    this.hintTextStyle,
    this.labelTextStyle,
    this.focusNode,
    this.obscureText,
    this.onChanged,
    this.validator,
    this.iconHeight,
    this.iconWidth,
    this.obscuringCharacter,
    this.textInputType,
    this.floatingLabelBehavior,
    this.autoFocus,
    this.typingtextStyle,
    this.clickableText,
    this.isRichClickableTextMode,
    this.width,
    this.boarderRadius,
    this.prefixImage,
    this.prefixImageHeight,
    this.prefixImageWidth,
    this.maxLenght,
    this.textAlignment,
    this.inputFormater,
    this.border,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    if (isRichClickableTextMode == true) {
      return Container(
        height: height,
        width: width,
        padding: contentPadding ?? const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: fillColor ?? Colors.white,
          border: Border.all(color: AppColors.textfieldBorder),
          borderRadius: BorderRadius.circular(boarderRadius ?? 7.0),
        ),
        child: Row(
          children: [
            if (prefix != null) ...[prefix!, const SizedBox(width: 8)],
            Expanded(
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: clickableText ?? '',
                      style:
                          typingtextStyle ??
                          TextStyle(
                            color: AppColors.primary,
                            decoration: TextDecoration.underline,
                            fontSize:
                                titleTextSize ?? textTheme.bodyLarge?.fontSize,
                            fontWeight: fontWeight ?? FontWeight.w500,
                          ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () async {
                          if (clickableText != null) {
                            Uri? uri;

                            if (clickableText!.startsWith('+')) {
                              // Phone number
                              uri = Uri(scheme: 'tel', path: clickableText);
                            } else if (clickableText!.contains('@')) {
                              // Email
                              // Use Uri to encode email properly
                              uri = Uri(scheme: 'mailto', path: clickableText);
                            } else if (clickableText!.startsWith('http') ||
                                clickableText!.startsWith('www')) {
                              // URL
                              final urlString =
                                  clickableText!.startsWith('http')
                                  ? clickableText!
                                  : 'https://${clickableText!}';
                              uri = Uri.tryParse(urlString);
                            }

                            if (uri != null) {
                              log('Launching URI: $uri'); // Debug line
                              if (await canLaunchUrl(uri)) {
                                await launchUrl(
                                  uri,
                                  mode: LaunchMode.externalApplication,
                                );
                              } else {
                                log('Could not launch: $uri');
                              }
                            } else {
                              log(
                                'URI is null for clickableText: $clickableText',
                              );
                            }
                          }
                        },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    return SizedBox(
      width: width ?? double.infinity,
      // height:,
      child: TextFormField(
        readOnly: isReadOnly ?? false,
        onTap: onClick,
        onSaved: onSaved,
        controller: controller,
        focusNode: focusNode,
        autofocus: autoFocus ?? false,
        keyboardType: textInputType,
        maxLength: maxLenght,
        textAlign: textAlignment ?? TextAlign.start,
        inputFormatters: inputFormater,
        decoration: InputDecoration(
          counterText: '',
          floatingLabelBehavior: floatingLabelBehavior,
          filled: true,
          fillColor: fillColor ?? Colors.white,
          border:
              border ??
              OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.gray10, width: 1.2),
                borderRadius: BorderRadius.circular(boarderRadius ?? 7.0),
              ),
          focusedBorder:
              border ??
              OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.primary,
                  width: 1.2,
                ),
                borderRadius: BorderRadius.circular(boarderRadius ?? 7.0),
              ),
          enabledBorder:
              border ??
              OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.gray10,
                  width: 1.2,
                ),
                borderRadius: BorderRadius.circular(boarderRadius ?? 7.0),
              ),
          contentPadding:
              contentPadding ??
              EdgeInsets.symmetric(horizontal: 12, vertical: height ?? 2),
          labelText: isLabelOn == true ? labelText : null,
          hintText: hintText ?? "99092187876236",
          hintStyle:
              hintTextStyle ??
              textTheme.bodyLarge?.copyWith(
                color: AppColors.black,
                fontWeight: fontWeight ?? FontWeight.w500,
                fontSize: titleTextSize,
              ),
          labelStyle:
              labelTextStyle ??
              textTheme.labelLarge?.copyWith(
                color: AppColors.primary,
                fontWeight: fontWeight ?? FontWeight.w500,
                fontSize: titleTextSize,
              ),
          prefixIcon: (prefix != null)
              ? prefix
              : (prefixImage != null && prefixImage!.isNotEmpty)
              ? GestureDetector(
                  onTap: onTap1,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12.0,
                      vertical: 12.0,
                    ),
                    child: Image.asset(
                      prefixImage!,
                      height: prefixImageHeight ?? 18,
                      width: prefixImageWidth ?? 18,
                      fit: BoxFit.contain,
                    ),
                  ),
                )
              : null,
          suffixIcon: isSuffixIconOn ?? false
              ? Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (image1 != null)
                      GestureDetector(
                        onTap: onTap1,
                        child: Image.asset(image1!, height: iconHeight ?? 20),
                      ),
                    const SizedBox(width: 12),
                    if (image2 != null)
                      GestureDetector(
                        onTap: onTap2,
                        child: Image.asset(image2!, height: iconHeight ?? 20),
                      ),
                    const SizedBox(width: 12),
                  ],
                )
              : null,
        ),
        style:
            typingtextStyle ??
            textTheme.bodyLarge?.copyWith(
              fontWeight: fontWeight ?? FontWeight.w500,
              fontSize: titleTextSize,
              color: AppColors.primary,
            ),
        cursorColor: AppColors.primary,
        validator: validator,
        onChanged: onChanged,
        obscureText: obscureText ?? false,
        obscuringCharacter: obscuringCharacter ?? '●',
      ),
    );
  }
}
