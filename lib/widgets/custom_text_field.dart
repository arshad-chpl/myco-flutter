import 'dart:developer';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/responsive.dart';


import 'package:url_launcher/url_launcher.dart';

class MyCoTextfield extends StatefulWidget {
  final double? width;
  // final double? height;
  final String? labelText;
  final String? hintText;
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
  final String? suFixImage;
  final InputBorder? border;
  final int? maxLenght;
  final TextAlign? textAlignment;
  final List<TextInputFormatter>? inputFormater;
  final double? prefixImageWidth;
  final double? prefixImageHeight;
  final double? suFixImageHeight;
  final double? suFixImageWidth;
  final Decoration? decoration;
  final TextAlignVertical? textAlignVertical;
  final bool? alignLabelWithHint;
  final int? maxLines;


  const MyCoTextfield({
    super.key,
    this.labelText,
    this.width,
    this.hintText,
    this.controller,
    this.onSaved,
    required this.isSuffixIconOn,
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
    this.decoration,
    this.textAlignVertical,
    this.alignLabelWithHint,
    this.maxLines, this.suFixImage, this.suFixImageHeight, this.suFixImageWidth,
  });

  @override
  State<MyCoTextfield> createState() => _MyCoTextfieldState();
}

class _MyCoTextfieldState extends State<MyCoTextfield> {
  @override
  Widget build(BuildContext context) => TextFieldFormMobile(
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
        suffix: widget.suffix,
        decoration: widget.decoration,
        textAlignVertical: widget.textAlignVertical,
        alignLabelWithHint: widget.alignLabelWithHint,
        maxLines: widget.maxLines,
        suFixImage: widget.suFixImage,
        suFixImageHeight: widget.suFixImageHeight,
        suFixImageWidth: widget.suFixImageWidth ,
      );
}

