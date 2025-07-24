import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myco_flutter/constants/app_assets.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/dashboard/domain/entites/home_menu_response_entity.dart';
import 'package:myco_flutter/features/dashboard/presentation/widgets/custom_section.dart';
import 'package:myco_flutter/widgets/border_container_wraper.dart';
import 'package:myco_flutter/widgets/custom_shadow_container.dart';
import 'package:shimmer/shimmer.dart';

class QuickActionSection extends StatelessWidget {
  final List<AppMenuEntity>? appMenuHome;
  QuickActionSection({super.key, this.appMenuHome});

  // List quickAccessOptions = [
  //   "Employee",
  //   "Leave",
  //   "Assets",
  //   "Take Order",
  //   "Lost and Found",
  //   "Sales",
  //   "Visits",
  //   "CRM",
  //   "Documents",
  //   "Attendance",
  //   "Work Allocation",
  //   "IdeaBox",
  // ];
  // List quickAccessOptionsNavigation = [
  //   "/employees",
  //   "/leave",
  //   "/assets-home",
  //   "/take-order",
  //   "/lost-and-found",
  //   "",
  //   "/my-visit",
  //   "",
  //   "",
  //   "",
  //   "",
  //   RoutePaths.adminView,
  // ];

  @override
  Widget build(BuildContext context) {
    if (appMenuHome == null || appMenuHome!.isEmpty) {
      return const SizedBox.shrink();
    }
    return CustomSection(
      title: 'Quick Access',
      subtitle: 'All Your Work Related Tools.',
      icon: Image.asset(
        AppAssets.quickAccessGif,
        height: 70 * Responsive.getResponsiveOnWidth(context),
      ),
      count: '04',
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: Responsive.getGridConfig(
                context,
                screenWide: constraints.maxWidth,
              ).itemCount, // 2 columns
              crossAxisSpacing: Responsive.getGridConfig(
                context,
                screenWide: constraints.maxWidth,
              ).spacing,
              mainAxisSpacing: Responsive.getGridConfig(
                context,
                screenWide: constraints.maxWidth,
              ).spacing,
              childAspectRatio: Responsive.getGridConfig(
                context,
                screenWide: constraints.maxWidth,
              ).childAspectRatio, // Adjust for container shape
            ),
            itemCount: appMenuHome?.length ?? 0,
            itemBuilder: (context, index) => InkWell(
              onTap: () {
                context.pushNamed(appMenuHome?[index].iosMenuClick ?? '');
                // if (quickAccessOptionsNavigation[index].toString().isNotEmpty) {
                //   context.push(quickAccessOptionsNavigation[index]);
                // }
              },
              child: BorderContainerWraper(
                padding: EdgeInsets.zero,
                child: CustomShadowContainer(
                  title: appMenuHome?[index].menuLanguageKey ?? '',
                  boxPadding: 14 * Responsive.getDashboardResponsive(context),
                  imagePadding: 20 * Responsive.getDashboardResponsive(context),
                  image: CachedNetworkImage(
                    imageUrl: appMenuHome?[index].menuIcon ?? '',

                    // height: height,
                    placeholder: (context, url) => Shimmer.fromColors(
                      baseColor: Colors.grey.shade300,
                      highlightColor: Colors.grey.shade100,
                      child: Container(
                        width: 28,
                        height: 28,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
                    errorWidget: (context, url, error) =>
                        Image.asset('assets/images/logo.png'),
                  ), // Replace with actual image if needed
                ),
              ),
            ),
          );
        },
        // child: ,
      ),
    );
  }
}
