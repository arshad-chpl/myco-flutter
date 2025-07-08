import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myco_flutter/constants/constants.dart';
import 'package:myco_flutter/core/router/route_paths.dart';
import 'package:myco_flutter/core/services/preference_manager.dart';
import 'package:myco_flutter/features/admin_view/domain/entities/admin_view_entity.dart';
import 'package:myco_flutter/features/admin_view/utils/admin_view_filter.dart';
import 'package:myco_flutter/features/admin_view/utils/shared_admin_data_holder.dart';

mixin AdminMenuNavigation {
  static Future<void> handleMenuClick({
    required BuildContext context,
    required AdminViewResponseEntity? mainResponse,
    required AdminSubMenuEntity? modelSubMenu,
    required PreferenceManager preferenceManager,
    required SharedAdminDataHolder sharedAdminDataHolder,
  }) async {
    if (mainResponse == null || modelSubMenu == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(preferenceManager.readString('Coming_soon') as String),
        ),
      );
      return;
    }

    final filteredData = AdminViewFilter.filterDataForSubmenu(mainResponse, modelSubMenu);
    sharedAdminDataHolder.setAdminViewData(filteredData);
    sharedAdminDataHolder.setSubMenuData(modelSubMenu);

    final accessTypeId = modelSubMenu.accessTypeId;

    String buildPath(String subPath) => '${RoutePaths.adminView}/$subPath';

    switch (accessTypeId) {
      case VariableBag.ADMIN_VIEW_MENU_PENDING_LEAVES:
        context.push(buildPath(RoutePaths.adminPendingLeaves), extra: {'leave_status': '0', 'isAutoLeave': '0', 'access_type_id': accessTypeId});
        break;
      case VariableBag.ADMIN_VIEW_MENU_PENDING_EXPENSES:
        context.push(buildPath(RoutePaths.adminPendingExpenses), extra: {'expense_status': '0', 'access_type_id': accessTypeId});
        break;
      case VariableBag.ADMIN_VIEW_MENU_WFH_APPROVAL:
        context.push(buildPath(RoutePaths.adminWfhApproval), extra: {'no_data': modelSubMenu.accessTypeImage, 'access_type_id': accessTypeId});
        break;
      case VariableBag.ADMIN_VIEW_MENU_PAST_DATE_REQUEST_ATTENDANCE:
        context.push(buildPath(RoutePaths.adminPastDateAttendance), extra: {'access_type_id': accessTypeId});
        break;
      case VariableBag.ADMIN_VIEW_MENU_PUNCH_OUT_MISSING_REQUEST:
        context.push(buildPath(RoutePaths.adminPunchOutMissing), extra: {'access_type_id': accessTypeId});
        break;
      case VariableBag.ADMIN_VIEW_MENU_ESCALATION:
        context.push(buildPath(RoutePaths.adminEscalation), extra: {'no_data': modelSubMenu.accessTypeImage, 'access_type_id': accessTypeId});
        break;
      case VariableBag.ADMIN_VIEW_MENU_IDEA_APPROVAL:
        context.push(buildPath(RoutePaths.adminIdeaApproval), extra: {'access_type_id': accessTypeId});
        break;
      case VariableBag.ADMIN_VIEW_MENU_OUT_OF_RANGE_REQUEST:
        context.push(buildPath(RoutePaths.adminOutOfRangeRequest), extra: {'access_type_id': accessTypeId});
        break;
      case VariableBag.ADMIN_VIEW_MENU_APPROVE_EMPLOYEE:
        context.push(buildPath(RoutePaths.adminApproveEmployee), extra: {'access_type_id': accessTypeId});
        break;
      case VariableBag.ADMIN_VIEW_MENU_ONBOARDING:
        context.push(buildPath(RoutePaths.adminOnboarding), extra: {
          'BlockNo': preferenceManager.readString('blockId'),
          'blockId': preferenceManager.readString('blockId'),
          'blockName': preferenceManager.readString('blockUnitName'),
          'floorId': '0',
          'unitId': '0',
          'isFamily': false,
          'societyId': preferenceManager.readString('societyId'),
          'type': preferenceManager.readString('userType'),
          'from': '1',
          'baseUrl': preferenceManager.readString('baseUrl'),
          'apiKey': preferenceManager.readString('apiKey'),
          'isAddMore': false,
          'isAddByAdmin': true,
          'isAddMoreUnit': false,
          'isSociety': false,
          'loginVia': '0',
          'societyAddress': '',
          'access_type_id': accessTypeId,
        });
        break;
      case VariableBag.ADMIN_VIEW_MENU_ABSENT_PRESENT:
        context.push(buildPath(RoutePaths.adminAbsentPresent), extra: {'no_data': modelSubMenu.accessTypeImage, 'access_type_id': accessTypeId});
        break;
      case VariableBag.ADMIN_VIEW_MENU_MONTHLY_ATTENDANCE:
        context.push(buildPath(RoutePaths.adminMonthlyAttendance), extra: {'no_data': modelSubMenu.accessTypeImage, 'access_type_id': accessTypeId});
        break;
      case VariableBag.ADMIN_VIEW_MENU_DEVICE_CHANGE:
        context.push(buildPath(RoutePaths.adminDeviceChange), extra: {'access_type_id': accessTypeId});
        break;
      case VariableBag.ADMIN_VIEW_MENU_TRACK_EMPLOYEE:
        context.push(buildPath(RoutePaths.adminTrackEmployee), extra: {'access_type_id': accessTypeId});
        break;
      case VariableBag.ADMIN_VIEW_MENU_PERSONAL_INFO:
        context.push(buildPath(RoutePaths.adminPersonalInfo), extra: {'request_type': 1, 'access_type_id': accessTypeId});
        break;
      case VariableBag.ADMIN_VIEW_MENU_WORK_REPORT:
        context.push(buildPath(RoutePaths.adminWorkReport), extra: {'isReview': false, 'titleName': preferenceManager.readString('view_work_report'), 'access_type_id': accessTypeId});
        break;
      case VariableBag.ADMIN_VIEW_MENU_ADVANCE_SALARY_REQUEST:
        context.push(buildPath(RoutePaths.adminAdvanceSalaryRequest), extra: {'no_data': modelSubMenu.accessTypeImage, 'access_type_id': accessTypeId});
        break;
      case VariableBag.ADMIN_VIEW_MENU_LOAN_REQUEST:
        context.push(buildPath(RoutePaths.adminLoanRequest), extra: {'no_data': modelSubMenu.accessTypeImage, 'access_type_id': accessTypeId});
        break;
      case VariableBag.ADMIN_VIEW_MENU_PENDING_VISIT_APPROVAL:
        context.push(buildPath(RoutePaths.adminPendingVisitApproval), extra: {'access_type_id': accessTypeId});
        break;
      case VariableBag.ADMIN_VIEW_MENU_END_VISIT_APPROVAL:
        context.push(buildPath(RoutePaths.adminEndVisitApproval), extra: {'access_type_id': accessTypeId});
        break;
      case VariableBag.ADMIN_VIEW_MENU_VIEW_EMPLOYEE_VISITS:
        context.push(buildPath(RoutePaths.adminViewEmployeeVisits), extra: {'access_type_id': accessTypeId});
        break;
      case VariableBag.ADMIN_VIEW_MENU_SHIFT_CHANGE_REQUESTS:
        context.push(buildPath(RoutePaths.adminShiftChangeRequests), extra: {'access_type_id': accessTypeId});
        break;
      case VariableBag.ADMIN_VIEW_MENU_FACE_CHANGE_REQUESTS:
        context.push(buildPath(RoutePaths.adminFaceChangeRequests), extra: {'access_type_id': accessTypeId});
        break;
      case VariableBag.ADMIN_VIEW_MENU_ADVANCE_EXPENSE_REQUEST:
        context.push(buildPath(RoutePaths.adminAdvanceExpenseRequest), extra: {'access_type_id': accessTypeId});
        break;
      case VariableBag.ADMIN_VIEW_MENU_SHORT_LEAVE_REQUEST:
        context.push(buildPath(RoutePaths.adminShortLeaveRequest), extra: {'access_type_id': accessTypeId});
        break;
      case VariableBag.ADMIN_VIEW_MENU_BREAK_REQUEST:
        context.push(buildPath(RoutePaths.adminBreakRequest), extra: {'no_data': modelSubMenu.accessTypeImage, 'access_type_id': accessTypeId, 'break_status': '0'});
        break;
      case VariableBag.ADMIN_VIEW_MENU_GPS_INTERNET_SUMMARY:
        context.push(buildPath(RoutePaths.adminGpsInternetSummary), extra: {'access_type_id': accessTypeId});
        break;
      case VariableBag.ADMIN_VIEW_MENU_AUTO_LEAVES:
        context.push(buildPath(RoutePaths.adminAutoLeaves), extra: {'leave_status': '1', 'isAutoLeave': '1', 'access_type_id': accessTypeId});
        break;
      case VariableBag.ADMIN_VIEW_MENU_VIEW_SHORT_LEAVES:
        context.push(buildPath(RoutePaths.adminViewShortLeaves), extra: {'access_type_id': accessTypeId});
        break;
      case VariableBag.ADMIN_VIEW_MENU_SANDWICH_LEAVES:
        context.push(buildPath(RoutePaths.adminSandwichLeaves), extra: {'access_type_id': accessTypeId});
        break;
      case VariableBag.ADMIN_VIEW_MENU_REVIEW_WORK_REPORT:
        context.push(buildPath(RoutePaths.adminReviewWorkReport), extra: {'isReview': true, 'titleName': preferenceManager.readString('review_work_report'), 'access_type_id': accessTypeId});
        break;
      case VariableBag.ADMIN_VIEW_MENU_WORK_REPORT_SUMMARY:
        context.push(buildPath(RoutePaths.adminWorkReportSummary), extra: {'no_data': modelSubMenu.accessTypeImage, 'access_type_id': accessTypeId});
        break;
      case VariableBag.ADMIN_VIEW_MENU_TRACKING_SETTING:
        context.push(buildPath(RoutePaths.adminTrackingSetting), extra: {'access_type_id': accessTypeId});
        break;
      case VariableBag.ADMIN_VIEW_MENU_LIVE_MAP_VIEW:
        context.push(buildPath(RoutePaths.adminLiveMapView), extra: {'access_type_id': accessTypeId});
        break;
      case VariableBag.ADMIN_VIEW_MENU_TRAVEL_SUMMARY:
        context.push(buildPath(RoutePaths.adminTravelSummary), extra: {'access_type_id': accessTypeId, 'isMySummary': false});
        break;
      case VariableBag.ADMIN_VIEW_MENU_PAID_EXPENSE:
        context.push(buildPath(RoutePaths.adminPaidExpense), extra: {'expense_status': '3', 'access_type_id': accessTypeId});
        break;
      case VariableBag.ADMIN_VIEW_MENU_UNPAID_EXPENSE:
        context.push(buildPath(RoutePaths.adminUnpaidExpense), extra: {'expense_status': '4', 'access_type_id': accessTypeId});
        break;
      case VariableBag.ADMIN_VIEW_MENU_OFFBOARDING:
        context.push(buildPath(RoutePaths.adminOffboarding), extra: {'no_data': modelSubMenu.accessTypeImage, 'access_type_id': accessTypeId});
        break;
      case VariableBag.ADMIN_VIEW_MENU_CONTACT_INFO:
        context.push(buildPath(RoutePaths.adminContactInfo), extra: {'request_type': 2, 'access_type_id': accessTypeId});
        break;
      case VariableBag.ADMIN_VIEW_MENU_PAST_EXPERIENCE:
        context.push(buildPath(RoutePaths.adminPastExperience), extra: {'request_type': 3, 'access_type_id': accessTypeId});
        break;
      case VariableBag.ADMIN_VIEW_MENU_EDUCATION:
        context.push(buildPath(RoutePaths.adminEducation), extra: {'request_type': 5, 'access_type_id': accessTypeId});
        break;
      case VariableBag.ADMIN_VIEW_MENU_ACHIEVEMENTS:
        context.push(buildPath(RoutePaths.adminAchievements), extra: {'request_type': 4, 'access_type_id': accessTypeId});
        break;
      case VariableBag.ADMIN_VIEW_MENU_EMPLOYEES_FACE:
        context.push(buildPath(RoutePaths.adminEmployeesFace), extra: {'access_type_id': accessTypeId});
        break;
      default:
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(preferenceManager.readString('Coming_soon') as String),
          ),
        );
    }
  }
}