import 'package:flutter/material.dart';
import 'package:myco_flutter/constants/constants.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/asset/presentation/widgets/custom_dash_line.dart';
import 'package:myco_flutter/features/asset/presentation/widgets/image_gredal.dart';
import 'package:myco_flutter/widgets/cached_image_holder.dart';
import 'package:myco_flutter/widgets/common_card.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

// class AssetsListPage extends StatelessWidget {
//   const AssetsListPage({super.key});

//   @override
//   Widget build(BuildContext context) => SliverPadding(
//     padding: EdgeInsets.symmetric(
//       horizontal: 0.04 * Responsive.getWidth(context),
//     ),
//     sliver: SliverList.separated(
//       itemCount: 8,
//       separatorBuilder: (_, __) =>
//           SizedBox(height: 0.02 * Responsive.getHeight(context)),
//       itemBuilder: (_, index) => const ActiveAssetsCard(
//         title: 'Laptop',
//         subTitle: '(AS101)',
//         image: AppAssets.imageLaptop,
//         brand: 'Dell',
//         srNo: 'DELL123456',
//         handOverDate: '01-01-2024',
//         handoverImageList: [
//           'https://images.pexels.com/photos/443446/pexels-photo-443446.jpeg',
//           'https://images.pexels.com/photos/640781/pexels-photo-640781.jpeg',
//           AppAssets.imageLaptop,
//           AppAssets.imageLaptop,
//         ],
//       ),
//     ),
//   );
// }

class ActiveAssetsCard extends StatelessWidget {
  final String title;
  final String subTitle;
  final String image;
  final String brand;
  final String srNo;
  final String handOverDate;
  final EdgeInsetsGeometry? childPadding;
  final List<String> handoverImageList;
  final double? spaceBetweenData;
  final Color? titleColor;
  final Color? dashLineColor;
  final Key? mainImageKey, imageKey;
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
    required this.handoverImageList,
    this.mainImageKey,
    this.imageKey,
  });

  @override
  Widget build(BuildContext context) => CommonCard(
    showBlackShadowInChild: true,
    title: title,
    subTitle: subTitle,
    headerColor: titleColor,
    borderColor: AppTheme.lightTheme(context).dividerColor,
    bottomWidget: Padding(
      padding:
          childPadding ??
          EdgeInsets.symmetric(
            horizontal:
                VariableBag.commonCardHorizontalPadding *
                Responsive.getResponsive(context),
            vertical:
                VariableBag.commonCardVerticalPadding *
                Responsive.getResponsive(context),
          ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if (image.startsWith('http') || image.startsWith('https'))
                  CachedImage(
                    key: mainImageKey,
                    imageUrl: image,
                    width: 0.3 * Responsive.getWidth(context),
                    height: 0.3 * Responsive.getWidth(context),
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
                      if (handoverImageList.isEmpty)
                        SizedBox(
                          height:
                              spaceBetweenData ??
                              0.02 * Responsive.getHeight(context),
                        ),
                      if (handoverImageList.isEmpty)
                        AssetsVerticalData(
                          title: 'handover',
                          data: handOverDate,
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          if (handoverImageList.isNotEmpty)
            SizedBox(
              height: spaceBetweenData ?? 0.02 * Responsive.getHeight(context),
            ),
          if (handoverImageList.isNotEmpty)
            Row(
              children: [
                SizedBox(
                  width: 0.3 * Responsive.getWidth(context),
                  child: AssetsVerticalData(
                    title: 'handover',
                    data: handOverDate,
                  ),
                ),
                const Spacer(),
                ImageGridPreviewWidget(
                  key: imageKey,
                  boxHeight: 0.14 * Responsive.getWidth(context),
                  boxWidth: 0.14 * Responsive.getWidth(context),
                  borderRadius: 10 * Responsive.getResponsive(context),
                  imageList: handoverImageList,
                ),
              ],
            ),
        ],
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
        title,
        color: titleColor,
        fontSize: 14 * Responsive.getResponsiveText(context),
        fontWeight: FontWeight.w700,
        fontStyle: titleFontStyle,
      ),
      CustomText(
        data,
        fontWeight: FontWeight.w500,
        fontSize: 14 * Responsive.getResponsiveText(context),
      ),
    ],
  );
}
