/// Admin View Filter Utility
///
/// Created by Aasifhusain Shaikh
///
/// This file provides a utility class for filtering admin view data based on a selected sub-menu.
/// It ensures that only relevant branches, departments, and employees are included in the filtered data.
/// Key technologies and patterns used:
/// - **Data Filtering**: Filters lists based on IDs from the sub-menu.
/// - **Data Transformation**: Creates a new [AdminViewResponseEntity] with filtered data.
library;

import 'package:myco_flutter/features/admin_view/domain/entities/admin_view_entity.dart';


/// Utility class for filtering admin view data for a specific sub-menu.
mixin AdminViewFilter {
  /// Filters the branches, departments, and employees based on the sub-menu's IDs.
  ///
  /// Takes the full [AdminViewResponseEntity] and filters its lists to include only items
  /// whose IDs are present in the sub-menu's `branchIds`, `departmentIds`, or `employeeIds`.
  /// Returns a new [AdminViewResponseEntity] with the filtered data, preserving other fields.
  ///
  /// @param adminViewMenuDomainData The original response containing all data.
  /// @param adminSubMenu The sub-menu whose IDs will be used for filtering.
  /// @return A filtered [AdminViewResponseEntity].
  static AdminViewResponseEntity filterDataForSubmenu(
    AdminViewResponseEntity adminViewMenuDomainData,
    AdminSubMenuEntity adminSubMenu,
  ) {
    // Convert comma-separated ID strings to sets for efficient lookup.
    final branchIdsSet =
        adminSubMenu.branchIds?.split(',').map((e) => e.trim()).toSet() ?? {};
    final departmentIdsSet =
        adminSubMenu.departmentIds?.split(',').map((e) => e.trim()).toSet() ??
        {};
    final employeeIdsSet =
        adminSubMenu.employeeIds?.split(',').map((e) => e.trim()).toSet() ?? {};

    // Create a new AdminViewResponseEntity with filtered lists.
    return AdminViewResponseEntity(
      branchList:
          adminViewMenuDomainData.branchList
              ?.where((branch) => branchIdsSet.contains(branch.blockId))
              .toList(),
      // Filter branches by blockId.
      departmentList:
          adminViewMenuDomainData.departmentList
              ?.where((dept) => departmentIdsSet.contains(dept.floorId))
              .toList(),
      // Filter departments by floorId.
      employeeList:
          adminViewMenuDomainData.employeeList
              ?.where((emp) => employeeIdsSet.contains(emp.userId))
              .toList(),
      // Filter employees by userId.
      adminMenuCategory: adminViewMenuDomainData.adminMenuCategory,
      // Preserve menu categories.
      message: adminViewMenuDomainData.message,
      // Preserve message.
      status: adminViewMenuDomainData.status, // Preserve status.
    );
  }
}
