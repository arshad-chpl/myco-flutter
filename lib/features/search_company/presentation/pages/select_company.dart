import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/search_company/presentation/widgets/bottomsheet_radio_btn.dart';
import 'package:myco_flutter/features/search_company/presentation/widgets/box_design_registration.dart';
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
            builder: (_) => Container(
              height: getHeight(context) * 0.92,
              padding: EdgeInsets.only(
                top: 20 * getResponsive(context),
                left: 20 * getResponsive(context),
                right: 20 * getResponsive(context),
              ),
              decoration: BoxDecoration(
                color: AppTheme.getColor(context).onPrimary,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(30 * getResponsive(context)),
                ),
              ),
              child: Padding(
                padding:  EdgeInsets.only(
                  left: 14.0 * getResponsive(context),
                  right: 14.0 * getResponsive(context),
                  top: 20.0 * getResponsive(context),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomText(
                      'Terms & Conditions and Privacy Policy',

                        fontSize: 24 * getResponsiveText(context),
                        fontWeight: FontWeight.w800,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20 * getResponsive(context)),
                    Scrollbar(
                      thumbVisibility: true,
                      trackVisibility: true,
                      child: Container(
                        height: getHeight(context) * 0.58,
                        decoration:  BoxDecoration(
                          color: AppTheme.getColor(context).onSecondaryContainer,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 12.0,
                            right: 12.0,
                            top: 12.0,
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  '1. Introduction',

                                    fontSize: 18 * getResponsiveText(context),
                                    fontWeight: FontWeight.w600,
                             
                                ),
                                SizedBox(height: 10 * getResponsive(context)),
                                CustomText(
                                  'Welcome to MyCo! By using our app, you agree to the following terms and conditions...',
                          
                                    fontSize: 16 * getResponsiveText(context),
                                  
                                ),
                                SizedBox(height: 20 * getResponsive(context)),
                                CustomText(
                                  '2. Privacy Policy',
                                 
                                    fontSize: 18 * getResponsiveText(context),
                                    fontWeight: FontWeight.w600,
                                  
                                ),
                                SizedBox(height: 10 * getResponsive(context)),
                                CustomText(
                                  'We value your privacy. Please read our privacy policy to understand how we handle your data...',
                     
                                    fontSize: 16 * getResponsiveText(context),
                                  
                                ),
                                SizedBox(height: 10 * getResponsive(context)),
                                CustomText( '3. User Responsibilities',
               
                                    fontSize: 18 * getResponsiveText(context),
                                    fontWeight: FontWeight.w600,
                             
                                ),
                                // SizedBox(height: 500),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 0.026 * getHeight(context)),
                    MyCoButton(
                      onTap: () {},
                      title: "I Agree",
                      height: 0.065 * getHeight(context),
                      boarderRadius: 30,
                      textStyle:  TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color:AppTheme.getColor(context).onPrimary,
                      ),
                      backgroundColor: AppTheme.getColor(context).primary,
                      isShadowBottomLeft: true,
                    ),
                    SizedBox(height: 20 * getResponsive(context)),
                    MyCoButton(
                      onTap: () {},
                      title: "Decline",
                      height: 0.065 * getHeight(context),
                      boarderRadius: 30,
                      textStyle:  TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppTheme.getColor(context).primary,
                      ),
                      backgroundColor: AppTheme.getColor(context).onPrimary,
                    ),
                  ],
                ),
              ),
            ),
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
  //             padding:  EdgeInsets.symmetric(horizontal: 0.02 * getWidth(context)),
  //             child: Column(
  //               children: [
  //                  CircleAvatar(
  //                   radius: 54 * getResponsive(context),
  //                   backgroundImage: const AssetImage(
  //                     'assets/search_society/placeholder.png',
  //                   ),
  //                 ),
  //                  SizedBox(height: 0.01 * getHeight(context)),
  //                 Row(
  //                   mainAxisAlignment: MainAxisAlignment.center,
  //                   children: [
  //                     Text(
  //                       'Designation:',
  //                       style: TextStyle(
  //                         fontSize: 13 * getResponsiveText(context),
  //                         fontWeight: FontWeight.w800,
  //                         color: AppColors.black,
  //                       ),
  //                     ),
  //                     SizedBox(width: 5),
  //                     Text(
  //                       'Flutter Developer',
  //                       style: TextStyle(fontSize: 13 * getResponsiveText(context), color: AppColors.black),
  //                     ),
  //                   ],
  //                 ),
  //                  SizedBox(height: 0.005 * getHeight(context)),
  //                  Text(
  //                   "Technical - Ahmedabad",
  //                   style: TextStyle(fontSize: 13 * getResponsiveText(context), color: AppColors.black),
  //                 ),
  //                 SizedBox(height: 0.005 * getHeight(context)),
  //                  Text(
  //                   "+91 99999 99999",
  //                   style: TextStyle(fontSize: 13 * getResponsiveText(context), color: AppColors.black),
  //                 ),
  //                  SizedBox(height: 0.012 * getHeight(context)),
  //                  Text(
  //                   "Account Not Activated Please Contact to Admin",
  //                   style: TextStyle(fontSize: 14 * getResponsiveText(context), color: AppColors.red),
  //                 ),
  //                 const SizedBox(height: 10),
  //                 Row(
  //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                   children: [
  //                     MyCoButton(onTap: (){
                        
  //                     }, title: "Cancel Request",
  //                       height: 0.05 * getHeight(context),
  //                       width: 0.37 * getWidth(context),
  //                       boarderRadius: 30 * getResponsive(context),
  //                       textStyle:  TextStyle(
  //                         fontSize: 17 * getResponsiveText(context),
  //                         fontWeight: FontWeight.w600,
  //                         color: AppColors.primary,
  //                       ),
  //                       backgroundColor: AppColors.white,
              
  //                     ),
  //                     MyCoButton(onTap: (){
                        
  //                     }, title: "Send Reminder",
  //                       height: 0.05 * getHeight(context),
  //                       width: 0.37 * getWidth(context),
  //                       boarderRadius: 30 * getResponsive(context),
  //                       textStyle:  TextStyle(
  //                         fontSize: 17 * getResponsiveText(context),
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
  //         SizedBox(height: 0.03 * getHeight(context),),
  //         Image.asset('assets/search_society/contact_admin.png',height: 0.35 * getHeight(context),),
  //       ],
  //     ),
  //   ),
  // );
}
