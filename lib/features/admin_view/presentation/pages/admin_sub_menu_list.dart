/// Admin Sub-Menu List Widget
///
/// Created by Aasifhusain Shaikh
///
/// This file defines a widget that displays a grid of admin sub-menu items.
/// Each item shows an image, title, and optional pending count badge.
/// Key technologies and patterns used:
/// - **UI Components**: Uses Material Design [GridView], [CachedNetworkImage], and [Shimmer] for loading animations.
/// - **Search Highlighting**: Uses [highlight_text] to highlight search matches.
/// - **Tap Handling**: Supports a callback for handling sub-menu taps.
library;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/admin_view/domain/entities/admin_view_entity.dart';
import 'package:myco_flutter/features/asset/widgets/cached_image_holder.dart';
import 'package:myco_flutter/widgets/border_container_wraper.dart';
import 'package:myco_flutter/widgets/custom_media_picker_container/custom_shadow_container.dart';
import 'package:shimmer/shimmer.dart';

/// Displays a grid of admin sub-menu items with images and titles.
///
/// Supports search highlighting and shows pending count badges when applicable.
class AdminSubMenuList extends StatelessWidget {
  final List<AdminSubMenuEntity?> subMenus; // List of sub-menu items.
  final String searchQuery; // Current search query for highlighting.
  final bool
  isFromNotificationReminder; // Indicates if opened from a notification.
  final Function(AdminSubMenuEntity?)
  onSubMenuTap; // Callback for sub-menu taps.

  const AdminSubMenuList({
    required this.subMenus,
    required this.searchQuery,
    required this.isFromNotificationReminder,
    required this.onSubMenuTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) =>
      // Build a grid of sub-menu items.
      GridView.builder(
        shrinkWrap: true,
        // Prevent the grid from taking infinite height.
        physics: const NeverScrollableScrollPhysics(),
        // Disable grid scrolling.
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, // 3 items per row.
          childAspectRatio: 0.73, // Aspect ratio for each grid item.
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
        ),
        itemCount: subMenus.length,
        itemBuilder: (context, index) {
          final subMenu = subMenus[index];

          final notificationCount = int.tryParse(subMenu?.pendingCount ?? "");

          return GestureDetector(
            onTap: () => onSubMenuTap(subMenu), // Trigger tap callback.
            child: BorderContainerWraper(
              // Badge count and visibility
              notificationCount: notificationCount.toString(),
              isNotificationBadge: notificationCount! > 0, // Show badge if > 0
              padding: const EdgeInsets.all(14.5),
              borderRadius: 12,
              backgroundColor: AppTheme.getColor(context).surfaceBright,
              // height: Responsive.getHeight(context),
              child: CustomShadowContainer(
                containerHeight: 0.09 * Responsive.getHeight(context),
                width: 0.2 * Responsive.getWidth(context),

                // Image with shimmer placeholder and fallback
                image: CachedImage(
                  imageUrl: subMenu?.accessTypeImageNew ?? '',
                  errorWidget: Image.asset(
                    'assets/images/logo.png',
                    width: 28,
                    height: 28,
                  ),
                ),

                // Title
                title: subMenu?.accessType ?? '',
                textAlign: TextAlign.center,
              ),
            ),
          );
        },
      );
}
