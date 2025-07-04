import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/asset/view/dropdowm.dart';
import 'package:myco_flutter/features/asset/view/qr_scanner_page.dart';
import 'package:myco_flutter/features/asset/widgets/active_assets_card.dart';
import 'package:myco_flutter/features/asset/widgets/all_assets_card.dart';
import 'package:myco_flutter/widgets/custom_myco_tabbar.dart';
import 'package:myco_flutter/widgets/custom_text.dart';
import 'package:myco_flutter/widgets/custom_text_field.dart';

class Testing extends StatefulWidget {
  const Testing({super.key});

  @override
  State<Testing> createState() => _TestingState();
}

class _TestingState extends State<Testing> {
  int selectedIndex = 0;

  final List<String> leavetype = ['Paid leave', 'Unpaid leave', 'Casual leave'];
  String? selectedleavetype;
  // Default selected index
  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: AppTheme.getColor(context).surface,
    appBar: AppBar(
      title: CustomText(
        'Assets',
        fontSize: 20 * getResponsiveText(context),
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
                size: 16,
                color: AppTheme.getColor(context).onSurface,
              ),
              CustomText(
                'Add Assets',
                fontSize: 16 * getResponsiveText(context),
                fontWeight: FontWeight.w600,
              ),
            ],
          ),
        ),
      ],
      actionsPadding: EdgeInsets.only(right: 0.04 * getWidth(context)),
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
            padding: EdgeInsets.symmetric(horizontal: 0.04 * getWidth(context)),
            child: MyCoTextfield(
              hintText: 'Search',
              hintTextStyle: AppTheme.getTextStyle(
                context,
              ).labelLarge!.copyWith(color: AppColors.textSecondary),
              preFixImage: 'assets/images/search.png',
              isSuffixIconOn: true,
              image2: 'assets/images/scan.png',
              onTap2: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const QRScannerPage()),
              ),
              contentPadding: EdgeInsets.only(top: 0.012 * getHeight(context)),
              boarderRadius: 12 * getResponsive(context),
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
                left: 0.04 * getWidth(context),
                right: 0.04 * getWidth(context),
                bottom: 0.015 * getHeight(context),
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
                  'All Assets(2)',
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
        //   padding: EdgeInsets.symmetric(horizontal: 0.04 * getWidth(context)),
        //   sliver: SliverList.separated(
        //     itemCount: 5,
        //     separatorBuilder: (context, index) =>
        //         SizedBox(height: 0.02 * getHeight(context)),
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
        SliverToBoxAdapter(child: SizedBox(height: 0.02 * getHeight(context))),
      ],
    ),
  );

  List<Widget> _buildAssetListByTab() {
    switch (selectedIndex) {
      case 0: // Active Assets
        return [
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 0.04 * getWidth(context)),
            sliver: SliverList.separated(
              itemCount: 8,
              separatorBuilder: (_, __) =>
                  SizedBox(height: 0.02 * getHeight(context)),
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
            padding: EdgeInsets.symmetric(horizontal: 0.04 * getWidth(context)),
            sliver: SliverList.separated(
              itemCount: 5,
              separatorBuilder: (_, __) =>
                  SizedBox(height: 0.02 * getHeight(context)),
              itemBuilder: (_, index) => const ActiveAssetsCard(
                title: 'Mouse',
                subTitle: '(AS104)',
                image: 'assets/images/laptop.png',
                brand: 'HP',
                srNo: 'HP098765',
                handOverDate: '20-04-2023',
              ),
            ),
          ),
        ];

      case 2: // All Assets
        return [
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 0.04 * getWidth(context)),
            sliver: SliverList.separated(
              itemCount: 10,
              separatorBuilder: (_, __) =>
                  SizedBox(height: 0.02 * getHeight(context)),
              itemBuilder: (_, index) {
                if (index % 2 != 0) {
                  return const AllAssetsCard(
                    title: 'Desktop',
                    subTitle: '(AS101)',
                    image: 'assets/images/laptop.png',
                    brand: 'HP',
                    srNo: 'DELL123456',
                    category: 'Desktop',
                    createdBy: 'Parth Jadav',
                    custodian: 'Arth Sorthiya',
                  );
                } else {
                  return const AllAssetsCard(
                    title: 'Desktop',
                    subTitle: '(AS101)',
                    image: 'assets/images/laptop.png',
                    brand: 'Dell',
                    srNo: 'DELL123456',
                    category: 'Desktop',
                    createdBy: 'Parth Jadav',
                  );
                }
              },
            ),
          ),
        ];

      default:
        return [];
    }
  }
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
