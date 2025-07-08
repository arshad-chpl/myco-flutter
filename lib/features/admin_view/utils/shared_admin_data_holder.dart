/// Shared Admin Data Holder
///
/// Created by Aasifhusain Shaikh
///
/// This file defines a singleton-like class for holding shared admin view data across
/// different parts of the app. It stores the filtered admin view data and the selected
/// sub-menu for easy access.
/// Key technologies and patterns used:
/// - **Data Storage**: Acts as a simple in-memory store for sharing data between widgets.
/// - **Dependency Injection (DI)**: Typically accessed via GetIt for global availability.
library;

import 'package:myco_flutter/features/admin_view/domain/entities/admin_view_entity.dart';


/// Holds shared admin view data and selected sub-menu data.
///
/// Provides methods to set and get the [AdminViewResponseEntity] and [AdminSubMenuEntity]
/// to maintain state across different screens or widgets.
class SharedAdminDataHolder {
  // Private fields to store the admin view and sub-menu data.
  AdminViewResponseEntity? _adminViewData;
  AdminSubMenuEntity? _subMenuData;

  /// Sets the admin view data.
  ///
  /// @param data The [AdminViewResponseEntity] to store, typically filtered for a sub-menu.
  void setAdminViewData(AdminViewResponseEntity? data) {
    _adminViewData = data; // Store the provided data.
  }

  /// Gets the stored admin view data.
  ///
  /// @return The stored [AdminViewResponseEntity] or null if not set.
  AdminViewResponseEntity? get adminViewData => _adminViewData;

  /// Sets the selected sub-menu data.
  ///
  /// @param data The [AdminSubMenuEntity] to store.
  void setSubMenuData(AdminSubMenuEntity? data) {
    _subMenuData = data; // Store the provided sub-menu.
  }

  /// Gets the stored sub-menu data.
  ///
  /// @return The stored [AdminSubMenuEntity] or null if not set.
  AdminSubMenuEntity? get subMenuData => _subMenuData;
}
