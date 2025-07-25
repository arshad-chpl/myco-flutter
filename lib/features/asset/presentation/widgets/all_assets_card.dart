import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myco_flutter/constants/app_assets.dart';
import 'package:myco_flutter/constants/constants.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/asset/presentation/widgets/active_assets_card.dart';
import 'package:myco_flutter/features/asset/presentation/widgets/assets_holder_bottom_sheet.dart';
import 'package:myco_flutter/features/asset/presentation/widgets/custom_dash_line.dart';
import 'package:myco_flutter/widgets/cached_image_holder.dart';
import 'package:myco_flutter/widgets/common_card.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';

// class AllAssetsListPage extends StatelessWidget {
//   const AllAssetsListPage({super.key});

//   @override
//   Widget build(BuildContext context) => SliverPadding(
//     padding: EdgeInsets.symmetric(
//       horizontal:
//           VariableBag.screenHorizontalPadding *
//           Responsive.getResponsive(context),
//     ),
//     sliver: SliverList.separated(
//       itemCount: 10,
//       separatorBuilder: (_, __) =>
//           SizedBox(height: 0.02 * Responsive.getHeight(context)),
//       itemBuilder: (_, index) {
//         return AllAssetsCard(
//           title: 'Desktop',
//           subTitle: '(AS101)',
//           image: AppAssets.imageLaptop,
//           brand: 'HP',
//           srNo: 'DELL123456',
//           category: 'Desktop',
//           createdBy: 'Parth Jadav',
//           custodian: 'Arth Sorthiya',
//           onViewDetailsTap: () => context.push('/assets-details'),
//           onEditTap: () => context.push('/edit-assets'),
//           onScannerTap: () => showAssetsHoldersBottomSheet(
//             context: context,
//             handoverImageList: [
//               'https://images.pexels.com/photos/443446/pexels-photo-443446.jpeg',
//               'https://images.pexels.com/photos/640781/pexels-photo-640781.jpeg',
//               AppAssets.imageLaptop,
//               AppAssets.imageLaptop,
//             ],
//             image: AppAssets.imageLaptop,
//           ),
//         );
//       },
//     ),
//   );
// }

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
  final VoidCallback? onEditTap;
  final VoidCallback? onScannerTap;
  final VoidCallback? onViewDetailsTap;
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
    this.onViewDetailsTap,
    this.onEditTap,
    this.onScannerTap,
  });

  @override
  // ignore: prefer_expression_function_bodies
  Widget build(BuildContext context) {
    return CommonCard(
      title: title,
      subTitle: subTitle,
      headerColor: const Color(0xFF08A4BB),
      borderColor: AppTheme.lightTheme(context).dividerColor,
      suffixIcon: Row(
        children: [
          GestureDetector(
            onTap: onEditTap,
            child: Image.asset(
              AppAssets.imageMassageEdit,
              width: 0.07 * Responsive.getWidth(context),
              color: AppTheme.getColor(context).onPrimary,
            ),
          ),
          SizedBox(
            width:
                VariableBag.buttonRowSpacing *
                Responsive.getResponsive(context),
          ),
          GestureDetector(
            onTap: onScannerTap,
            child: Image.asset(
              AppAssets.imageScanner,
              width: 0.07 * Responsive.getWidth(context),
              color: AppTheme.getColor(context).onPrimary,
            ),
          ),
        ],
      ),
      showBlackShadowInChild: true,
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
                  if (image.startsWith('http') ||
                      image.startsWith('https') ||
                      image.isEmpty)
                    CachedImage(
                      imageUrl: image,
                      fit: BoxFit.contain,
                      width: 0.3 * Responsive.getWidth(context),
                      height: 0.15 * Responsive.getHeight(context),
                      errorWidget: SizedBox(
                        width: 0.3 * Responsive.getWidth(context),
                        height: 0.3 * Responsive.getWidth(context),
                        child: Icon(
                          Icons.broken_image_rounded,
                          size: 60 * Responsive.getResponsive(context),
                        ),
                      ),
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
                        IntrinsicHeight(
                          child: Row(
                            children: [
                              Expanded(
                                child: AssetsVerticalData(
                                  title: 'brand',
                                  data: brand,
                                ),
                              ),
                              VerticalDivider(
                                width: 0.08 * Responsive.getWidth(context),
                                color: AppTheme.getColor(context).primary,
                                thickness: 0.8,
                              ),
                              Expanded(
                                child: AssetsVerticalData(
                                  title: 'brand',
                                  data: brand,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height:
                              spaceBetweenData ??
                              0.02 * Responsive.getHeight(context),
                        ),
                        AssetsVerticalData(title: 'sr_no', data: srNo),
                        if (custodian != null)
                          SizedBox(
                            height:
                                spaceBetweenData ??
                                0.02 * Responsive.getHeight(context),
                          ),
                        if (custodian != null &&
                            (custodian?.isNotEmpty ?? true))
                          AssetsVerticalData(
                            title: 'custodian',
                            data: custodian ?? '',
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
            Row(
              children: [
                Expanded(
                  child: AssetsVerticalData(
                    title: 'created_by',
                    data: createdBy,
                    titleFontStyle: FontStyle.italic,
                  ),
                ),
                MyCoButton(
                  onTap: onViewDetailsTap,
                  title: 'View Details',
                  textStyle: TextStyle(
                    fontFamily: 'Gilroy-semiBold',
                    fontSize: 12 * Responsive.getResponsiveText(context),
                    color: AppTheme.getColor(context).onPrimary,
                  ),
                  width: 0.26 * Responsive.getWidth(context),
                  height: 0.09 * Responsive.getWidth(context),
                  boarderRadius: 50 * Responsive.getResponsive(context),
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
