import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/language_manager.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/custom_bloc/tab-bar/bloc/tabbar_bloc.dart';
import 'package:myco_flutter/features/take_order/presentation/bloc/take_order_bloc.dart';
import 'package:myco_flutter/features/take_order/presentation/widgets/frequent_buy_card.dart';
import 'package:myco_flutter/features/take_order/presentation/widgets/side_by_side_buttons.dart';
import 'package:myco_flutter/widgets/custom_appbar.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_myco_tabbar.dart';
import 'package:myco_flutter/widgets/custom_text_field.dart';

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
      title: 'Take Order',
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
          alignment: const AlignmentGeometry.directional(1.5, -1.5),
          children: [
            MyCoButton(
              onTap: () {
                context.pushNamed('offers');
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
              child: Image.asset(
                'assets/take_order/offer.png',
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
        SizedBox(width: 0.02 * Responsive.getWidth(context)),
        Image.asset(
          'assets/take_order/cart.png',
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
                tabBarBorderColor: AppTheme.getColor(context).onSurface,
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
        MyCoTextfield(
          hintText: LanguageManager().get('search'),
          hintTextStyle: AppTheme.getTextStyle(
            context,
          ).labelLarge!.copyWith(color: AppColors.textSecondary),
          prefix: const Icon(Icons.search),
          contentPadding: EdgeInsets.only(
            top: 0.012 * Responsive.getHeight(context),
          ),
          boarderRadius: 12 * Responsive.getResponsive(context),
          onChanged: (value) =>
              bloc.add(SearchQueryChangeEvent(value, productList)),
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
                itemBuilder: (context, index) => MyCoTextfield(
                  onClick: () => context.pushNamed('products'),
                  isReadOnly: true,
                  hintText: products[index],
                  hintTextStyle: AppTheme.getTextStyle(context).bodyLarge!
                      .copyWith(color: AppTheme.getColor(context).primary),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: AppTheme.getColor(context).outline,
                    ),
                    borderRadius: BorderRadius.circular(
                      12 * Responsive.getResponsive(context),
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
  const FrequentsBuyScreen({super.key});

  @override
  Widget build(BuildContext context) => Column(
    children: [
      Expanded(
        child: ListView.separated(
          itemCount: 7,
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
          context.pushNamed('order-summary');
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
