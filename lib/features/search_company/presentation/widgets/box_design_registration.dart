import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/colors.dart';


class LinearDesignBox extends StatelessWidget {
  final String title;
  final TextStyle? titleTextStyle;
  final bool isIncenter;
  final Widget child;
  final String? subTitle;
  final Color? color;
  final EdgeInsetsGeometry? titlePadding;
  final EdgeInsetsGeometry? childPadding;
  final double? borderRadius;
  final bool? inSingleLine; 

  const LinearDesignBox({
    required this.title,
    required this.child,
    super.key,
    this.subTitle,
    this.color,
    this.borderRadius,
    this.childPadding,
    this.titlePadding,
    this.isIncenter = false,
    this.inSingleLine = false,
    this.titleTextStyle
  });

  @override
  Widget build(BuildContext context) => Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.borderColor),
        borderRadius: BorderRadius.circular(borderRadius ?? 10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Header bar
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular((borderRadius ?? 10) - 1.0),
              ),
              boxShadow: [
                BoxShadow(
                  color:
                      color?.withAlpha(200) ?? AppColors.white.withAlpha(200),
                ),
                BoxShadow(
                  color: color ?? AppColors.primary,
                  spreadRadius: -4.0,
                  blurRadius: 8.0,
                ),
              ],
            ),
            padding:
                titlePadding ??
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 12.0),

            child: inSingleLine == true
                ? Row(
                    mainAxisAlignment:  MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        title,
                        style: titleTextStyle ?? const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: 'Gilroy-Bold',
                        ),
                      ),
                      if (subTitle != null)
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            subTitle ?? '',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontFamily: 'Gilroy-semiBold',
                            ),
                          ),
                        ),
                    ],
                  )
                : 
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Align(
                  alignment: isIncenter
                      ? Alignment.center
                      : Alignment.centerLeft,
                  child: Text(
                    title,
                     style: titleTextStyle ?? const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: 'Gilroy-Bold',
                        ),
                    
                  ),
                ),
                if (subTitle != null)
                  Text(
                    subTitle ?? '',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'Gilroy-semiBold',
                    ),
                  ),
              ],
            ),
          ),

          // Body content
          Padding(
            padding:
                childPadding ??
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 12.0),
            child: child,
          ),
        ],
      ),
    );
}
