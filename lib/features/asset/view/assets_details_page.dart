import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/asset/widgets/active_assets_card.dart';
import 'package:myco_flutter/features/asset/widgets/image_gredal.dart';
import 'package:myco_flutter/widgets/common_card.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

class AssetsDetailsPage extends StatelessWidget {
  const AssetsDetailsPage({super.key});

  @override
  // ignore: prefer_expression_function_bodies
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: CustomText(
            'Assets Details',
            fontSize: 22 * Responsive.getResponsiveText(context),
            fontWeight: FontWeight.w700,
          ),
          titleSpacing: 0,
          leading: const BackButton(),
          backgroundColor: AppTheme.getColor(context).surface,
          actions: [
            GestureDetector(
              onTap: () {},
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.add,
                    size: 0.035 * Responsive.getWidth(context),
                    color: AppTheme.getColor(context).onSurface,
                  ),
                  CustomText(
                    'Handover Assets',
                    fontSize: 16 * Responsive.getResponsiveText(context),
                    fontWeight: FontWeight.w600,
                  ),
                ],
              ),
            ),
          ],
          actionsPadding: EdgeInsets.only(
            right: 0.04 * Responsive.getWidth(context),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 0.04 * Responsive.getWidth(context),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                detailsCard(context),
                SizedBox(height: 0.03 * Responsive.getHeight(context)),

                // -- Assets History --
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(
                    16 * Responsive.getResponsive(context),
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
                        color: AppTheme.getColor(
                          context,
                        ).primary.withAlpha(180),
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
                    'Assets History',
                    color: AppTheme.getColor(context).onPrimary,
                    fontSize: 20 * Responsive.getResponsiveText(context),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 0.03 * Responsive.getHeight(context)),

                // -- First Box --
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppTheme.getColor(context).outline,
                    ),
                    borderRadius: BorderRadius.circular(
                      12 * Responsive.getResponsive(context),
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16 * Responsive.getResponsive(context),
                          vertical: 16 * Responsive.getResponsive(context),
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
                        padding: EdgeInsets.symmetric(
                          horizontal: 16 * Responsive.getResponsive(context),
                          vertical: 16 * Responsive.getResponsive(context),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width: 0.36 * Responsive.getWidth(context),
                                  child: const AssetsVerticalData(
                                    title: 'Handover',
                                    data: '02-05-2025',
                                  ),
                                ),
                                Expanded(
                                  child: ImageGridPreviewWidget(
                                    boxHeight:
                                        0.14 * Responsive.getWidth(context),
                                    boxWidth:
                                        0.14 * Responsive.getWidth(context),
                                    borderRadius: 10,
                                    imageList: const [
                                      'https://images.pexels.com/photos/443446/pexels-photo-443446.jpeg',
                                      'https://images.pexels.com/photos/640781/pexels-photo-640781.jpeg',
                                      'assets/images/laptop.png',
                                      'assets/images/laptop.png',
                                    ],
                                  ),
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
                                  onTap: () {},
                                  title: 'Takeover Assets',
                                  textStyle: TextStyle(
                                    fontFamily: 'Gilroy-semiBold',
                                    fontSize:
                                        14 *
                                        Responsive.getResponsiveText(context),
                                    color: AppTheme.getColor(context).onPrimary,
                                  ),

                                  width: 0.28 * Responsive.getWidth(context),
                                  height: 0.08 * Responsive.getWidth(context),
                                  boarderRadius:
                                      50 * Responsive.getResponsive(context),
                                  isShadowBottomLeft: true,
                                ),
                                const SizedBox(width: 10),
                                MyCoButton(
                                  onTap: () {},
                                  title: 'Swap',
                                  textStyle: TextStyle(
                                    fontFamily: 'Gilroy-semiBold',
                                    fontSize:
                                        14 *
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
                SizedBox(height: 0.02 * Responsive.getHeight(context)),

                // -- Second Box --
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppTheme.getColor(context).outline,
                    ),
                    borderRadius: BorderRadius.circular(
                      12 * Responsive.getResponsive(context),
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16 * Responsive.getResponsive(context),
                          vertical: 16 * Responsive.getResponsive(context),
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
                        padding: EdgeInsets.symmetric(
                          horizontal: 16 * Responsive.getResponsive(context),
                          vertical: 16 * Responsive.getResponsive(context),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width: 0.36 * Responsive.getWidth(context),
                                  child: const AssetsVerticalData(
                                    title: 'Handover',
                                    data: '02-05-2025',
                                  ),
                                ),
                                Expanded(
                                  child: ImageGridPreviewWidget(
                                    boxHeight:
                                        0.14 * Responsive.getWidth(context),
                                    boxWidth:
                                        0.14 * Responsive.getWidth(context),
                                    borderRadius: 10,
                                    imageList: const [
                                      'https://images.pexels.com/photos/443446/pexels-photo-443446.jpeg',
                                      'https://images.pexels.com/photos/640781/pexels-photo-640781.jpeg',
                                      'assets/images/laptop.png',
                                      'assets/images/laptop.png',
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 0.015 * Responsive.getHeight(context),
                            ),

                            Row(
                              children: [
                                SizedBox(
                                  width: 0.36 * Responsive.getWidth(context),
                                  child: const AssetsVerticalData(
                                    title: 'Takeover',
                                    data: '02-05-2025',
                                  ),
                                ),
                                Expanded(
                                  child: ImageGridPreviewWidget(
                                    boxHeight:
                                        0.14 * Responsive.getWidth(context),
                                    boxWidth:
                                        0.14 * Responsive.getWidth(context),
                                    borderRadius: 10,
                                    imageList: const [
                                      'https://images.pexels.com/photos/443446/pexels-photo-443446.jpeg',
                                      'https://images.pexels.com/photos/640781/pexels-photo-640781.jpeg',
                                      'assets/images/laptop.png',
                                      'assets/images/laptop.png',
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 0.015 * Responsive.getHeight(context),
                            ),
                            Text(
                              'Takeover By',
                              style: TextStyle(
                                fontFamily: 'Gilroy-Bold',
                                fontStyle: FontStyle.italic,
                                fontSize:
                                    16 * Responsive.getResponsiveText(context),
                              ),
                            ),
                            CustomText(
                              'Parth Jadav',
                              fontWeight: FontWeight.w500,
                              fontSize:
                                  16 * Responsive.getResponsiveText(context),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 0.06 * Responsive.getHeight(context)),
              ],
            ),
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
        width: 0.4 * Responsive.getWidth(context),
        child: CustomText(
          title,
          color: AppTheme.getColor(context).onSurface,
          fontWeight: FontWeight.w700,
          fontSize: 18 * Responsive.getResponsiveText(context),
        ),
      ),
      CustomText(
        ':   ',
        fontWeight: FontWeight.w700,
        color: AppTheme.getColor(context).onSurface,
        fontSize: 18 * Responsive.getResponsiveText(context),
      ),
      Expanded(
        child: CustomText(
          data,
          color: AppTheme.getColor(context).outline,
          fontWeight: FontWeight.w500,
          fontSize: 18 * Responsive.getResponsiveText(context),
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
          child: Image.asset(
            'assets/images/message-edit.png',
            width: 0.07 * Responsive.getWidth(context),
          ),
        ),
        SizedBox(width: 0.045 * Responsive.getWidth(context)),
        GestureDetector(
          // onTap: onScannerTap,
          child: Image.asset(
            'assets/images/scan.png',
            width: 0.07 * Responsive.getWidth(context),
            color: AppTheme.getColor(context).onPrimary,
          ),
        ),
      ],
    ),
    headerPadding: EdgeInsets.symmetric(
      horizontal: 16 * Responsive.getResponsive(context),
      vertical: 16 * Responsive.getResponsive(context),
    ),
    bottomWidget: Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 16 * Responsive.getResponsive(context),
        vertical: 12 * Responsive.getResponsive(context),
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
            child: Center(child: Image.asset('assets/images/laptop.png')),
          ),
          SizedBox(height: 0.02 * Responsive.getHeight(context)),
          Row(
            children: [
              SizedBox(
                width: 0.32 * Responsive.getWidth(context),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Created By',
                      style: TextStyle(
                        fontFamily: 'Gilroy-Bold',
                        fontStyle: FontStyle.italic,
                        fontSize: 18 * Responsive.getResponsiveText(context),
                      ),
                    ),
                    CustomText(
                      'Parth Jadav',
                      fontWeight: FontWeight.w500,
                      fontSize: 18 * Responsive.getResponsiveText(context),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Created Date',
                      style: TextStyle(
                        fontFamily: 'Gilroy-Bold',
                        fontStyle: FontStyle.italic,
                        fontSize: 18 * Responsive.getResponsiveText(context),
                      ),
                    ),
                    CustomText(
                      '22nd May 2025, 06:20 PM',
                      fontWeight: FontWeight.w500,
                      fontSize: 18 * Responsive.getResponsiveText(context),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Divider(
            color: AppTheme.getColor(context).secondary,
            height: 25 * Responsive.getResponsive(context),
          ),
          rowData(context: context, title: 'Category', data: 'Desktop'),
          SizedBox(height: 0.012 * Responsive.getHeight(context)),
          rowData(context: context, title: 'Brand Name', data: 'Dell'),
          rowData(
            context: context,
            title: 'Sr.No./MAC/SIM',
            data: 'sansxbnaisn',
          ),
          SizedBox(height: 0.012 * Responsive.getHeight(context)),
          rowData(context: context, title: 'Purchase Date', data: '21-05-2025'),
          SizedBox(height: 0.012 * Responsive.getHeight(context)),
          rowData(context: context, title: 'Item Price', data: '₹ 500.00'),
          Divider(
            color: AppTheme.getColor(context).secondary,
            height: 25 * Responsive.getResponsive(context),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
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
                        fontSize: 18 * Responsive.getResponsiveText(context),
                      ),
                    ),
                    CustomText(
                      'Parth Jadav',
                      fontWeight: FontWeight.w500,
                      fontSize: 18 * Responsive.getResponsiveText(context),
                    ),
                  ],
                ),
              ),
              CustomText(
                'INVOICE',
                fontWeight: FontWeight.w700,
                color: AppTheme.getColor(context).primary,
                decoration: TextDecoration.underline,
                decorationColor: AppTheme.getColor(context).primary,
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
            child: Image.network(
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
            fontSize: 20 * Responsive.getResponsiveText(context),
            fontWeight: FontWeight.w700,
            color: AppTheme.getColor(context).primary,
          ),
          CustomText(
            subTitle,
            fontSize: 16 * Responsive.getResponsiveText(context),
            fontWeight: FontWeight.w600,
            color: AppTheme.getColor(context).onSurfaceVariant,
          ),
          CustomText(
            address,
            fontSize: 16 * Responsive.getResponsiveText(context),
            fontWeight: FontWeight.w600,
            color: AppTheme.getColor(context).onSurfaceVariant,
          ),
        ],
      ),
    ],
  );
}
