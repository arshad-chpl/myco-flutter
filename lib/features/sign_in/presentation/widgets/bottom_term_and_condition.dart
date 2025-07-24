import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:webview_flutter/webview_flutter.dart';

class BottomTermAndCondition extends StatelessWidget {
  final String url;

  const BottomTermAndCondition({required this.url, super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    final isLoading = ValueNotifier<bool>(true);
    final WebViewController controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (url) {
            isLoading.value = true;
          },
          onPageFinished: (url) {
            isLoading.value = false;
          },
          onNavigationRequest: (request) => NavigationDecision.navigate,
        ),
      )
      ..loadRequest(Uri.parse(url));

    return Container(
      height: screenHeight * 0.9,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  WebViewWidget(controller: controller),
                  ValueListenableBuilder<bool>(
                    valueListenable: isLoading,
                    builder: (context, loading, _) {
                      if (loading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        return const SizedBox.shrink();
                      }
                    },
                  )
                ],
              ),
            ),
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
                      textStyle:
                      TextStyle(color: AppTheme.getColor(context).primary),
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
