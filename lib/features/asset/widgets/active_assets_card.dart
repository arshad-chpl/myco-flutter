import 'package:flutter/material.dart';
import 'package:myco_flutter/constants/app_assets.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/widgets/cached_image_holder.dart';
import 'package:myco_flutter/features/asset/widgets/custom_dash_line.dart';
import 'package:myco_flutter/widgets/common_card.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

class AssetsListPage extends StatelessWidget {
  const AssetsListPage({super.key});

  @override
  Widget build(BuildContext context) => SliverPadding(
    padding: EdgeInsets.symmetric(
      horizontal: 0.04 * Responsive.getWidth(context),
    ),
    sliver: SliverList.separated(
      itemCount: 8,
      separatorBuilder: (_, __) =>
          SizedBox(height: 0.02 * Responsive.getHeight(context)),
      itemBuilder: (_, index) => const ActiveAssetsCard(
        title: 'Laptop',
        subTitle: '(AS101)',
        image: AppAssets.imageLaptop,
        brand: 'Dell',
        srNo: 'DELL123456',
        handOverDate: '01-01-2024',
      ),
    ),
  );
}

class ActiveAssetsCard extends StatelessWidget {
  final String title;
  final String subTitle;
  final String image;
  final String brand;
  final String srNo;
  final String handOverDate;
  final EdgeInsetsGeometry? childPadding;
  final double? spaceBetweenData;
  final Color? titleColor;
  final Color? dashLineColor;
  const ActiveAssetsCard({
    required this.title,
    required this.subTitle,
    required this.image,
    required this.brand,
    required this.srNo,
    required this.handOverDate,
    super.key,
    this.childPadding,
    this.spaceBetweenData,
    this.dashLineColor,
    this.titleColor,
  });

  @override
  Widget build(BuildContext context) => CommonCard(
    showBlackShadowInChild: true,
    title: title,
    subTitle: subTitle,
    headerColor: titleColor,
    borderColor: AppTheme.lightTheme(context).dividerColor,
    headerPadding: EdgeInsets.symmetric(
      horizontal: 16 * Responsive.getResponsive(context),
      vertical: 8 * Responsive.getResponsive(context),
    ),
    bottomWidget: Padding(
      padding:
          childPadding ??
          EdgeInsets.all(16 * Responsive.getResponsive(context)),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (image.startsWith('http') || image.startsWith('https'))
              CachedImage(
                imageUrl: image,
                width: 0.3 * Responsive.getWidth(context),
              )
            else
              Image.asset(image, width: 0.3 * Responsive.getWidth(context)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: DashedLine(
                color: dashLineColor ?? AppTheme.getColor(context).primary,
                axis: Axis.vertical,
                dashLength: 2,
                width: 1,
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AssetsVerticalData(title: 'brand', data: brand),
                  SizedBox(
                    height:
                        spaceBetweenData ??
                        0.02 * Responsive.getHeight(context),
                  ),
                  AssetsVerticalData(title: 'sr_no', data: srNo),
                  SizedBox(
                    height:
                        spaceBetweenData ??
                        0.02 * Responsive.getHeight(context),
                  ),
                  AssetsVerticalData(title: 'handover', data: handOverDate),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

class AssetsVerticalData extends StatelessWidget {
  final String title;
  final String data;
  final Color? titleColor;
  final CrossAxisAlignment? crossAxisAlignment;
  final MainAxisAlignment? mainAxisAlignment;
  final FontStyle? titleFontStyle;
  const AssetsVerticalData({
    required this.title,
    required this.data,
    super.key,
    this.crossAxisAlignment,
    this.mainAxisAlignment,
    this.titleColor,
    this.titleFontStyle,
  });

  @override
  Widget build(BuildContext context) => Column(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.start,
    mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
    children: [
      CustomText(
        isKey: true,
        title,
        color: titleColor,
        fontSize: 18 * Responsive.getResponsiveText(context),
        fontWeight: FontWeight.w700,
        fontStyle: titleFontStyle,
      ),
      CustomText(
        data,
        fontWeight: FontWeight.w500,
        fontSize: 18 * Responsive.getResponsiveText(context),
      ),
    ],
  );
}
