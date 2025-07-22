import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myco_flutter/core/router/route_paths.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/dashboard/domain/entites/home_menu_entity.dart';
import 'package:myco_flutter/widgets/border_container_wraper.dart';
import 'package:myco_flutter/widgets/custom_shadow_container.dart';
import 'package:shimmer/shimmer.dart';

class BigHomeMenu extends StatelessWidget {
  final List<AppMenuEntity> appMenuBig;
  const BigHomeMenu({required this.appMenuBig, super.key});

  @override
  Widget build(BuildContext context) {
    if (appMenuBig.isEmpty) {
      return const SizedBox.shrink();
    }
    return Row(
      spacing: 16,
      children: [
        Expanded(
          child: InkWell(
            onTap: () {
              context.push(RoutePaths.leave);
            },
            child: BigHomeMenuIcon(
              appMenuBig.first.menuIcon ?? '',
              appMenuBig.first.menuTitle ?? '',
              Responsive.getResponsive(context) * 70,
            ),
          ),
        ),
        Expanded(
          child: BigHomeMenuIcon(
            appMenuBig.last.menuIcon ?? '',
            appMenuBig.last.menuTitle ?? '',
            Responsive.getResponsive(context) * 70,
          ),
        ),
      ],
    );
  }
}

Widget BigHomeMenuIcon(String icon, String title, double? height) {
  return BorderContainerWraper(
    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
    child: CustomShadowContainer(
      width: double.infinity,
      image: CachedNetworkImage(
        imageUrl: icon,
        height: height,
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
      title: title,
    ),
  );
}
