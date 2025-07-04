import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/search_company/presentation/widgets/box_design_registration.dart';
import 'package:myco_flutter/features/sign_in/presentation/widgets/custom_request_bottom_sheet.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';

class ContactAdminPage extends StatefulWidget {
  const ContactAdminPage({super.key});

  @override
  State<ContactAdminPage> createState() => _ContactAdminPageState();
}

class _ContactAdminPageState extends State<ContactAdminPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
          backgroundColor: AppColors.white,
          appBar: AppBar(
            title: const Text(
              'Developer(CHPL)',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: AppColors.black,
              ),
            ),
            // backgroundColor: AppColors.black,
          ),
          body: Padding(
            padding: const EdgeInsets.all(26.0),
            child: Column(
              children: [
                LinearDesignBox(
                  title: 'Parth Babriya',
                  // subTitle: 'Developer',
                  // inSingleLine: true,
                  isIncenter: true,
                  titleTextStyle: const TextStyle(
                    color: AppColors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                  color: const Color(0xFF2FBBA4),
                  child: Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 0.02 * getWidth(context)),
                    child: Column(
                      children: [
                         CircleAvatar(
                          radius: 54 * getResponsive(context),
                          backgroundImage: const AssetImage(
                            'assets/search_society/placeholder.png',
                          ),
                        ),
                         SizedBox(height: 0.01 * getHeight(context)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Designation:',
                              style: TextStyle(
                                fontSize: 13 * getResponsiveText(context),
                                fontWeight: FontWeight.w800,
                                color: AppColors.black,
                              ),
                            ),
                            SizedBox(width: 5),
                            Text(
                              'Flutter Developer',
                              style: TextStyle(fontSize: 13 * getResponsiveText(context), color: AppColors.black),
                            ),
                          ],
                        ),
                         SizedBox(height: 0.005 * getHeight(context)),
                         Text(
                          "Technical - Ahmedabad",
                          style: TextStyle(fontSize: 13 * getResponsiveText(context), color: AppColors.black),
                        ),
                        SizedBox(height: 0.005 * getHeight(context)),
                         Text(
                          "+91 99999 99999",
                          style: TextStyle(fontSize: 13 * getResponsiveText(context), color: AppColors.black),
                        ),
                         SizedBox(height: 0.012 * getHeight(context)),
                         Text(
                          "Account Not Activated Please Contact to Admin",
                          style: TextStyle(fontSize: 14 * getResponsiveText(context), color: AppColors.red),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            MyCoButton(onTap: (){

                            }, title: "Cancel Request",
                              height: 0.05 * getHeight(context),
                              width: 0.37 * getWidth(context),
                              boarderRadius: 30 * getResponsive(context),
                              textStyle:  TextStyle(
                                fontSize: 17 * getResponsiveText(context),
                                fontWeight: FontWeight.w600,
                                color: AppColors.primary,
                              ),
                              backgroundColor: AppColors.white,

                            ),
                            MyCoButton(onTap: (){
                              context.pop();
                              showModalBottomSheet(
                                  context: context,
                                  isScrollControlled: true,
                                  backgroundColor: AppTheme.getColor(context).onPrimary,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(20 * getResponsive(context)),
                                    ),
                                  ),
                                  builder: (_) => CustomRequestBottomSheet()
                              );
                            }, title: "Send Reminder",
                              height: 0.05 * getHeight(context),
                              width: 0.37 * getWidth(context),
                              boarderRadius: 30 * getResponsive(context),
                              textStyle:  TextStyle(
                                fontSize: 17 * getResponsiveText(context),
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                              backgroundColor: const Color(0xFF2F648E),
                              isShadowBottomLeft: true,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 0.03 * getHeight(context),),
                Image.asset('assets/search_society/contact_admin.png',height: 0.35 * getHeight(context),),
              ],
            ),
          ),
        );
}
