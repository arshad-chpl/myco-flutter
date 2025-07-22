import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:myco_flutter/constants/app_assets.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/asset/presentation/widgets/qr_scanner.dart';
import 'package:myco_flutter/widgets/custom_appbar.dart';

class QRScannerPage extends StatefulWidget {
  const QRScannerPage({super.key});

  @override
  State<QRScannerPage> createState() => _QRScannerPageState();
}

class _QRScannerPageState extends State<QRScannerPage> {
  final MobileScannerController _scannerController = MobileScannerController();
  bool isFlashOn = false;

  void toggleFlashlight() {
    _scannerController.toggleTorch();
    setState(() => isFlashOn = !isFlashOn);
    log('Flash toggled: ${isFlashOn ? "ON" : "OFF"}');
  }

  @override
  // ignore: prefer_expression_function_bodies
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: 'scan_asset',
        titleSpacing: 0,
        actions: [
          GestureDetector(
            onTap: _scannerController.switchCamera,
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
              onTap: toggleFlashlight,
              child: SvgPicture.asset(
                AppAssets.assetsVector,
                width: 0.07 * Responsive.getWidth(context),
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
                controller: _scannerController,
                height: 0.5 * Responsive.getHeight(context),
                width: 0.85 * Responsive.getWidth(context),
                imageButtonSpacing: 0.001 * Responsive.getHeight(context),
                onScanned: (data) {
                  log('$data');
                  Navigator.pop(context);
                  // Navigator.pop(context, data);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
