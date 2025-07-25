import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:myco_flutter/constants/app_assets.dart';
import 'package:myco_flutter/core/router/route_paths.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/language_manager.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/custom_bloc/tab-bar/bloc/tabbar_bloc.dart';
import 'package:myco_flutter/features/take_order/presentation/bloc/take_order_bloc.dart';
import 'package:myco_flutter/features/take_order/presentation/widgets/frequent_buy_card.dart';
import 'package:myco_flutter/features/take_order/presentation/widgets/side_by_side_buttons.dart';
import 'package:myco_flutter/widgets/custom_appbar.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_myco_tabbar.dart';
import 'package:myco_flutter/widgets/custom_searchfield.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

// ignore: must_be_immutable
class TakeOrderPage extends StatefulWidget {
  const TakeOrderPage({super.key});

  @override
  State<TakeOrderPage> createState() => _TakeOrderPageState();
}

class _TakeOrderPageState extends State<TakeOrderPage> {
  List<Widget> screens = [AllProductsScreen(), const FrequentsBuyScreen()];

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: CustomAppbar(
      title: LanguageManager().get('take_order'),
      actions: [
        MyCoButton(
          onTap: () {},
          title: LanguageManager().get('refresh'),
          textStyle: AppTheme.getTextStyle(
            context,
          ).labelMedium!.copyWith(color: AppTheme.getColor(context).onPrimary),
          width: 0.17 * Responsive.getWidth(context),
          height: 0.028 * Responsive.getHeight(context),
          boarderRadius: 20 * Responsive.getResponsive(context),
          isShadowBottomLeft: true,
        ),
        SizedBox(width: 0.01 * Responsive.getWidth(context)),
        Stack(
          alignment: const AlignmentGeometry.directional(1.7, -2.5),
          children: [
            MyCoButton(
              onTap: () {
                context.pushNamed(RoutePaths.offers);
              },
              title: LanguageManager().get('offer'),
              textStyle: AppTheme.getTextStyle(context).labelMedium!.copyWith(
                color: AppTheme.getColor(context).onPrimary,
              ),
              backgroundColor: AppTheme.getColor(context).secondary,
              width: 0.17 * Responsive.getWidth(context),
              height: 0.028 * Responsive.getHeight(context),
              boarderRadius: 20 * Responsive.getResponsive(context),
              borderColor: AppTheme.getColor(context).secondary,
              isShadowBottomLeft: true,
            ),
            Container(
              height: 0.02 * Responsive.getHeight(context),
              width: 0.1 * Responsive.getWidth(context),
              decoration: const BoxDecoration(shape: BoxShape.circle),
              child: SvgPicture.asset(
                // 'assets/take_order/offer.png',
                AppAssets.offers,
              ),
            ),
          ],
        ),
        SizedBox(width: 0.02 * Responsive.getWidth(context)),
        SvgPicture.asset(
          // 'assets/take_order/cart.png',
          AppAssets.cart,
          width: 0.06 * Responsive.getWidth(context),
        ),
        SizedBox(width: 0.06 * Responsive.getWidth(context)),
      ],
    ),
    body: Container(
      padding: EdgeInsets.symmetric(
        horizontal: 0.08 * Responsive.getWidth(context),
      ),
      child: Column(
        children: [
          SizedBox(height: 0.01 * Responsive.getHeight(context)),
          BlocBuilder<TabbarBloc, TabbarState>(
            builder: (context, state) {
              final selectedIndex = state is TabChangeState
                  ? state.selectedIndex
                  : 0;
              return MyCustomTabBar(
                tabs: [
                  LanguageManager().get('all_product'),
                  LanguageManager().get('frequent_buy'),
                ],
                selectedBgColors: [
                  AppTheme.getColor(context).primary,
                  AppTheme.getColor(context).secondary,
                ],

                unselectedBorderAndTextColor: AppTheme.getColor(
                  context,
                ).onPrimary,
                tabBarBorderColor: selectedIndex == 0
                    ? AppTheme.getColor(context).primary
                    : AppTheme.getColor(context).secondary,
                tabBarBackgroundColor: AppTheme.getColor(context).surface,
                isShadowBottomLeft: true,
                selectedIndex: selectedIndex,
                onTabChange: (index) {
                  context.read<TabbarBloc>().add(TabChangeEvent(index: index));
                },
              );
            },
          ),

          SizedBox(height: 0.015 * Responsive.getHeight(context)),
          Expanded(
            child: BlocBuilder<TabbarBloc, TabbarState>(
              builder: (context, state) {
                final selectedIndex = state is TabChangeState
                    ? state.selectedIndex
                    : 0;
                return screens[selectedIndex];
              },
            ),
          ),
        ],
      ),
    ),
  );
}

