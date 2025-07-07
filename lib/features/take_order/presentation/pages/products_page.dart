import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/take_order/presentation/pages/take_order_page.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: AppTheme.getColor(context).surface,
    appBar: AppBar(
      title: CustomText(
        'Products',
        fontSize: 20 * Responsive.getResponsiveText(context),
        fontWeight: FontWeight.w700,
      ),
      leading: const BackButton(),
      backgroundColor: AppTheme.getColor(context).surface,
    ),
    body: Container(
      padding: EdgeInsets.symmetric(
        horizontal: 0.08 * Responsive.getWidth(context),
      ),
      child: Column(
        children: [
          SizedBox(height: 0.02 * Responsive.getHeight(context)),
          const Expanded(child: FrequentsBuyScreen()),
        ],
      ),
    ),
  );
}
