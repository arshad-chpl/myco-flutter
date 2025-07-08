import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/asset/widgets/active_assets_card.dart';
import 'package:myco_flutter/features/asset/widgets/custom_dash_line.dart';
import 'package:myco_flutter/features/asset/widgets/image_gredal.dart';
import 'package:myco_flutter/widgets/common_card.dart';

class PastAssetsCard extends StatelessWidget {
  final String title;
  final String subTitle;
  final String image;
  final String brand;
  final String srNo;
  final String handover;
  final String takeover;
  final List<String>? handoverImageList;
  final List<String>? takeoverImageList;
  final EdgeInsetsGeometry? childPadding;
  final double? spaceBetweenData;
  final Color? titleColor;
  final Color? dashLineColor;
  final double? dashLinewidth;
  const PastAssetsCard({
    required this.title,
    required this.subTitle,
    required this.image,
    required this.brand,
    required this.srNo,
    required this.handover,
    required this.takeover,
    super.key,
    this.childPadding,
    this.spaceBetweenData,
    this.dashLineColor,
    this.dashLinewidth,
    this.titleColor,
    this.handoverImageList,
    this.takeoverImageList,
  });

  @override
  // ignore: prefer_expression_function_bodies
  Widget build(BuildContext context) {
    return CommonCard(
      title: title,
      subTitle: subTitle,
      headerColor: AppTheme.getColor(context).primary,
      borderColor: AppTheme.lightTheme(context).dividerColor,
      headerPadding: EdgeInsets.symmetric(
        horizontal: 16 * Responsive.getResponsive(context),
        vertical: 8 * Responsive.getResponsive(context),
      ),
      bottomWidget: Padding(
        padding:
            childPadding ??
            EdgeInsets.all(16.0 * Responsive.getResponsive(context)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset(image, width: 0.3 * Responsive.getWidth(context)),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: DashedLine(
                      color:
                          dashLineColor ?? AppTheme.getColor(context).primary,
                      axis: Axis.vertical,
                      width: dashLinewidth ?? 4,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AssetsVerticalData(title: 'Brand', data: brand),
                        SizedBox(
                          height:
                              spaceBetweenData ??
                              0.02 * Responsive.getHeight(context),
                        ),
                        AssetsVerticalData(title: 'Sr.No./MAC/Sim', data: srNo),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: spaceBetweenData ?? 0.02 * Responsive.getHeight(context),
            ),
            Row(
              children: [
                SizedBox(
                  width: 0.36 * Responsive.getWidth(context),
                  child: AssetsVerticalData(title: 'Handover', data: srNo),
                ),
                Expanded(
                  child: ImageGridPreviewWidget(
                    boxHeight: 0.14 * Responsive.getWidth(context),
                    boxWidth: 0.14 * Responsive.getWidth(context),
                    borderRadius: 10,
                    imageList:
                        handoverImageList ?? //[],
                        [
                          'https://images.pexels.com/photos/443446/pexels-photo-443446.jpeg',
                          'assets/images/laptop.png',
                          'https://images.pexels.com/photos/640781/pexels-photo-640781.jpeg',
                          'assets/images/laptop.png',
                        ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: spaceBetweenData ?? 0.02 * Responsive.getHeight(context),
            ),
            AssetsVerticalData(title: 'Takeover', data: srNo),
          ],
        ),
      ),
    );
  }
}