// ignore: must_be_immutable
class AllProductsScreen extends StatelessWidget {
  AllProductsScreen({super.key});

  List<String> productList = [
    'Cold Drink',
    'Waffers Food',
    'Electronics',
    'Outdoor Sports',
    'Indoor Sports',
  ];

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<TakeOrderBloc>();
    // V1
    return Column(
      children: [
        // Search Field
        CustomSearchField(
          hintText: 'Search',
          onChanged: (value) {
            bloc.add(SearchQueryChangeEvent(value, productList));
          },
        ),

        SizedBox(height: 0.025 * Responsive.getHeight(context)),

        Expanded(
          child: BlocBuilder<TakeOrderBloc, TakeOrderState>(
            builder: (context, state) {
              List<String> products = [];

              if (state is ProductSearchState) {
                products = state.fileteredProducts;
              } else {
                products = productList;
              }
              return ListView.separated(
                itemBuilder: (context, index) => InkWell(
                  onTap: () => context.pushNamed(RoutePaths.products),
                  child: Container(
                    height: 0.055 * Responsive.getHeight(context),
                    width: Responsive.getWidth(context),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppTheme.getColor(context).outline,
                      ),
                      borderRadius: BorderRadius.circular(
                        12 * Responsive.getResponsive(context),
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: 10.0 * Responsive.getResponsive(context),
                        ),
                        child: CustomText(
                          products[index],
                          textAlign: TextAlign.justify,
                          color: AppTheme.getColor(context).primary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
                separatorBuilder: (context, index) =>
                    SizedBox(height: 0.01 * Responsive.getHeight(context)),
                itemCount: products.length,
              );
            },
          ),
        ),
      ],
    );
  }
}

class FrequentsBuyScreen extends StatelessWidget {
  final bool isSearchFieldOn;
  const FrequentsBuyScreen({super.key, this.isSearchFieldOn = false});

  @override
  Widget build(BuildContext context) => Column(
    children: [
      if (isSearchFieldOn)
        CustomSearchField(
          hintText: 'Search',
          onChanged: (value) {
            // TODO: Implement search functionality
            // Implement search functionality
          },
        ),
      if (isSearchFieldOn)
        SizedBox(height: 0.03 * Responsive.getHeight(context)),
      Expanded(
        child: ListView.separated(
          itemCount: 10,
          itemBuilder: (context, index) => const FrequentBuyCard(),
          separatorBuilder: (context, index) =>
              SizedBox(height: 0.015 * Responsive.getHeight(context)),
        ),
      ),
      SizedBox(height: 0.02 * Responsive.getHeight(context)),
      SideBySideButtons(
        button1Name: LanguageManager().get('reset_cart'),
        button2Name: LanguageManager().get('add_order'),
        onTap1: () {},
        onTap2: () {
          context.pushNamed(RoutePaths.orderSummary);
        },
      ),
      SizedBox(height: 0.02 * Responsive.getHeight(context)),
    ],
  );
}

// class AllProductsScreenV2 extends StatelessWidget {
//   const AllProductsScreenV2({super.key});

//   @override
//   Widget build(BuildContext context) => ListView.separated(
//     itemCount: 4,
//     itemBuilder: (context, index) => ExpansionTile(
//       iconColor: AppColors.black,
//       collapsedIconColor: AppColors.white,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//       collapsedShape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(12),
//       ),
//       childrenPadding: EdgeInsets.zero,
//       backgroundColor: AppColors.blueLightShade,
//       collapsedTextColor: AppColors.white,
//       collapsedBackgroundColor: AppColors.primary,
//       title: const Text('Cold Drink'),
//       children: [
//         _buildMenuItem(context, 'Soda'),
//         _buildMenuItem(context, 'Thanda'),
//         _buildMenuItem(context, 'Milk Shake'),
//       ],
//     ),
//     separatorBuilder: (context, index) =>
//         SizedBox(height: 0.02 * Responsive.getHeight(context)),
//   );

//   Widget _buildMenuItem(BuildContext context, String title) => ListTile(
//     title: CustomText(
//       title,
//       fontWeight: FontWeight.w600,
//       fontSize: 14 * Responsive.getResponsiveText(context),
//     ),
//     trailing: Icon(Icons.arrow_forward_ios, size: 18 * Responsive.getResponsive(context)),
//     onTap: () {
//       // Handle tap
//     },
//   );
// }
