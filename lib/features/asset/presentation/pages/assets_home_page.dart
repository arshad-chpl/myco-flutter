import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:myco_flutter/constants/app_assets.dart';
import 'package:myco_flutter/constants/constants.dart';
import 'package:myco_flutter/core/encryption/gzip_util.dart';
import 'package:myco_flutter/core/network/api_client.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/language_manager.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/asset/domain/entities/asset_entity.dart';
import 'package:myco_flutter/features/asset/presentation/bloc/assets_bloc.dart';
import 'package:myco_flutter/features/asset/presentation/bloc/assets_event.dart';
import 'package:myco_flutter/features/asset/presentation/bloc/assets_state.dart';
import 'package:myco_flutter/features/asset/presentation/widgets/active_assets_card.dart';
import 'package:myco_flutter/features/asset/presentation/widgets/all_assets_card.dart';
import 'package:myco_flutter/features/asset/presentation/widgets/asset_simmer_widget.dart';
import 'package:myco_flutter/features/asset/presentation/widgets/assets_bottom_sheet.dart';
import 'package:myco_flutter/features/asset/presentation/widgets/assets_holder_bottom_sheet.dart';
import 'package:myco_flutter/features/asset/presentation/widgets/past_assets_card.dart';
import 'package:myco_flutter/features/language_selector/model/language_response.dart';
import 'package:myco_flutter/widgets/custom_appbar.dart';
import 'package:myco_flutter/widgets/custom_myco_tabbar.dart';
import 'package:myco_flutter/widgets/custom_searchfield.dart';
import 'package:myco_flutter/widgets/custom_text.dart';
import 'package:myco_flutter/widgets/custom_text_field.dart';

class AssetsHomePage extends StatefulWidget {
  const AssetsHomePage({super.key});

  @override
  State<AssetsHomePage> createState() => _AssetsHomePageState();
}

