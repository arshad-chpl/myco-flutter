import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myco_flutter/constants/app_assets.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/dashboard/presentation/widgets/custom_section.dart';
import 'package:myco_flutter/widgets/border_container_wraper.dart';
import 'package:myco_flutter/widgets/custom_shadow_container.dart';

class QuickActionSection extends StatelessWidget {
  QuickActionSection({super.key});

  List quickAccessOptions = ["Employee","Leave","Assets","Take Order","Lost and Found","Sales","Visits","CRM","Documents","Attendance","Work Allocation","IdeaBox"];
  List quickAccessOptionsNavigation = ["/employees","/leave","/assets-home","/take-order","/lost-and-found","","/my-visit","","","","",""];

  @override
  Widget build(BuildContext context) => CustomSection(
                  title: 'Quick Access',
                  subtitle: 'All Your Work Related Tools.',
                  icon: Image.asset(
                    AppAssets.quickAccessGif,
                    height: 70 * Responsive.getResponsiveOnWidth(context),
                  ),
                  hasViewMoreButton: true,
                  count: '04',
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, // 2 columns
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      childAspectRatio: 0.78, // Adjust for container shape
                    ),
                    itemCount: 12,
                    itemBuilder: (context, index) => InkWell(
                      onTap: () {
                        if(quickAccessOptionsNavigation[index].toString().isNotEmpty) {
                          context.push(quickAccessOptionsNavigation[index]);
                        }
                      },
                      child: BorderContainerWraper(
                        padding: const EdgeInsets.all(14.5),
                        child: CustomShadowContainer(
                          image:
                              Container(), // Replace with actual image if needed
                          title: quickAccessOptions[index],
                        ),
                      ),
                    ),
                  ),
                );
}
