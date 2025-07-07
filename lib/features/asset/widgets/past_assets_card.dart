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
  final List<String> handoverImageList;
  final List<String> takeoverImageList;
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
    required this.handoverImageList,
    required this.takeoverImageList,
    required this.takeover,
    super.key,
    this.childPadding,
    this.spaceBetweenData,
    this.dashLineColor,
    this.dashLinewidth,
    this.titleColor,
  });

  @override
  // ignore: prefer_expression_function_bodies
  Widget build(BuildContext context) {
    return CommonCard(
      title: title,
      subTitle: subTitle,
      showBlackShadowInChild: true,
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
                  if (image.startsWith('http') || image.startsWith('https'))
                    Image.network(
                      image,
                      width: 0.3 * Responsive.getWidth(context),
                    )
                  else
                    Image.asset(
                      image,
                      width: 0.3 * Responsive.getWidth(context),
                    ),
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
                        SizedBox(
                          height:
                              spaceBetweenData ??
                              0.02 * Responsive.getHeight(context),
                        ),
                        Row(
                          children: [
                            if (handoverImageList.isEmpty)
                              Expanded(
                                child: AssetsVerticalData(
                                  title: 'Handover',
                                  data: handover,
                                ),
                              ),
                            if (takeoverImageList.isEmpty &&
                                handoverImageList.isEmpty)
                              SizedBox(
                                width: 0.01 * Responsive.getWidth(context),
                              ),
                            if (takeoverImageList.isEmpty)
                              Expanded(
                                child: AssetsVerticalData(
                                  title: 'Takeover',
                                  data: takeover,
                                ),
                              ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: spaceBetweenData ?? 0.02 * Responsive.getHeight(context),
            ),
            if (handoverImageList.isNotEmpty)
              Row(
                children: [
                  SizedBox(
                    width: 0.36 * Responsive.getWidth(context),
                    child: AssetsVerticalData(
                      title: 'Handover',
                      data: handover,
                    ),
                  ),
                  Expanded(
                    child: ImageGridPreviewWidget(
                      boxHeight: 0.14 * Responsive.getWidth(context),
                      boxWidth: 0.14 * Responsive.getWidth(context),
                      borderRadius: 10,
                      imageList: handoverImageList,
                    ),
                  ),
                ],
              ),
            if (handoverImageList.isNotEmpty && takeoverImageList.isNotEmpty)
              SizedBox(
                height:
                    spaceBetweenData ?? 0.02 * Responsive.getHeight(context),
              ),
            if (takeoverImageList.isNotEmpty)
              Row(
                children: [
                  SizedBox(
                    width: 0.36 * Responsive.getWidth(context),
                    child: AssetsVerticalData(
                      title: 'Takeover',
                      data: takeover,
                    ),
                  ),
                  Expanded(
                    child: ImageGridPreviewWidget(
                      boxHeight: 0.14 * Responsive.getWidth(context),
                      boxWidth: 0.14 * Responsive.getWidth(context),
                      borderRadius: 10,
                      imageList: takeoverImageList,
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
