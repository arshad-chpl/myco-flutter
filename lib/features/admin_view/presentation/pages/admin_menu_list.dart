/// Admin Menu List Widget
///
/// Created by Aasifhusain Shaikh
///
/// This file defines a widget that displays a list of admin menu categories.
/// It supports filtering based on a search query and handles navigation to sub-menus.
/// Key technologies and patterns used:
/// - **Dependency Injection (DI)**: Uses GetIt to access [PreferenceManager] and [SharedAdminDataHolder].
/// - **Localization**: Uses [LanguageManager] for multilingual support.
/// - **UI Components**: Uses Material Design widgets, [CachedNetworkImage] for images, and [Shimmer] for loading animations.
/// - **Search Filtering**: Filters categories and sub-menus based on the search query.
/// - **Navigation**: Uses [AdminMenuNavigation] for handling sub-menu clicks.
library;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:myco_flutter/constants/app_assets.dart';
import 'package:myco_flutter/core/services/preference_manager.dart';
import 'package:myco_flutter/core/utils/language_manager.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/admin_view/domain/entities/admin_view_entity.dart';
import 'package:myco_flutter/features/admin_view/presentation/pages/admin_sub_menu_list.dart';
import 'package:myco_flutter/features/admin_view/utils/admin_menu_navigation.dart';
import 'package:myco_flutter/features/admin_view/utils/shared_admin_data_holder.dart';
import 'package:myco_flutter/features/dashboard/presentation/widgets/custom_label_gifs.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

/// Displays a list of admin menu categories with search filtering.
///
/// Shows a list of categories, each with a header and optional sub-menus.
/// If the search query matches, highlights the matching text.
class AdminMenuList extends StatelessWidget {
  final AdminViewResponseEntity adminViewResponse;
  final List<AdminMenuCategoryEntity?> categories; // List of menu categories.
  final String searchQuery; // Current search query for filtering.
  final bool
  isFromNotificationReminder; // Indicates if opened from a notification.

  const AdminMenuList({
    required this.categories,
    required this.searchQuery,
    required this.isFromNotificationReminder,
    required this.adminViewResponse,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // Filter categories based on the search query.
    final filteredCategories = searchQuery.isEmpty
        ? categories
        : categories.where((category) {
            final parentMatches =
                category?.accessType?.toLowerCase().contains(
                  searchQuery.toLowerCase(),
                ) ??
                false;
            final childMatches =
                category?.adminSubMenu?.any(
                  (subMenu) =>
                      subMenu.accessType?.toLowerCase().contains(
                        searchQuery.toLowerCase(),
                      ) ??
                      false,
                ) ??
                false;
            return parentMatches || childMatches;
          }).toList();

    // Show a "no results" message if no categories match.
    if (filteredCategories.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.search_off,
                size: 48,
                color: Colors.grey.shade400,
              ),
            ),
            const SizedBox(height: 24),
            CustomText(
              LanguageManager().get('no_data_available'),
              color: Colors.grey.shade600,
            ),
            const SizedBox(height: 8),
            CustomText(
              'Try searching with different keywords',
              fontSize: 14,
              color: Colors.grey.shade500,
            ),
          ],
        ),
      );
    }

    // Build a scrollable list of categories.
    return ListView.builder(
      padding: EdgeInsets.only(
        left: 16 * Responsive.getResponsive(context),
        right: 16 * Responsive.getResponsive(context),
        bottom: 24 * Responsive.getResponsive(context),
      ),
      itemCount: filteredCategories.length,
      itemBuilder: (context, index) {
        final category = filteredCategories[index];
        return AnimatedContainer(
          duration: Duration(milliseconds: 200 + (index * 50)),

          // Staggered animation.
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Category header with gradient background and highlighted text.
              CustomLabelGifs(
                gifAssetPath: AppAssets.quickAccessGif,
                title: category?.accessType ?? '',
                highlight: searchQuery,  // on search it highlight
                isHighlightOn: searchQuery.isNotEmpty, // flag for highlight
              ),

              // Divider between header and sub-menus.
              if (category?.adminSubMenu?.isNotEmpty ?? false) ...[
                // Sub-menu section.
                Padding(
                  padding: EdgeInsets.only(
                    top: 22 * Responsive.getResponsive(context),
                    bottom: 12 * Responsive.getResponsive(context),
                  ),
                  child: AdminSubMenuList(
                    subMenus: category!.adminSubMenu!,
                    searchQuery: searchQuery,
                    isFromNotificationReminder: isFromNotificationReminder,
                    onSubMenuTap: (subMenu) {
                      // Handle sub-menu navigation.
                      AdminMenuNavigation.handleMenuClick(
                        context: context,
                        mainResponse: adminViewResponse,
                        modelSubMenu: subMenu,
                        preferenceManager: GetIt.I<PreferenceManager>(),
                        sharedAdminDataHolder: GetIt.I<SharedAdminDataHolder>(),
                      );
                    },
                  ),
                ),
              ],
            ],
          ),
        );
      },
    );
  }
}
