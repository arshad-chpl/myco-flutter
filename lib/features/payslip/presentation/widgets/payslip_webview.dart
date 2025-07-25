import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/widgets/custom_appbar.dart';

// ignore: must_be_immutable
class PayslipWebViewScreen extends StatelessWidget {
  final String url;

  PayslipWebViewScreen({required this.url, super.key});

  InAppWebViewController? _webViewController;
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: CustomAppbar(
      title: 'Payslip',
      actions: [
        IconButton(
          onPressed: () async {
            await _webViewController?.printCurrentPage();
          },
          icon: Icon(Icons.print, color: AppTheme.getColor(context).primary),
        ),
      ],
    ),
    body: InAppWebView(
      initialUrlRequest: URLRequest(url: WebUri(url)),
      onWebViewCreated: (controller) {
        _webViewController = controller;
      },
    ),
  );
}
