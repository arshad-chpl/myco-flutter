import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myco_flutter/constants/app_assets.dart';
import 'package:myco_flutter/constants/constants.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/asset/presentation/widgets/active_assets_card.dart';
import 'package:myco_flutter/features/asset/presentation/widgets/image_gredal.dart';
import 'package:myco_flutter/features/my_visit/presentation/widgets/dashed_border_container.dart';
import 'package:myco_flutter/widgets/cached_image_holder.dart';
import 'package:myco_flutter/widgets/common_card.dart';
import 'package:myco_flutter/widgets/custom_appbar.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

class AssetsDetailsPage extends StatelessWidget {
  const AssetsDetailsPage({super.key});

  @override
  // ignore: prefer_expression_function_bodies
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: 'assets_details',
        titleSpacing: 0,
        actions: [
          GestureDetector(
            onTap: () => context.push('/handover-assets'),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.add,
                  size: 0.035 * Responsive.getWidth(context),
                  color: AppTheme.getColor(context).onSurface,
                ),
                CustomText(
                  'handover_assets',
                  fontSize: 16 * Responsive.getResponsiveText(context),
                  fontWeight: FontWeight.w600,
                ),
              ],
            ),
          ),
        ],
        actionsPadding: EdgeInsets.only(
          right:
              VariableBag.screenHorizontalPadding *
              Responsive.getResponsive(context),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal:
              VariableBag.screenHorizontalPadding *
              Responsive.getResponsive(context),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              //
              detailsCard(context),
              SizedBox(
                height:
                    VariableBag.formContentSpacingVertical *
                    Responsive.getResponsive(context),
              ),

              // -- Assets History --
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(
                  VariableBag.commonContainerPadding *
                      Responsive.getResponsive(context),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    12 * Responsive.getResponsive(context),
                  ),
                  boxShadow: [
                    const BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0, 2),
                      blurRadius: 4,
                    ),
                    BoxShadow(
                      color: AppTheme.getColor(context).primary.withAlpha(180),
                    ),
                    BoxShadow(
                      color: AppTheme.getColor(context).primary,
                      offset: const Offset(1, 4),
                      spreadRadius: -6.0,
                      blurRadius: 6.0,
                    ),
                  ],
                ),
                child: CustomText(
                  'assets_history',
                  color: AppTheme.getColor(context).onPrimary,
                  fontSize: 18 * Responsive.getResponsiveText(context),
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height:
                    VariableBag.formContentSpacingVertical *
                    Responsive.getResponsive(context),
              ),

              // -- First Box --
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: AppTheme.getColor(context).outline),
                  borderRadius: BorderRadius.circular(
                    12 * Responsive.getResponsive(context),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(
                        VariableBag.commonContainerPadding *
                            Responsive.getResponsive(context),
                      ),
                      child: profileRowData(
                        context: context,
                        image:
                            'https://images.pexels.com/photos/443446/pexels-photo-443446.jpeg',
                        title: 'Mukund Madhav',
                        subTitle: 'QA',
                        address: 'QA Technical - Junagadh',
                      ),
                    ),
                    Divider(
                      color: AppTheme.getColor(context).outline,
                      height: 0,
                    ),
                    Padding(
                      padding: EdgeInsets.all(
                        VariableBag.commonContainerPadding *
                            Responsive.getResponsive(context),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: 0.34 * Responsive.getWidth(context),
                                child: const AssetsVerticalData(
                                  title: 'handover',
                                  data: '02-05-2025',
                                ),
                              ),
                              const Spacer(),
                              ImageGridPreviewWidget(
                                boxHeight: 0.14 * Responsive.getWidth(context),
                                boxWidth: 0.14 * Responsive.getWidth(context),
                                borderRadius: 10,
                                imageList: const [
                                  'https://images.pexels.com/photos/443446/pexels-photo-443446.jpeg',
                                  'https://images.pexels.com/photos/640781/pexels-photo-640781.jpeg',
                                  AppAssets.imageLaptop,
                                  AppAssets.imageLaptop,
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 0.015 * Responsive.getHeight(context),
                          ),
                          Row(
                            children: [
                              const Spacer(),
                              MyCoButton(
                                onTap: () => context.push('/takeover-assets'),
                                title: 'Takeover Assets',
                                textStyle: TextStyle(
                                  fontFamily: 'Gilroy-semiBold',
                                  fontSize:
                                      12 *
                                      Responsive.getResponsiveText(context),
                                  color: AppTheme.getColor(context).onPrimary,
                                ),

                                width: 0.3 * Responsive.getWidth(context),
                                height: 0.08 * Responsive.getWidth(context),
                                boarderRadius:
                                    50 * Responsive.getResponsive(context),
                                isShadowBottomLeft: true,
                              ),
                              const SizedBox(width: 10),
                              MyCoButton(
                                onTap: () => context.push('/swap-assets'),
                                title: 'Swap',
                                textStyle: TextStyle(
                                  fontFamily: 'Gilroy-semiBold',
                                  fontSize:
                                      12 *
                                      Responsive.getResponsiveText(context),
                                  color: AppTheme.getColor(context).onPrimary,
                                ),

                                width: 0.28 * Responsive.getWidth(context),
                                height: 0.08 * Responsive.getWidth(context),
                                boarderRadius:
                                    50 * Responsive.getResponsive(context),
                                borderColor: const Color(0xFF08A4BB),
                                backgroundColor: const Color(0xFF08A4BB),
                                isShadowBottomLeft: true,
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
                height:
                    VariableBag.formContentSpacingVertical *
                    Responsive.getResponsive(context),
              ),

              // -- Second Box --
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: AppTheme.getColor(context).outline),
                  borderRadius: BorderRadius.circular(
                    12 * Responsive.getResponsive(context),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(
                        VariableBag.commonContainerPadding *
                            Responsive.getResponsive(context),
                      ),
                      child: profileRowData(
                        context: context,
                        image:
                            'https://images.pexels.com/photos/443446/pexels-photo-443446.jpeg',
                        title: 'Mukund Madhav',
                        subTitle: 'QA',
                        address: 'QA Technical - Junagadh',
                      ),
                    ),
                    Divider(
                      color: AppTheme.getColor(context).outline,
                      height: 0,
                    ),
                    Padding(
                      padding: EdgeInsets.all(
                        VariableBag.commonContainerPadding *
                            Responsive.getResponsive(context),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: 0.34 * Responsive.getWidth(context),
                                child: const AssetsVerticalData(
                                  title: 'handover',
                                  data: '02-05-2025',
                                ),
                              ),
                              const Spacer(),
                              ImageGridPreviewWidget(
                                boxHeight: 0.14 * Responsive.getWidth(context),
                                boxWidth: 0.14 * Responsive.getWidth(context),
                                borderRadius: 10,
                                imageList: const [
                                  'https://images.pexels.com/photos/443446/pexels-photo-443446.jpeg',
                                  'https://images.pexels.com/photos/640781/pexels-photo-640781.jpeg',
                                  AppAssets.imageLaptop,
                                  AppAssets.imageLaptop,
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 0.015 * Responsive.getHeight(context),
                          ),

                          Row(
                            children: [
                              SizedBox(
                                width: 0.34 * Responsive.getWidth(context),
                                child: const AssetsVerticalData(
                                  title: 'takeover',
                                  data: '02-05-2025',
                                ),
                              ),
                              const Spacer(),
                              ImageGridPreviewWidget(
                                boxHeight: 0.14 * Responsive.getWidth(context),
                                boxWidth: 0.14 * Responsive.getWidth(context),
                                borderRadius: 10,
                                imageList: const [
                                  'https://images.pexels.com/photos/443446/pexels-photo-443446.jpeg',
                                  'https://images.pexels.com/photos/640781/pexels-photo-640781.jpeg',
                                  AppAssets.imageLaptop,
                                  AppAssets.imageLaptop,
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 0.015 * Responsive.getHeight(context),
                          ),
                          const AssetsVerticalData(
                            title: 'takeover_by',
                            data: 'Parth Jadav',
                            titleFontStyle: FontStyle.italic,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height:
                    VariableBag.formContentSpacingVertical *
                    Responsive.getResponsive(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget rowData({
    required BuildContext context,
    required String title,
    required String data,
  }) => Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(
        width: 0.35 * Responsive.getWidth(context),
        child: CustomText(
          title,
          color: AppTheme.getColor(context).onSurface,
          fontWeight: FontWeight.w700,
          fontSize: 14 * Responsive.getResponsiveText(context),
        ),
      ),
      CustomText(
        ' :   ',
        fontWeight: FontWeight.w700,
        color: AppTheme.getColor(context).onSurface,
        fontSize: 14 * Responsive.getResponsiveText(context),
      ),
      Expanded(
        child: CustomText(
          data,
          color: AppTheme.getColor(context).outline,
          fontWeight: FontWeight.w500,
          fontSize: 14 * Responsive.getResponsiveText(context),
        ),
      ),
    ],
  );

  Widget detailsCard(BuildContext context) => CommonCard(
    title: 'HP AS112',
    showBlackShadowInChild: true,
    suffixIcon: Row(
      children: [
        GestureDetector(
          // onTap: onEditTap,
          onTap: () => context.push('/edit-assets'),
          child: Image.asset(
            AppAssets.imageMassageEdit,
            color: AppTheme.getColor(context).onPrimary,
            width: 0.07 * Responsive.getWidth(context),
          ),
        ),
        SizedBox(width: 0.045 * Responsive.getWidth(context)),
        GestureDetector(
          // onTap: onScannerTap,
          child: Image.asset(
            AppAssets.imageScanner,
            width: 0.07 * Responsive.getWidth(context),
            color: AppTheme.getColor(context).onPrimary,
          ),
        ),
      ],
    ),
    bottomWidget: Padding(
      padding: EdgeInsets.symmetric(
        horizontal:
            VariableBag.commonCardHorizontalPadding *
            Responsive.getResponsive(context),
        vertical:
            VariableBag.commonCardVerticalPadding *
            Responsive.getResponsive(context),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 0.02 * Responsive.getHeight(context)),
          Container(
            width: 0.35 * Responsive.getWidth(context),
            height: 0.35 * Responsive.getWidth(context),
            padding: EdgeInsets.all(12 * Responsive.getResponsive(context)),
            decoration: BoxDecoration(
              color: Colors.black26,
              borderRadius: BorderRadius.circular(
                12 * Responsive.getResponsive(context),
              ),
            ),
            child: Center(child: Image.asset(AppAssets.imageLaptop)),
          ),
          SizedBox(height: 0.02 * Responsive.getHeight(context)),
          Row(
            children: [
              SizedBox(
                width: 0.32 * Responsive.getWidth(context),
                child: const AssetsVerticalData(
                  title: 'created_by',
                  data: 'Parth Jadav',
                  titleFontStyle: FontStyle.italic,
                ),
              ),
              // const SizedBox(width: 4),
              const Expanded(
                child: AssetsVerticalData(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  title: 'created_date',
                  data: '22nd May 2025, 06:30 PM',
                  titleFontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
          Divider(
            color: AppTheme.getColor(context).secondary,
            height: 25 * Responsive.getResponsive(context),
          ),
          rowData(context: context, title: 'category', data: 'Desktop'),
          SizedBox(height: 0.012 * Responsive.getHeight(context)),
          rowData(context: context, title: 'brand_name', data: 'Dell'),
          SizedBox(height: 0.012 * Responsive.getHeight(context)),
          rowData(context: context, title: 'sr_no', data: 'sansxbnaisn'),
          SizedBox(height: 0.012 * Responsive.getHeight(context)),
          rowData(context: context, title: 'purchase_date', data: '21-05-2025'),
          SizedBox(height: 0.012 * Responsive.getHeight(context)),
          rowData(context: context, title: 'item_price', data: '₹ 500.00'),
          Divider(
            color: AppTheme.getColor(context).secondary,
            height: 25 * Responsive.getResponsive(context),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Expanded(
                child: AssetsVerticalData(
                  title: 'created_by',
                  data: 'Parth Jadav',
                  titleFontStyle: FontStyle.italic,
                ),
              ),
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(
                          20 * Responsive.getResponsive(context),
                        ),
                      ),
                    ),
                    // isScrollControlled: true,
                    builder: (context) => Padding(
                      padding: EdgeInsets.all(
                        16 * Responsive.getResponsive(context),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CustomText(
                            'attachment',
                            fontSize:
                                20 * Responsive.getResponsiveText(context),
                            fontWeight: FontWeight.w600,
                            color: AppTheme.getColor(context).onSurfaceVariant,
                          ),
                          SizedBox(
                            height: 0.012 * Responsive.getHeight(context),
                          ),
                          CustomPaint(
                            painter: DashedBorderPainter(
                              color: AppColors.primary,
                              radius: 12 * Responsive.getResponsive(context),
                            ),
                            child: Container(
                              width: 0.35 * Responsive.getWidth(context),
                              decoration: BoxDecoration(
                                color: const Color(0xFFEEF7FD),
                                borderRadius: BorderRadius.circular(
                                  13 * Responsive.getResponsive(context),
                                ),
                              ),
                              padding: EdgeInsets.all(
                                12 * Responsive.getResponsive(context),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    width: 0.3 * Responsive.getWidth(context),
                                    height: 0.3 * Responsive.getWidth(context),
                                    padding: EdgeInsets.all(
                                      12 * Responsive.getResponsive(context),
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.black26,
                                      borderRadius: BorderRadius.circular(
                                        12 * Responsive.getResponsive(context),
                                      ),
                                    ),
                                    child: Center(
                                      child: Image.asset(AppAssets.imageLaptop),
                                    ),
                                  ),
                                  SizedBox(
                                    height:
                                        0.01 * Responsive.getHeight(context),
                                  ),
                                  CustomText(
                                    'file_name',
                                    maxLines: 1,
                                    fontSize:
                                        14 *
                                        Responsive.getResponsiveText(context),
                                    fontWeight: FontWeight.w600,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 0.012 * Responsive.getHeight(context),
                          ),
                          // Submit Button
                          Padding(
                            padding: EdgeInsets.only(
                              top: 12.0 * Responsive.getResponsive(context),
                            ),
                            child: MyCoButton(
                              onTap: () {},
                              title: 'Close',
                              isShadowBottomLeft: true,
                              boarderRadius:
                                  50 * Responsive.getResponsive(context),
                              fontFamily: 'Gilroy-Bold',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                child: CustomText(
                  'invoice',
                  fontWeight: FontWeight.w700,
                  color: AppTheme.getColor(context).primary,
                  decoration: TextDecoration.underline,
                  decorationColor: AppTheme.getColor(context).primary,
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );

  Widget profileRowData({
    required BuildContext context,
    required String image,
    required String title,
    required String subTitle,
    required String address,
  }) => Row(
    children: [
      Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              offset: Offset(2, 1),
              color: Colors.black26,
              blurRadius: 4,
            ),
          ],
        ),
        child: CircleAvatar(
          radius: 0.06 * Responsive.getWidth(context),
          child: ClipOval(
            child: image.startsWith('http')
                ? CachedImage(
                    imageUrl: image,
                    width: 0.34 * Responsive.getWidth(context),
                    height: 0.34 * Responsive.getWidth(context),
                  )
                : Image.asset(
                    image,
                    fit: BoxFit.cover,
                    width: 0.34 * Responsive.getWidth(context),
                    height: 0.34 * Responsive.getWidth(context),
                  ),
          ),
        ),
      ),
      const SizedBox(width: 12),
      Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            title,
            fontSize: 16 * Responsive.getResponsiveText(context),
            fontWeight: FontWeight.w700,
            color: AppTheme.getColor(context).primary,
          ),
          CustomText(
            subTitle,
            fontSize: 12 * Responsive.getResponsiveText(context),
            fontWeight: FontWeight.w600,
            color: AppTheme.getColor(context).onSurfaceVariant,
          ),
          CustomText(
            address,
            fontSize: 12 * Responsive.getResponsiveText(context),
            fontWeight: FontWeight.w600,
            color: AppTheme.getColor(context).onSurfaceVariant,
          ),
        ],
      ),
    ],
  );
}
