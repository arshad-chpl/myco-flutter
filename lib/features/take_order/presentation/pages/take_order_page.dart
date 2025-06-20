import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/take_order/presentation/bloc/take_order_bloc.dart';
import 'package:myco_flutter/features/take_order/presentation/pages/offers_page.dart';
import 'package:myco_flutter/features/take_order/presentation/pages/products_page.dart';
import 'package:myco_flutter/features/take_order/presentation/widgets/frequent_buy_card.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_myco_tabbar.dart';
import 'package:myco_flutter/widgets/custom_text_field.dart';

// ignore: must_be_immutable
class TakeOrderPage extends StatefulWidget {
  TakeOrderPage({super.key});

  @override
  State<TakeOrderPage> createState() => _TakeOrderPageState();
}

class _TakeOrderPageState extends State<TakeOrderPage> {
  List<Widget> screens = [AllProductsScreen(), const FrequentsBuyScreen()];

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: AppColors.bgWhite,
    appBar: AppBar(
      backgroundColor: AppColors.bgWhite,
      leading: const BackButton(),
      title: const Text('Take Order'),
      actions: [
        MyCoButton(
          onTap: () {},
          title: 'Refresh',
          textStyle: TextStyle(
            fontSize: 14 * getResponsiveText(context),
            color: AppColors.white,
          ),
          width: 0.17 * getWidth(context),
          height: 0.04 * getHeight(context),
          boarderRadius: 20 * getResponsive(context),
          isShadowBottomLeft: true,
        ),
        SizedBox(width: 0.01 * getWidth(context)),
        MyCoButton(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => OffersPage()),
            );
          },
          title: 'Offers',
          textStyle: TextStyle(
            fontSize: 14 * getResponsiveText(context),
            color: AppColors.white,
          ),
          backgroundColor: AppColors.primary_1,
          width: 0.17 * getWidth(context),
          height: 0.04 * getHeight(context),
          boarderRadius: 20 * getResponsive(context),
          borderColor: AppColors.primary_1,
          isShadowBottomLeft: true,
        ),
        SizedBox(width: 0.02 * getWidth(context)),
        const Icon(Icons.shopping_cart),
        SizedBox(width: 0.06 * getWidth(context)),
      ],
    ),
    body: Container(
      padding: EdgeInsets.symmetric(horizontal: 0.08 * getWidth(context)),
      child: Column(
        children: [
          SizedBox(height: 0.02 * getHeight(context)),
          BlocBuilder<TakeOrderBloc, TakeOrderState>(
            builder: (context, state) {
              final selectedIndex = state is TabChangeState
                  ? state.selectedIndex
                  : 0;
              return MyCustomTabBar(
                tabs: const ['All Products', 'Frequents Buy'],
                selectedBgColors: const [
                  AppColors.primary,
                  AppColors.primary_1,
                ],
                unselectedBorderAndTextColor: AppColors.white,
                tabBarBorderColor: AppColors.black,
                tabBarBackgroundColor: AppColors.bgWhite,
                isShadowBottomLeft: true,
                selectedIndex: selectedIndex,
                onTabChange: (index) {
                  context.read<TakeOrderBloc>().add(
                    TabChangeEvent(index: index),
                  );
                },
              );
            },
          ),
          SizedBox(height: 0.02 * getHeight(context)),

          Expanded(
            child: BlocBuilder<TakeOrderBloc, TakeOrderState>(
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
  Widget build(BuildContext context) =>
      // V1
      Column(
        children: [
          // Search Field
          MyCoTextfield(
            hintText: 'Search',
            hintTextStyle: const TextStyle(color: Colors.grey),
            prefix: const Icon(Icons.search),
            boarderRadius: 12 * getResponsive(context),
          ),

          SizedBox(height: 0.035 * getHeight(context)),

          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) => MyCoTextfield(
                onClick: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProductsPage()),
                ),
                isReadOnly: true,
                hintText: productList[index],
                hintTextStyle: const TextStyle(color: AppColors.primary),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(
                    12 * getResponsive(context),
                  ),
                ),
              ),
              separatorBuilder: (context, index) =>
                  SizedBox(height: 0.02 * getHeight(context)),
              itemCount: productList.length,
            ),
          ),
        ],
      );
}

class FrequentsBuyScreen extends StatelessWidget {
  const FrequentsBuyScreen({super.key});

  @override
  Widget build(BuildContext context) => Column(
    children: [
      Expanded(
        child: ListView.separated(
          itemCount: 5,
          itemBuilder: (context, index) => const FrequentBuyCard(),
          separatorBuilder: (context, index) =>
              SizedBox(height: 0.02 * getHeight(context)),
        ),
      ),
      SizedBox(height: 0.02 * getHeight(context)),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MyCoButton(
            onTap: () {},
            title: 'Reset Cart',
            width: 0.4 * getWidth(context),
            backgroundColor: AppColors.bgWhite,
            textStyle: TextStyle(
              color: AppColors.primary,
              fontWeight: FontWeight.w500,
              fontSize: 20 * getResponsiveText(context),
            ),
            boarderRadius: 30 * getResponsive(context),
          ),
          MyCoButton(
            onTap: () {},
            title: 'Add Order',
            width: 0.4 * getWidth(context),
            boarderRadius: 30 * getResponsive(context),
          ),
        ],
      ),
      SizedBox(height: 0.02 * getHeight(context)),
    ],
  );
}

class AllProductsScreenV2 extends StatelessWidget {
  const AllProductsScreenV2({super.key});

  @override
  Widget build(BuildContext context) => ListView.separated(
    itemCount: 4,
    itemBuilder: (context, index) => ExpansionTile(
      iconColor: AppColors.black,
      collapsedIconColor: AppColors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      collapsedShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      childrenPadding: EdgeInsets.zero,
      backgroundColor: AppColors.blueLightShade,
      collapsedTextColor: AppColors.white,
      collapsedBackgroundColor: AppColors.primary,
      title: const Text('Cold Drink'),
      children: [
        _buildMenuItem('Soda'),
        _buildMenuItem('Thanda'),
        _buildMenuItem('Milk Shake'),
      ],
    ),
    separatorBuilder: (context, index) =>
        SizedBox(height: 0.02 * getHeight(context)),
  );

  Widget _buildMenuItem(String title) => ListTile(
    title: Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),

    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
    onTap: () {
      // Handle tap
    },
  );
}
