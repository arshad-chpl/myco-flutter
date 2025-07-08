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
import 'package:highlight_text/highlight_text.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/features/admin_view/domain/entities/admin_view_entity.dart';
import 'package:myco_flutter/widgets/custom_text.dart';
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
      childAspectRatio: 0.85, // Aspect ratio for each grid item.
      mainAxisSpacing: 12,
      crossAxisSpacing: 12,
    ),
    itemCount: subMenus.length,
    itemBuilder: (context, index) {
      final subMenu = subMenus[index];
      final pendingCount = subMenu?.pendingCount;
      final hasPending = pendingCount != null && pendingCount != '0';

      return Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => onSubMenuTap(subMenu), // Trigger tap callback.
          borderRadius: BorderRadius.circular(12),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color:
                    isFromNotificationReminder && hasPending
                        ? AppColors.error.withOpacity(0.3)
                        : Colors.grey.shade200,
              ),
              boxShadow: [
                BoxShadow(
                  color:
                      isFromNotificationReminder && hasPending
                          ? AppColors.error.withOpacity(0.08)
                          : Colors.grey.withOpacity(0.06),
                  blurRadius: 6,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Stack(
              children: [
                // Main content: image and title.
                Column(
                  children: [
                    SizedBox(
                      height: 70,
                      child: Center(
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: AppColors.primary.withOpacity(0.08),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: CachedNetworkImage(
                            imageUrl: subMenu?.accessTypeImageNew ?? '',
                            width: 28,
                            height: 28,
                            placeholder:
                                (context, url) => Shimmer.fromColors(
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
                            errorWidget:
                                (context, url, error) => Image.asset(
                                  'assets/images/logo.png',
                                  width: 28,
                                  height: 28,
                                ),
                          ),
                        ),
                      ),
                    ),
                    // Text section with highlighted search query.
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 4,
                        ),
                        child: Center(
                          child: TextHighlight(
                            text: subMenu?.accessType ?? '',
                            words: {
                              searchQuery: HighlightedWord(
                                textStyle: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w600,
                                  backgroundColor: AppColors.primary
                                      .withOpacity(0.2),
                                  height: 1.2,
                                ),
                              ),
                            },
                            textStyle: const TextStyle(
                              fontSize: 12,
                              color: Colors.black87,
                              fontWeight: FontWeight.w500,
                              height: 1.2,
                            ),
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                // Pending count badge, shown if there are pending items.
                if (hasPending)
                  Positioned(
                    top: 6,
                    right: 6,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 5,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color:
                            isFromNotificationReminder
                                ? AppColors.error
                                : AppColors.primary,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: (isFromNotificationReminder
                                    ? AppColors.error
                                    : AppColors.primary)
                                .withOpacity(0.3),
                            blurRadius: 3,
                            offset: const Offset(0, 1),
                          ),
                        ],
                      ),
                      child: CustomText(
                        pendingCount,
                        fontSize: 9,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