class _AssetsHomePageState extends State<AssetsHomePage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<AssetsBloc>().add(const InitializeAssetsEvent());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<AssetsBloc>();

    return Scaffold(
      backgroundColor: AppTheme.getColor(context).surface,
      appBar: CustomAppbar(
        title: 'assets',
        titleSpacing: 0,
        actions: [
          Padding(
            padding: EdgeInsets.only(
              right:
                  VariableBag.screenHorizontalPadding *
                  Responsive.getResponsive(context),
            ),
            child: GestureDetector(
              onTap: () => context.push('/add-assets'),
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
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal:
              VariableBag.screenHorizontalPadding *
              Responsive.getResponsive(context),
        ),
        child: CustomScrollView(
          slivers: [
            // Search Field
            searchField(bloc),

            // Pinned TabBar
            tabBar(bloc),

            // Asset List
            ..._buildAssetListByTab(context),

            // Extra spacing at the bottom
            SliverToBoxAdapter(
              child: SizedBox(height: 0.02 * Responsive.getHeight(context)),
            ),
          ],
        ),
      ),
    );
  }

  Widget searchField(AssetsBloc bloc) => SliverAppBar(
    expandedHeight:
        (VariableBag.searchFiledAfterSpace + 45) *
        Responsive.getResponsive(context),
    backgroundColor: AppTheme.getColor(context).surface,
    floating: true,
    snap: true,
    automaticallyImplyLeading: false,
    titleSpacing: 0,
    title: MyCoTextfield(
      key: ValueKey(bloc.state.selectedIndex),
      hintText: LanguageManager().get('search'),
      maxLines: 1,
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
      onChanged: (value) {
        context.read<AssetsBloc>().add(SearchAssetsEvent(value));
      },
      boarderRadius: 12 * Responsive.getResponsive(context),
    ),
  );

  Widget tabBar(AssetsBloc bloc) => SliverPersistentHeader(
    pinned: true,
    delegate: _SliverTabBarDelegate(
      height:
          (VariableBag.tabBarAfterSpace + 45) *
          Responsive.getResponsive(context),
      child: Padding(
        padding: EdgeInsets.only(
          bottom:
              VariableBag.tabBarAfterSpace * Responsive.getResponsive(context) -
              10 * Responsive.getResponsive(context),
        ),
        child: BlocBuilder<AssetsBloc, AssetsState>(
          builder: (context, state) => MyCustomTabBar(
            isShadowBottomLeft: true,
            tabBarBorderColor: AppTheme.getColor(context).outline,
            selectedBgColors: [
              AppTheme.getColor(context).secondary,
              AppTheme.getColor(context).primary,
              const Color(0xFF08A4BB),
            ],
            selectedIndex: state.selectedIndex,
            tabs: [
              'Active Assets (${state is AssetsLoaded ? state.activeAssets.length : 0})',
              'Past Assets (${state is AssetsLoaded ? state.pastAssets.length : 0})',
              'All Assets (${state is AssetsLoaded ? state.allAssets.length : 0})',
            ],
            onTabChange: (int index) {
              bloc.add(TabChanged(index));
            },
            unselectedTextStyles: [
              TextStyle(
                fontSize: 10 * Responsive.getResponsiveText(context),
                color: AppTheme.getColor(context).secondary,
                fontFamily: 'Gilroy-Bold',
                fontWeight: FontWeight.w700,
              ),
              TextStyle(
                fontSize: 10 * Responsive.getResponsiveText(context),
                color: AppTheme.getColor(context).primary,
                fontFamily: 'Gilroy-Bold',
                fontWeight: FontWeight.w700,
              ),
              TextStyle(
                fontSize: 10 * Responsive.getResponsiveText(context),
                color: const Color(0xFF08A4BB),
                fontFamily: 'Gilroy-Bold',
                fontWeight: FontWeight.w700,
              ),
            ],
            selectedTextStyle: TextStyle(
              fontSize: 10 * Responsive.getResponsiveText(context),
              color: Colors.white,
              fontFamily: 'Gilroy-Bold',
              fontWeight: FontWeight.w700,
            ),
            unselectedBorderAndTextColor: AppTheme.getColor(context).outline,
          ),
        ),
      ),
    ),
  );

  List<Widget> _buildAssetListByTab(BuildContext context) {
    final state = context.watch<AssetsBloc>().state;

    switch (state.selectedIndex) {
      case 0:
        return [AssetsListPage(oldItems: state.selectedIndex.toString())];
      case 1:
        return [AssetsListPage(oldItems: state.selectedIndex.toString())];
      case 2:
        return _buildAllAssetsTab(context);
    }

    return [const SizedBox.shrink()];
  }

  // ignore: prefer_expression_function_bodies
  List<Widget> _buildAllAssetsTab(BuildContext context) {
    return [
      SliverPersistentHeader(
        pinned: true,
        delegate: _SliverTabBarDelegate(
          height: 50 * Responsive.getResponsive(context),
          child: Padding(
            padding: EdgeInsets.only(
              bottom: 10.0 * Responsive.getResponsive(context),
            ),
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
                SizedBox(
                  width:
                      VariableBag.buttonRowSpacing *
                      Responsive.getResponsive(context),
                ),
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
      SliverToBoxAdapter(
        child: SizedBox(height: 10 * Responsive.getResponsive(context)),
      ),
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

class AssetsListPage extends StatelessWidget {
  final String oldItems;

  const AssetsListPage({required this.oldItems, super.key});

  @override
  Widget build(BuildContext context) => BlocBuilder<AssetsBloc, AssetsState>(
    builder: (context, state) {
      if (state is AssetsLoading) {
        return SliverToBoxAdapter(
          child: Column(
            children: List.generate(
              4,
              (index) => Padding(
                padding: EdgeInsets.only(
                  bottom: 0.020 * Responsive.getHeight(context),
                ),
                child: const ActiveAssetsCardShimmer(),
              ),
            ),
          ),
        );
      } else if (state is AssetsLoaded) {
        // final assets = state.currentAssets;

        final assets = state.currentAssets as List<AssetEntity>;

        return SliverList.separated(
          itemCount: assets.length,
          separatorBuilder: (_, __) => SizedBox(
            height:
                VariableBag.formContentSpacingVertical *
                Responsive.getResponsive(context),
          ),
          itemBuilder: (_, index) {
            final item = assets[index];

            if (oldItems == '1') {
              return PastAssetsCard(
                mainImageKey: Key('main_image_${item.assetsIdView ?? index}'),
                handoverImageKey: Key(
                  'asset_${item.assetsIdView ?? index}_handover',
                ),
                takeoverImageKey: Key(
                  'asset_${item.assetsIdView ?? index}_takeover',
                ),
                title: item.assetsName ?? '',
                subTitle: '(${item.assetsIdView ?? ''})',
                image: item.assetsFile ?? AppAssets.imageLaptop,
                brand: item.assetsBrandName ?? '',
                srNo: item.srNo ?? '',
                handover: item.handoverDate ?? '',
                takeover: item.takeoverDate ?? '',
                handoverImageList:
                    item.assetsFiles?.map((e) => e.document ?? '').toList() ??
                    [],
                takeoverImageList:
                    item.assetsFilesTakeover
                        ?.map((e) => e['file']?.toString())
                        .whereType<String>()
                        .toList() ??
                    [],
              );
            }

            return ActiveAssetsCard(
              imageKey: Key('handover_image_${item.assetsIdView ?? index}'),
              mainImageKey: Key('main_image_${item.assetsIdView ?? index}'),
              title: item.assetsName ?? '',
              subTitle: '(${item.assetsIdView ?? ''})',
              image: item.assetsFile ?? AppAssets.imageLaptop,
              brand: item.assetsBrandName ?? '',
              srNo: item.srNo ?? '--',
              handOverDate: item.handoverDate ?? '',
              handoverImageList:
                  item.assetsFiles?.map((e) => e.document ?? '').toList() ?? [],
            );
          },
        );
      } else if (state is AssetsError) {
        return SliverToBoxAdapter(child: Center(child: Text(state.message)));
      }

      return const SliverToBoxAdapter(child: SizedBox());
    },
  );
}

class AllAssetsListPage extends StatelessWidget {
  const AllAssetsListPage({super.key});

  @override
  // ignore: prefer_expression_function_bodies
  Widget build(BuildContext context) {
    // Using SliverPadding wrapped inside a BlocBuilder to react to AssetsState
    return BlocBuilder<AssetsBloc, AssetsState>(
      builder: (context, state) {
        // Show loading state
        if (state is AssetsLoading) {
          return SliverList.separated(
            itemCount: 6, // shimmer placeholders count
            separatorBuilder: (_, __) => SizedBox(
              height:
                  VariableBag.formContentSpacingVertical *
                  Responsive.getResponsive(context),
            ),

            itemBuilder: (_, __) => const ActiveAssetsCardShimmer(),
          );
        }

        // Show error state
        if (state is AssetsError) {
          return SliverToBoxAdapter(child: Center(child: Text(state.message)));
        }

        // When data is loaded
        if (state is AssetsLoaded) {
          final allAssets = state.allAssets;

          if (allAssets.isEmpty) {
            return const SliverToBoxAdapter(
              child: Center(child: Text('No assets found')),
            );
          }

          return SliverList.separated(
            itemCount: allAssets.length,
            separatorBuilder: (_, __) =>
                SizedBox(height: 0.02 * Responsive.getHeight(context)),
            itemBuilder: (_, index) {
              final asset = allAssets[index];
              return AllAssetsCard(
                key: Key(index.toString()),
                title: asset.assetsName ?? 'No Name',
                subTitle: '(${asset.assetsIdView ?? ''})',
                image: asset.assetsFile ?? '',
                brand: asset.assetsBrandName ?? '',
                srNo: asset.srNo ?? '',
                category: asset.assetsCategory ?? '',
                createdBy: asset.createdByName ?? 'Unknown',
                custodian: asset.custodian,
                onViewDetailsTap: () =>
                    context.push('/assets-details', extra: asset),
                onEditTap: () => context.push('/edit-assets', extra: asset),
                onScannerTap: () => showAssetsHoldersBottomSheet(
                  context: context,
                  handoverImageList:
                      asset.assetsFiles
                          ?.map((e) => e.document ?? '')
                          .toList() ??
                      [],
                  image: asset.assetsFile ?? AppAssets.imageLaptop,
                ),
              );
            },
          );
        }

        // Default to empty to avoid build error
        return const SliverToBoxAdapter(child: SizedBox.shrink());
      },
    );
  }
}


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
              // onTap: () async {
              //   final dataMap = {
              //     'getOtherAssets': 'getOtherAssets',
              //     'user_id': '1679',
              //     'society_id': '1',
              //     'language_id': '1',
              //     'floor_id': '1',
              //     'assets_category_id': '',
              //     'brand_name': '',
              //     'filter': '1',
              //     'view_other_assets': '2',
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