import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/asset/widgets/active_assets_card.dart';
import 'package:myco_flutter/features/asset/widgets/custom_dash_line.dart';
import 'package:myco_flutter/widgets/common_card.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

class AllAssetsCard extends StatelessWidget {
  final String title;
  final String subTitle;
  final String image;
  final String brand;
  final String srNo;
  final String category;
  final String createdBy;
  final String? custodian;
  final EdgeInsetsGeometry? childPadding;
  final double? spaceBetweenData;
  final Color? titleColor;
  final Color? dashLineColor;
  final double? dashLinewidth;
  const AllAssetsCard({
    required this.title,
    required this.subTitle,
    required this.image,
    required this.brand,
    required this.srNo,
    required this.category,
    required this.createdBy,
    super.key,
    this.childPadding,
    this.spaceBetweenData,
    this.dashLineColor,
    this.dashLinewidth,
    this.titleColor,
    this.custodian,
  });

  @override
  // ignore: prefer_expression_function_bodies
  Widget build(BuildContext context) {
    return CommonCard(
      title: title,
      subTitle: subTitle,
      headerColor: const Color(0xFF08A4BB),
      borderColor: AppTheme.lightTheme(context).dividerColor,
      bottomWidget: Padding(
        padding: childPadding ?? const EdgeInsets.all(12.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset(image, width: 0.3 * getWidth(context)),
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
                        IntrinsicHeight(
                          child: Row(
                            children: [
                              Expanded(
                                child: AssetsVerticalData(
                                  title: 'Brand',
                                  data: brand,
                                ),
                              ),
                              VerticalDivider(
                                width: 0.08 * getWidth(context),
                                color: AppTheme.getColor(context).primary,
                              ),
                              Expanded(
                                child: AssetsVerticalData(
                                  title: 'Brand',
                                  data: brand,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: spaceBetweenData ?? 8),
                        AssetsVerticalData(title: 'Sr.No./MAC/Sim', data: srNo),
                        if (custodian != null)
                          SizedBox(height: spaceBetweenData ?? 8),
                        if (custodian != null)
                          AssetsVerticalData(
                            title: 'Custodian',
                            data: custodian ?? '',
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: spaceBetweenData ?? 8),
            Row(
              children: [
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Created By',
                        style: TextStyle(
                          fontFamily: 'Gilroy-Bold',
                          fontStyle: FontStyle.italic,
                          fontSize: 18 * getResponsiveText(context),
                        ),
                      ),
                      CustomText(
                        createdBy,
                        fontWeight: FontWeight.w500,
                        fontSize: 18 * getResponsiveText(context),
                      ),
                    ],
                  ),
                ),
                MyCoButton(
                  onTap: () {},
                  title: 'View Details',
                  textStyle: TextStyle(
                    fontFamily: 'Gilroy-semiBold',
                    fontSize: 14 * getResponsiveText(context),
                    color: AppTheme.getColor(context).onPrimary,
                  ),
                  width: 0.26 * getWidth(context),
                  height: 0.09 * getWidth(context),
                  boarderRadius: 50,
                  borderColor: const Color(0xFF08A4BB),
                  backgroundColor: const Color(0xFF08A4BB),
                  isShadowBottomLeft: true,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
