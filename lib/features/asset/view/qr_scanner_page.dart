import 'package:flutter/material.dart';
import 'package:myco_flutter/constants/app_assets.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/asset/widgets/qr_scanner.dart';
import 'package:myco_flutter/widgets/custom_appbar.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

class QRScannerPage extends StatefulWidget {
  const QRScannerPage({super.key});

  @override
  State<QRScannerPage> createState() => _QRScannerPageState();
}

class _QRScannerPageState extends State<QRScannerPage> {
  @override
  // ignore: prefer_expression_function_bodies
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: CustomText(
          isKey: true,
          'scan_asset',
          fontSize: 22 * Responsive.getResponsiveText(context),
          fontWeight: FontWeight.w700,
        ),
        titleSpacing: 0,
        actions: [
          GestureDetector(
            child: Image.asset(
              AppAssets.imageCamera,
              width: 0.07 * Responsive.getWidth(context),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 0.06 * Responsive.getWidth(context),
              right: 0.06 * Responsive.getWidth(context),
            ),
            child: GestureDetector(
              child: Image.asset(
                AppAssets.assetsVector,
                width: 0.05 * Responsive.getWidth(context),
              ),
            ),
          ),
        ],
        appBarBackgoundColor: AppTheme.getColor(context).surface,
      ),

      body: Padding(
        padding: EdgeInsets.all(16.0 * Responsive.getResponsive(context)),
        child: Column(
          children: [
            SizedBox(height: 0.02 * Responsive.getHeight(context)),
            Center(
              child: QRScannerWidget(
                // key: scannerKey,
                height: 0.5 * Responsive.getHeight(context),
                width: 0.85 * Responsive.getWidth(context),
                imageButtonSpacing: 0.001 * Responsive.getHeight(context),
                onScanned: (data) {
                  Navigator.pop(context, data);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
