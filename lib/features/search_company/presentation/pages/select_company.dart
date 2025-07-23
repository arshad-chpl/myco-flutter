import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/search_company/presentation/widgets/bottomsheet_radio_btn.dart';
import 'package:myco_flutter/features/search_company/presentation/widgets/box_design_registration.dart';
import 'package:myco_flutter/features/sign_in/presentation/widgets/bottom_term_and_condition.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    body: Center(
      child: ElevatedButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            builder: (_) => BottomTermAndCondition(url : 'url'),
          );
        },
        child: const Text('Open Full Bottom Sheet'),
      ),
    ),
  );
  // Widget build(BuildContext context) => Scaffold(
  //   backgroundColor: AppColors.white,
  //   appBar: AppBar(
  //     title: const Text(
  //       'Developer(CHPL)',
  //       style: TextStyle(
  //         fontSize: 20,
  //         fontWeight: FontWeight.w600,
  //         color: AppColors.black,
  //       ),
  //     ),
  //     // backgroundColor: AppColors.black,
  //   ),
  //   body: Padding(
  //     padding: const EdgeInsets.all(26.0),
  //     child: Column(
  //       children: [
  //         LinearDesignBox(
  //           title: 'Parth Babriya',
  //           // subTitle: 'Developer',
  //           // inSingleLine: true,
  //           isIncenter: true,
  //           titleTextStyle: const TextStyle(
  //             color: AppColors.white,
  //             fontWeight: FontWeight.w600,
  //             fontSize: 18,
  //           ),
  //           color: const Color(0xFF2FBBA4),
  //           child: Padding(
  //             padding:  EdgeInsets.symmetric(horizontal: 0.02 * Responsive.getWidth(context)),
  //             child: Column(
  //               children: [
  //                  CircleAvatar(
  //                   radius: 54 * Responsive.getResponsive(context),
  //                   backgroundImage: const AssetImage(
  //                     'visit/search_society/placeholder.png',
  //                   ),
  //                 ),
  //                  SizedBox(height: 0.01 * Responsive.getHeight(context)),
  //                 Row(
  //                   mainAxisAlignment: MainAxisAlignment.center,
  //                   children: [
  //                     Text(
  //                       'Designation:',
  //                       style: TextStyle(
  //                         fontSize: 13 * Responsive.getResponsiveText(context),
  //                         fontWeight: FontWeight.w800,
  //                         color: AppColors.black,
  //                       ),
  //                     ),
  //                     SizedBox(width: 5),
  //                     Text(
  //                       'Flutter Developer',
  //                       style: TextStyle(fontSize: 13 * Responsive.getResponsiveText(context), color: AppColors.black),
  //                     ),
  //                   ],
  //                 ),
  //                  SizedBox(height: 0.005 * Responsive.getHeight(context)),
  //                  Text(
  //                   "Technical - Ahmedabad",
  //                   style: TextStyle(fontSize: 13 * Responsive.getResponsiveText(context), color: AppColors.black),
  //                 ),
  //                 SizedBox(height: 0.005 * Responsive.getHeight(context)),
  //                  Text(
  //                   "+91 99999 99999",
  //                   style: TextStyle(fontSize: 13 * Responsive.getResponsiveText(context), color: AppColors.black),
  //                 ),
  //                  SizedBox(height: 0.012 * Responsive.getHeight(context)),
  //                  Text(
  //                   "Account Not Activated Please Contact to Admin",
  //                   style: TextStyle(fontSize: 14 * Responsive.getResponsiveText(context), color: AppColors.red),
  //                 ),
  //                 const SizedBox(height: 10),
  //                 Row(
  //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                   children: [
  //                     MyCoButton(onTap: (){

  //                     }, title: "Cancel Request",
  //                       height: 0.05 * Responsive.getHeight(context),
  //                       width: 0.37 * Responsive.getWidth(context),
  //                       boarderRadius: 30 * Responsive.getResponsive(context),
  //                       textStyle:  TextStyle(
  //                         fontSize: 17 * Responsive.getResponsiveText(context),
  //                         fontWeight: FontWeight.w600,
  //                         color: AppColors.primary,
  //                       ),
  //                       backgroundColor: AppColors.white,

  //                     ),
  //                     MyCoButton(onTap: (){

  //                     }, title: "Send Reminder",
  //                       height: 0.05 * Responsive.getHeight(context),
  //                       width: 0.37 * Responsive.getWidth(context),
  //                       boarderRadius: 30 * Responsive.getResponsive(context),
  //                       textStyle:  TextStyle(
  //                         fontSize: 17 * Responsive.getResponsiveText(context),
  //                         fontWeight: FontWeight.w600,
  //                         color: Colors.white,
  //                       ),
  //                       backgroundColor: const Color(0xFF2F648E),
  //                       isShadowBottomLeft: true,
  //                     ),
  //                   ],
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ),
  //         SizedBox(height: 0.03 * Responsive.getHeight(context),),
  //         Image.asset('visit/search_society/contact_admin.png',height: 0.35 * Responsive.getHeight(context),),
  //       ],
  //     ),
  //   ),
  // );
}