class TextFieldFormMobile extends StatelessWidget {
  final String? labelText;
  final String? hintText;
  final Widget? suffix;
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
  final Decoration? decoration;
  final TextAlignVertical? textAlignVertical;
  final bool? alignLabelWithHint;
  final int? maxLines;
  final String? suFixImage;
  final double? suFixImageHeight;
  final double? suFixImageWidth;

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
    this.suffix,
    this.decoration,
    this.textAlignVertical,
    this.alignLabelWithHint,
    this.maxLines,
    this.suFixImage,
    this.suFixImageWidth,
    this.suFixImageHeight,
  });



  
      


    @override
  Widget build(BuildContext context) {
    bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width > 600;
      final bool isTab = isTablet(context);

    if (isRichClickableTextMode == true) {
      return Container(
        height: height,
        width: width,
        padding: contentPadding ?? EdgeInsets.all(8 * getResponsive(context)),
        decoration: decoration ??
            BoxDecoration(
              color: fillColor ?? Colors.white,
              border: Border.all(color: AppTheme.getColor(context).primary),
              borderRadius: BorderRadius.circular(
                  boarderRadius ?? 7.0 * getResponsiveText(context)),
            ),
        child: Row(
          children: [
            if (prefix != null) ...[
              prefix!,
              SizedBox(width: 0.008 * getWidth(context))
            ],
            Expanded(
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: clickableText ?? '',
                      style: typingtextStyle ??
                          AppTheme.getTextStyle(context).bodyMedium,
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
                              uri = Uri(
                                scheme: 'mailto',
                                path: clickableText,
                              );
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
                              log("Launching URI: $uri"); // Debug line
                              if (await canLaunchUrl(uri)) {
                                await launchUrl(
                                  uri,
                                  mode: LaunchMode.externalApplication,
                                );
                              } else {
                                log("Could not launch: $uri");
                              }
                            } else {
                              log(
                                "URI is null for clickableText: $clickableText",
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

    return TextFormField(
      readOnly: isReadOnly ?? false,
      onTap: onClick,
      onSaved: onSaved,
      controller: controller,
      focusNode: focusNode,
      maxLines: maxLines,
      autofocus: autoFocus ?? false,
      keyboardType: textInputType,
      textAlignVertical: textAlignVertical,
      maxLength: maxLenght,
      textAlign: textAlignment ?? TextAlign.center,
      inputFormatters: inputFormater,
      decoration: InputDecoration(
        counterText: '',
        floatingLabelBehavior: floatingLabelBehavior,
        filled: true,
        alignLabelWithHint: alignLabelWithHint,
        fillColor: fillColor ?? Colors.white,
        border: border ??
            OutlineInputBorder(
              borderSide: BorderSide(
                  color: AppTheme.getColor(context).outline,
                  width: 1.2 * getResponsive(context)),
              borderRadius: BorderRadius.circular(
                  boarderRadius ?? 7.0 * getResponsiveText(context)),
            ),
        focusedBorder: border ??
            OutlineInputBorder(
              borderSide: BorderSide(
                  color: AppTheme.getColor(context).primary,
                  width: 0.002 * getWidth(context)),
              borderRadius: BorderRadius.circular(
                  boarderRadius ?? 7.0 * getResponsive(context)),
            ),
        enabledBorder: border ??
            OutlineInputBorder(
              borderSide: BorderSide(
                  color: AppTheme.getColor(context).outline,
                  width: 0.002 * getWidth(context)),
              borderRadius: BorderRadius.circular(
                  boarderRadius ?? 7.0 * getResponsive(context)),
            ),
        contentPadding: contentPadding ??
            EdgeInsets.only(
                top: 25 * getResponsive(context),
                left: 12 * getResponsive(context),
                right: 12 * getResponsive(context),
                bottom: 16 * getResponsive(context)),
        labelText: isLabelOn == true ? labelText : null,
        hintText: hintText,
        hintStyle: hintTextStyle ??
            AppTheme.getTextStyle(context)
                .bodyLarge!
                .copyWith(color: AppTheme.getColor(context).outline),
        labelStyle: labelTextStyle ??
            AppTheme.getTextStyle(context).bodySmall!.copyWith(
                  color: AppTheme.getColor(context).primary,
                ),
        prefixIcon: (prefix != null)
            ? prefix
            : (prefixImage != null && prefixImage!.isNotEmpty)
                ? GestureDetector(
                    onTap: onTap1,
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: isTab ? 20*getResponsive(context) : 16* getResponsive(context),
                        right: isTab ? 12*getResponsive(context) : 8* getResponsive(context),
                      ),
                      child: Image.asset(
                        prefixImage!,
                        fit:BoxFit.contain ,
                        width: prefixImageWidth ??
                            (isTab
                                ? 0.5 * getWidth(context)
                                : 0.03 * getWidth(context)),
                        height: prefixImageHeight ?? 
                            (isTab
                                ? 0.5 * getHeight(context)
                                : 0.03 * getHeight(context)),
                      ),
                    ),
                  )
                : null,
        suffixIcon: (suffix != null)
            ? suffix
            : (suFixImage != null && suFixImage!.isNotEmpty)
                ? GestureDetector(
                    onTap: onTap1,
                    child: Padding(
                      padding: EdgeInsets.only(
                        right: isTab ? 20 * getResponsive(context) : 16* getResponsive(context),
                        left: isTab ? 12* getResponsive(context) : 8* getResponsive(context),
                      ),
                      child: Image.asset(
                        fit: BoxFit.contain,
                        suFixImage!,
                        width: suFixImageWidth ??
                            (isTab
                                ? 0.5 * getWidth(context)
                                : 0.05 * getWidth(context)),
                        height: suFixImageHeight ??
                            (isTab
                                ? 0.5 * getHeight(context)
                                : 0.05 * getHeight(context)),
                      ),
                    ),
                  )
                : null,
      ),
      style: typingtextStyle ??
          AppTheme.getTextStyle(context).bodyLarge!.copyWith(
                color: AppTheme.getColor(context).primary,
              ),
      cursorColor: AppTheme.getColor(context).primary,
      validator: validator,
      onChanged: onChanged,
      obscureText: obscureText ?? false,
      obscuringCharacter: obscuringCharacter ?? '●',
    );
  }
}

