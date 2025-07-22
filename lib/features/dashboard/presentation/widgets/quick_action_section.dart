import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myco_flutter/constants/app_assets.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/dashboard/domain/entites/home_menu_entity.dart';
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
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: Responsive.getGridConfig(
            context,
          ).itemCount, // 2 columns
          crossAxisSpacing: Responsive.getGridConfig(context).spacing,
          mainAxisSpacing: Responsive.getGridConfig(context).spacing,
          childAspectRatio: Responsive.getGridConfig(
            context,
          ).childAspectRatio, // Adjust for container shape
        ),
        itemCount: appMenuHome?.length ?? 0,
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            context.pushNamed(
              appMenuHome?[index].iosMenuClick ?? '',
            );

          },
          child: BorderContainerWraper(
            padding: EdgeInsets.zero,
            child: CustomShadowContainer(
              height: Responsive.getResponsive(context) * 0,
              width: Responsive.getResponsive(context) * 0,
              title: appMenuHome?[index].menuLanguageKey ?? '',
              boxPadding: 14 * Responsive.getResponsive(context),
              imagePadding: 20 * Responsive.getResponsive(context),
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
      ),
    );
  }
}
