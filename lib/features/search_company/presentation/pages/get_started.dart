import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/language_manager.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/search_company/presentation/pages/image_animation.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    body: DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.center,
          colors: [
            AppTheme.getColor(context).primary, // Light Sky Blue
            AppTheme.getColor(context).surface, // Light Teal
            // Light Blue
          ],
        ),
      ),
      child: Center(
        child: Padding(
          padding: EdgeInsets.only(
            top: 165 * Responsive.getResponsive(context),
            left: 20 * Responsive.getResponsive(context),
            right: 20 * Responsive.getResponsive(context),
          ),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Image.asset(
              //   'assets/search_society/get-started.png',
              //   width: Responsive.getWidth(context) * 0.8,
              //   // height: Responsive.getHeight(context) * 0.4,
              // ),
              const BouncingImage(),
              SizedBox(height: 0.12 * Responsive.getHeight(context)),
              CustomText(
                'welcome_to_myco',
                isKey: true,
                fontSize: 30 * Responsive.getResponsiveText(context),
                fontWeight: FontWeight.w600,
                color: AppTheme.getColor(context).onSurface,

                textAlign: TextAlign.center,
              ),
              SizedBox(height: 0.014 * Responsive.getHeight(context)),
              CustomText(
                'get_started_desc',
                isKey: true,
                fontSize: 15 * Responsive.getResponsiveText(context),
                color: AppTheme.getColor(context).onSurfaceVariant,
                fontWeight: FontWeight.w500,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 0.05 * Responsive.getHeight(context)),
              MyCoButton(
                onTap: () {
                  context.pushNamed('companySearch');
                },
                title: LanguageManager().get('get_started'),
                height: 0.065 * Responsive.getHeight(context),
                boarderRadius: 30,
                textStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppTheme.getColor(context).onPrimary,
                ),
                backgroundColor: AppTheme.getColor(context).primary,
                isShadowBottomLeft: true,
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
