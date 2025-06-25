import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/search_company/presentation/pages/image_animation.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    body: DecoratedBox(
      decoration: const BoxDecoration(
        gradient: AppColors.welcomeGradient,
      ),
      child: Center(
        child: Padding(
          padding:  EdgeInsets.only(top:  165 * getResponsive(context), left: 20 * getResponsive(context), right: 20 * getResponsive(context)),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            
            children: [
              // Image.asset(
              //   'assets/search_society/get-started.png',
              //   width: getWidth(context) * 0.8,
              //   // height: getHeight(context) * 0.4,
              // ),
              const BouncingImage(),
               SizedBox(height: 0.12 * getHeight(context)),
               Text(
                'Welcome to MyCo!',
                style: TextStyle(
                  fontSize: 30 * getResponsiveText(context),
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF101828),
                ),
                 textAlign: TextAlign.center,
              ),
               SizedBox(height: 0.014 *  getHeight(context)),
               Text(
                'Make Smart Decisions! Set clear timelines for projects and celebrate your achievements!',
                style: TextStyle(
                  fontSize: 15 * getResponsiveText(context),
                  color: Color(0xFF475467),
                  
                ),
                 textAlign: TextAlign.center,
              ),
               SizedBox(height: 0.05 * getHeight(context)),
              MyCoButton(
                onTap: () {
                  context.pushNamed('companySearch');
                },
                title: "Get Started",
                  height: 0.065 * getHeight(context),
                boarderRadius: 30,
                textStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
                backgroundColor: const Color(0xFF2F648E),
                isShadowBottomLeft: true,
                
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
