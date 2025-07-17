import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:myco_flutter/constants/app_assets.dart';
import 'package:myco_flutter/constants/constants.dart';
import 'package:myco_flutter/core/encryption/gzip_util.dart';
import 'package:myco_flutter/core/network/api_client.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/asset/presentation/bloc/assets_bloc.dart';
import 'package:myco_flutter/features/asset/presentation/bloc/assets_event.dart';
import 'package:myco_flutter/features/asset/presentation/bloc/assets_state.dart';
import 'package:myco_flutter/features/asset/presentation/widgets/active_assets_card.dart';
import 'package:myco_flutter/features/asset/presentation/widgets/all_assets_card.dart';
import 'package:myco_flutter/features/asset/presentation/widgets/assets_bottom_sheet.dart';
import 'package:myco_flutter/features/asset/presentation/widgets/past_assets_card.dart';
import 'package:myco_flutter/features/sign_in/presentation/widgets/custom_request_bottom_sheet.dart';
import 'package:myco_flutter/widgets/custom_appbar.dart';
import 'package:myco_flutter/widgets/custom_myco_tabbar.dart';
import 'package:myco_flutter/widgets/custom_text.dart';
import 'package:myco_flutter/widgets/custom_text_field.dart';

class AssetsHomePage extends StatelessWidget {
  const AssetsHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<AssetsTabBloc>();

