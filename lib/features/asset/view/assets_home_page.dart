import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/asset/view/qr_scanner_page.dart';
import 'package:myco_flutter/features/asset/widgets/active_assets_card.dart';
import 'package:myco_flutter/features/asset/widgets/all_assets_card.dart';
import 'package:myco_flutter/features/asset/widgets/assets_bottom_sheet.dart';
import 'package:myco_flutter/features/asset/widgets/assets_holder_bottom_sheet.dart';
import 'package:myco_flutter/features/asset/widgets/past_assets_card.dart';
import 'package:myco_flutter/widgets/custom_myco_tabbar.dart';
import 'package:myco_flutter/widgets/custom_text.dart';
import 'package:myco_flutter/widgets/custom_text_field.dart';

class AssetsHomePage extends StatefulWidget {
  const AssetsHomePage({super.key});

  @override
  State<AssetsHomePage> createState() => _AssetsHomePageState();
}

class _AssetsHomePageState extends State<AssetsHomePage> {
  int selectedIndex = 0;
  String allCategory = 'All Category';
  String allBrand = 'All Brand';

  @override
  Widget build(BuildContext context) => SafeArea(
    child: SafeArea(
      child: Scaffold(
        backgroundColor: AppTheme.getColor(context).surface,
        appBar: AppBar(
          title: CustomText(
            'Assets',
            fontSize: 22 * Responsive.getResponsiveText(context),
            fontWeight: FontWeight.w700,
          ),
          titleSpacing: 0,
          leading: const BackButton(),
          backgroundColor: AppTheme.getColor(context).surface,
          actions: [
            GestureDetector(
              onTap: () {
                showAssetsHoldersBottomSheet(context: context);
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.add,
                    size: 0.035 * Responsive.getWidth(context),
                    color: AppTheme.getColor(context).onSurface,
                  ),
                  CustomText(
                    'Add Assets',
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
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 70,
              backgroundColor: AppTheme.getColor(context).surface,
              floating: true,
              snap: true,
              automaticallyImplyLeading: false,
              titleSpacing: 0,
              title: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 0.04 * Responsive.getWidth(context),
                ),
                child: MyCoTextfield(
                  hintText: 'Search',
                  textAlignment: TextAlign.start,
                  hintTextStyle: AppTheme.getTextStyle(
                    context,
                  ).labelLarge!.copyWith(color: AppColors.textSecondary),
                  preFixImage: 'assets/images/search.png',
                  isSuffixIconOn: true,
                  suFixImage: 'assets/images/scan.png',
                  suFixImageWidth: 25,
                  onTap1: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const QRScannerPage(),
                    ),
                  ),
                  contentPadding: EdgeInsets.only(
                    top: 0.012 * Responsive.getHeight(context),
                  ),
                  boarderRadius: 12 * Responsive.getResponsive(context),
                ),
              ),
            ),

            // Pinned TabBar
            SliverPersistentHeader(
              pinned: true,
              delegate: _SliverTabBarDelegate(
                height: 60,
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 0.04 * Responsive.getWidth(context),
                    right: 0.04 * Responsive.getWidth(context),
                    bottom: 0.015 * Responsive.getHeight(context),
                  ),
                  child: MyCustomTabBar(
                    isShadowBottomLeft: true,
                    tabBarBorderColor: AppTheme.getColor(context).outline,
                    selectedBgColors: [
                      AppTheme.getColor(context).secondary,
                      AppTheme.getColor(context).primary,
                      const Color(0xFF08A4BB),
                    ],
                    selectedIndex: selectedIndex,
                    tabs: const [
                      'Active Assets (3)',
                      'Past Assets (2)',
                      'All Assets (2)',
                    ],
                    onTabChange: (int index) {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    unselectedBorderAndTextColor: AppTheme.getColor(
                      context,
                    ).outline,
                  ),
                ),
              ),
            ),

            // Asset List
            ..._buildAssetListByTab(),
            // SliverPadding(
            //   padding: EdgeInsets.symmetric(horizontal: 0.04 * Responsive.getWidth(context)),
            //   sliver: SliverList.separated(
            //     itemCount: 5,
            //     separatorBuilder: (context, index) =>
            //         SizedBox(height: 0.02 * Responsive.getHeight(context)),
            //     itemBuilder: (context, index) => const ActiveAssetsCard(
            //       title: 'Desktop',
            //       subTitle: '(AS100)',
            //       image: 'assets/images/laptop.png',
            //       brand: 'Acer',
            //       srNo: 'KJABLDBLDUE',
            //       handOverDate: '02-05-2025',
            //     ),
            //   ),
            // ),

            // Extra spacing at the bottom
            SliverToBoxAdapter(
              child: SizedBox(height: 0.02 * Responsive.getHeight(context)),
            ),
          ],
        ),
      ),
    ),
  );

  List<Widget> _buildAssetListByTab() {
    switch (selectedIndex) {
      case 0: // Active Assets
        return [
          SliverPadding(
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
                image: 'assets/images/laptop.png',
                brand: 'Dell',
                srNo: 'DELL123456',
                handOverDate: '01-01-2024',
              ),
            ),
          ),
        ];

      case 1: // Past Assets
        return [
          SliverPadding(
            padding: EdgeInsets.symmetric(
              horizontal: 0.04 * Responsive.getWidth(context),
            ),
            sliver: SliverList.separated(
              itemCount: 5,
              separatorBuilder: (_, __) =>
                  SizedBox(height: 0.02 * Responsive.getHeight(context)),
              itemBuilder: (_, index) => const PastAssetsCard(
                title: 'Desktop',
                subTitle: '(AS101)',
                image: 'assets/images/laptop.png',
                brand: 'HP',
                srNo: 'DELL123456',
                handover: '02-05-2025',
                takeover: '02-05-2025',
                handoverImageList: [
                  'https://images.pexels.com/photos/443446/pexels-photo-443446.jpeg',
                  'https://images.pexels.com/photos/640781/pexels-photo-640781.jpeg',
                  'assets/images/laptop.png',
                  'assets/images/laptop.png',
                ],
                takeoverImageList: [
                  'https://images.pexels.com/photos/443446/pexels-photo-443446.jpeg',
                  'https://images.pexels.com/photos/640781/pexels-photo-640781.jpeg',
                  'assets/images/laptop.png',
                  'assets/images/laptop.png',
                ],
              ),
            ),
          ),
        ];

      case 2: // All Assets
        return [
          SliverPadding(
            padding: EdgeInsets.symmetric(
              horizontal: 0.04 * Responsive.getWidth(context),
            ),
            sliver: SliverPersistentHeader(
              pinned: true,
              delegate: _SliverTabBarDelegate(
                height: 60,
                child: Row(
                  children: [
                    Expanded(
                      child: DropDownButton(
                        title: allCategory, //'All Category',
                        onTap: () async {
                          final data = await showAssetsBottomSheet(
                            context: context,
                            heading: 'Select Category',
                            dataList: const [
                              'All Category',
                              'Desktop',
                              'Laptop',
                              'Mobile',
                              'Tab',
                              'Test Assets',
                            ],
                          );
                          log('Selected category: $data');
                          setState(() {
                            if (data != null) {
                              allCategory = data;
                            }
                          });
                        },
                      ),
                    ),
                    SizedBox(width: 0.06 * Responsive.getWidth(context)),
                    Expanded(
                      child: DropDownButton(
                        title: allBrand, // 'All Brand',
                        onTap: () async {
                          final data = await showAssetsBottomSheet(
                            context: context,
                            heading: 'Select Brand',
                            dataList: const [
                              'All Brand',
                              'Apple',
                              'Asus',
                              'Samsung',
                              'Acer',
                              'HP',
                            ],
                          );
                          log('Selected category: $data');
                          setState(() {
                            if (data != null) {
                              allBrand = data;
                            }
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 10)),
          SliverPadding(
            padding: EdgeInsets.symmetric(
              horizontal: 0.04 * Responsive.getWidth(context),
            ),
            sliver: SliverList.separated(
              itemCount: 10,
              separatorBuilder: (_, __) =>
                  SizedBox(height: 0.02 * Responsive.getHeight(context)),
              itemBuilder: (_, index) {
                if (index % 2 != 0) {
                  return AllAssetsCard(
                    title: 'Desktop',
                    subTitle: '(AS101)',
                    image: 'assets/images/laptop.png',
                    brand: 'HP',
                    srNo: 'DELL123456',
                    category: 'Desktop',
                    createdBy: 'Parth Jadav',
                    custodian: 'Arth Sorthiya',
                    onViewDetailsTap: () => context.push('/assets-details'),
                  );
                } else {
                  return AllAssetsCard(
                    title: 'Desktop',
                    subTitle: '(AS101)',
                    image: 'assets/images/laptop.png',
                    brand: 'Dell',
                    srNo: 'DELL123456',
                    category: 'Desktop',
                    createdBy: 'Parth Jadav',
                    onViewDetailsTap: () => context.push('/assets-details'),
                  );
                }
              },
            ),
          ),
        ];
      //   SliverPadding(
      //     padding: EdgeInsets.symmetric(
      //       horizontal: 0.04 * Responsive.getWidth(context),
      //     ),
      //     sliver: Column(
      //       mainAxisSize: MainAxisSize.min,
      //       children: [
      //         Container(
      //           decoration: BoxDecoration(
      //             border: Border.all(color: Colors.black),
      //           ),
      //           child: CustomText('All Category'),
      //         ),
      //         Expanded(
      //           child: SliverList.separated(
      //             itemCount: 10,
      //             separatorBuilder: (_, __) =>
      //                 SizedBox(height: 0.02 * Responsive.getHeight(context)),
      //             itemBuilder: (_, index) {
      //               if (index % 2 != 0) {
      //                 return const AllAssetsCard(
      //                   title: 'Desktop',
      //                   subTitle: '(AS101)',
      //                   image: 'assets/images/laptop.png',
      //                   brand: 'HP',
      //                   srNo: 'DELL123456',
      //                   category: 'Desktop',
      //                   createdBy: 'Parth Jadav',
      //                   custodian: 'Arth Sorthiya',
      //                 );
      //               } else {
      //                 return AllAssetsCard(
      //                   title: 'Desktop',
      //                   subTitle: '(AS101)',
      //                   image: 'assets/images/laptop.png',
      //                   brand: 'Dell',
      //                   srNo: 'DELL123456',
      //                   category: 'Desktop',
      //                   createdBy: 'Parth Jadav',
      //                   onViewDetailsTap: () => print('on Tap'),
      //                 );
      //               }
      //             },
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      // ];

      default:
        return [];
    }
  }

  Widget DropDownButton({required String title, required VoidCallback onTap}) =>
      GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: 8 * Responsive.getResponsive(context),
            horizontal: 6 * Responsive.getResponsive(context),
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              10 * Responsive.getResponsive(context),
            ),
            border: Border.all(color: AppTheme.getColor(context).secondary),
          ),
          child: Row(
            children: [
              Expanded(
                child: CustomText(
                  title,
                  fontWeight: FontWeight.w600,
                  color: AppTheme.getColor(context).secondary,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Icon(
                Icons.keyboard_arrow_down,
                color: AppTheme.getColor(context).secondary,
              ),
            ],
          ),
        ),
      );
}

class _SliverTabBarDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;
  final double height;

  _SliverTabBarDelegate({required this.child, required this.height});

  @override
  double get minExtent => height; // or exact height of your tab bar
  @override
  double get maxExtent => height;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) => Material(
    color: AppTheme.getColor(context).surface,
    elevation: overlapsContent ? 1 : 0,
    child: SizedBox(height: height, child: child),
  );

  @override
  bool shouldRebuild(covariant _SliverTabBarDelegate oldDelegate) =>
      child != oldDelegate.child || height != oldDelegate.height;
}
