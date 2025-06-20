import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/take_order/presentation/pages/take_order_page.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: AppColors.bgWhite,
    appBar: AppBar(
      title: const Text('Products'),
      leading: const BackButton(),
      backgroundColor: AppColors.bgWhite,
    ),
    body: Container(
      padding: EdgeInsets.symmetric(horizontal: 0.08 * getWidth(context)),
      child: Column(
        children: [
          SizedBox(height: 0.02 * getHeight(context)),
          const Expanded(child: FrequentsBuyScreen()),
        ],
      ),
    ),
  );
}