    return Scaffold(
      backgroundColor: AppTheme.getColor(context).surface,
      appBar: CustomAppbar(
        title: 'assets',
        titleSpacing: 0,
        actions: [
          Padding(
            padding: EdgeInsets.only(
              right: 0.04 * Responsive.getWidth(context),
            ),
            child: GestureDetector(
              onTap: () => context.push('/add-assets'),
              // onTap: () async {
              //   final dataMap = {
              //     "getAssetsNew": "getAssetsNew",
              //     "society_id": "1",
              //     "unit_id": "1718",
              //     "user_id": "1679",
              //     "language_id": "1",
              //     "floor_id": "1",
              //     "old_items": "1",
              //   };

              //   final encryptedBody = GzipUtil.encryptAES(jsonEncode(dataMap));
              //   final response =
              //       await GetIt.I<ApiClient>(
              //         instanceName: VariableBag.masterAPICall,
              //       ).postDynamic(
              //         'https://dev.my-company.app/india/employeeMobileApi/assets_controller.php',
              //         encryptedBody,
              //       );
              //   // log(GzipUtil.decryptAES(response));
              //   log(jsonEncode(json.decode(GzipUtil.decryptAES(response))));

              //   // log(json.decode(GzipUtil.decryptAES(response)));
              // },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.add,
                    size: 0.035 * Responsive.getWidth(context),
                    color: AppTheme.getColor(context).onSurface,
                  ),
                  CustomText(
                    'add_assets',
                    fontSize: 16 * Responsive.getResponsiveText(context),
                    fontWeight: FontWeight.w600,
                  ),
                ],
              ),
            ),
          ),
        ],
        // appBarBackgoundColor: AppTheme.getColor(context).surface,
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
                preFixImage: AppAssets.imageSearch,
                isSuffixIconOn: true,
                suFixImage: AppAssets.imageScanner,
                suFixImageWidth: 25,
                onTap1: () => context.push('/qr-scanner'),
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
                child: BlocBuilder<AssetsTabBloc, AssetsTabState>(
                  builder: (context, state) => MyCustomTabBar(
                    isShadowBottomLeft: true,
                    tabBarBorderColor: AppTheme.getColor(context).outline,
                    selectedBgColors: [
                      AppTheme.getColor(context).secondary,
                      AppTheme.getColor(context).primary,
                      const Color(0xFF08A4BB),
                    ],
                    selectedIndex: state.selectedIndex,
                    tabs: const [
                      'Active Assets (3)',
                      'Past Assets (2)',
                      'All Assets (2)',
                    ],
                    onTabChange: (int index) {
                      bloc.add(TabChanged(index));
                    },
                    unselectedBorderAndTextColor: AppTheme.getColor(
                      context,
                    ).outline,
                  ),
                ),
              ),
            ),
          ),

          // Asset List
          ..._buildAssetListByTab(context),

          // Extra spacing at the bottom
          SliverToBoxAdapter(
            child: SizedBox(height: 0.02 * Responsive.getHeight(context)),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildAssetListByTab(BuildContext context) {
    final index = context.watch<AssetsTabBloc>().state.selectedIndex;

    final tabBuilders = <int, List<Widget> Function()>{
      0: _buildActiveAssetsTab,
      1: _buildPastAssetsTab,
      2: () => _buildAllAssetsTab(context),
    };

    return tabBuilders[index]?.call() ?? [];
  }

  List<Widget> _buildActiveAssetsTab() => [const AssetsListPage()];

  List<Widget> _buildPastAssetsTab() => [const PastAssetsListPage()];

  // ignore: prefer_expression_function_bodies
  List<Widget> _buildAllAssetsTab(BuildContext context) {
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
                  child: BlocBuilder<AssetsFilterBloc, AssetsFilterState>(
                    builder: (context, state) => DropDownTextField(
                      context,
                      title: state.category,
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
                        if (data != null) {
                          context.read<AssetsFilterBloc>().add(
                            AssetsFilters(category: data),
                          );
                        }
                      },
                    ),
                  ),
                ),
                SizedBox(width: 0.06 * Responsive.getWidth(context)),
                Expanded(
                  child: BlocBuilder<AssetsFilterBloc, AssetsFilterState>(
                    builder: (context, state) => DropDownTextField(
                      context,
                      title: state.brand,
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
                        if (data != null) {
                          context.read<AssetsFilterBloc>().add(
                            AssetsFilters(brand: data),
                          );
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      const SliverToBoxAdapter(child: SizedBox(height: 10)),
      const AllAssetsListPage(),
    ];
  }

  Widget DropDownTextField(
    BuildContext context, {
    required String title,
    required VoidCallback onTap,
  }) => GestureDetector(
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

// List<Widget> _buildAssetListByTab(BuildContext context) {
//   switch (context.watch<AssetsTabBloc>().state.selectedIndex) {
//     case 0: // Active Assets
//       return [const AssetsListPage()];

//     case 1: // Past Assets
//       return [const PastAssetsListPage()];

//     case 2: // All Assets
//       return [
//         SliverPadding(
//           padding: EdgeInsets.symmetric(
//             horizontal: 0.04 * Responsive.getWidth(context),
//           ),
//           sliver: SliverPersistentHeader(
//             pinned: true,
//             delegate: _SliverTabBarDelegate(
//               height: 60,
//               child: Row(
//                 children: [
//                   Expanded(
//                     child: BlocBuilder<AssetsFilterBloc, AssetsFilterState>(
//                       builder: (context, state) => DropDownButton(
//                         context,
//                         title: state.category, //'All Category',
//                         onTap: () async {
//                           final data = await showAssetsBottomSheet(
//                             context: context,
//                             heading: 'Select Category',
//                             dataList: const [
//                               'All Category',
//                               'Desktop',
//                               'Laptop',
//                               'Mobile',
//                               'Tab',
//                               'Test Assets',
//                             ],
//                           );
//                           // log('Selected category: $data');
//                           if (data != null) {
//                             context.read<AssetsFilterBloc>().add(
//                               AssetsFilters(category: data),
//                             );
//                           }
//                         },
//                       ),
//                     ),
//                   ),
//                   SizedBox(width: 0.06 * Responsive.getWidth(context)),
//                   Expanded(
//                     child: BlocBuilder<AssetsFilterBloc, AssetsFilterState>(
//                       builder: (context, state) => DropDownButton(
//                         context,
//                         title: state.brand, // 'All Brand',
//                         onTap: () async {
//                           final data = await showAssetsBottomSheet(
//                             context: context,
//                             heading: 'Select Brand',
//                             dataList: const [
//                               'All Brand',
//                               'Apple',
//                               'Asus',
//                               'Samsung',
//                               'Acer',
//                               'HP',
//                             ],
//                           );
//                           // log('Selected category: $data');
//                           if (data != null) {
//                             context.read<AssetsFilterBloc>().add(
//                               AssetsFilters(brand: data),
//                             );
//                           }
//                         },
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//         const SliverToBoxAdapter(child: SizedBox(height: 10)),
//         const AllAssetsListPage(),
//       ];
//     default:
//       return [];
//   }
// }

///

// class PastAssetsListPage extends StatelessWidget {
//   const PastAssetsListPage({super.key});

//   @override
//   Widget build(BuildContext context) => BlocProvider(
//     create: (context) =>
//         AssetsBloc(GetIt.I())..add(FetchAssetsEvent(oldItems: "1")),
//     child: BlocBuilder<AssetsBloc, AssetsState>(
//       builder: (context, state) {
//         if (state is AssetsLoading) {
//           return const SliverToBoxAdapter(
//             child: Center(child: CircularProgressIndicator()),
//           );
//         } else if (state is AssetsLoaded) {
//           final assets = state.assets.assets ?? [];

//           return SliverPadding(
//             padding: EdgeInsets.symmetric(
//               horizontal: 0.04 * Responsive.getWidth(context),
//             ),
//             sliver: SliverList.separated(
//               itemCount: assets.length,
//               separatorBuilder: (_, __) =>
//                   SizedBox(height: 0.02 * Responsive.getHeight(context)),
//               itemBuilder: (_, index) {
//                 final item = assets[index];
//                 return PastAssetsCard(
//                   title: item.assetsName ?? '',
//                   subTitle: '(${item.assetsIdView ?? ''})',
//                   image: item.assetsFile ?? AppAssets.imageLaptop,
//                   brand: item.assetsBrandName ?? '',
//                   srNo: item.srNo ?? '',
//                   handover: item.handoverDate ?? '',
//                   takeover: item.takeoverDate ?? '',
//                   handoverImageList:
//                       item.assetsFiles?.map((e) => e.document ?? '').toList() ??
//                       [],
//                   takeoverImageList:
//                       (item.assetsFilesTakeover)
//                           ?.map((e) => e['file']?.toString())
//                           .whereType<String>()
//                           .toList() ??
//                       [],
//                 );
//               },
//             ),
//           );
//         } else if (state is AssetsError) {
//           return SliverToBoxAdapter(child: Center(child: Text(state.message)));
//         }
//         return const SliverToBoxAdapter(child: SizedBox());
//       },
//     ),
//   );
// }
