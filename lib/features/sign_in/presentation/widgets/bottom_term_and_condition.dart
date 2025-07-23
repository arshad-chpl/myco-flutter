import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:webview_flutter/webview_flutter.dart';

class BottomTermAndCondition extends StatefulWidget {
  final String url;

  const BottomTermAndCondition({super.key, required this.url});

  @override
  State<BottomTermAndCondition> createState() =>
      _BottomSheetTermsAndConditionsNewUiState();
}

class _BottomSheetTermsAndConditionsNewUiState
    extends State<BottomTermAndCondition> {
  late final WebViewController _controller;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();

    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (url) => setState(() => _isLoading = true),
          onPageFinished: (url) => setState(() => _isLoading = false),
          onNavigationRequest: (request) => NavigationDecision.navigate,
        ),
      )
      ..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      height: screenHeight * 0.9,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            if (_isLoading) const LinearProgressIndicator(minHeight: 3),
            Expanded(child: WebViewWidget(controller: _controller)),

            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 10.0 * Responsive.getResponsive(context),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: MyCoButton(
                      title: 'Close',
                      height: 0.05 * Responsive.getHeight(context),
                      onTap: () => Navigator.pop(context),
                      backgroundColor: Colors.white,
                      boarderRadius: 30 * Responsive.getResponsive(context),
                      border: Border.all(
                        color: AppTheme.getColor(context).primary,
                      ),
                      textStyle: TextStyle(
                        color: AppTheme.getColor(context).primary,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: MyCoButton(
                      title: 'Submit',
                      isShadowBottomLeft: true,
                      boarderRadius: 30 * Responsive.getResponsive(context),
                      onTap: () {},
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
