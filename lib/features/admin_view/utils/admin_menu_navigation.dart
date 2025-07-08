import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myco_flutter/constants/constants.dart';
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

    // Filter the main response data for the selected sub-menu
    final filteredData = AdminViewFilter.filterDataForSubmenu(
      mainResponse,
      modelSubMenu,
    );
    sharedAdminDataHolder.setAdminViewData(filteredData);
    sharedAdminDataHolder.setSubMenuData(modelSubMenu);

    final accessTypeId = modelSubMenu.accessTypeId;
    String? route;

    switch (accessTypeId) {
      case VariableBag.ADMIN_VIEW_MENU_PENDING_LEAVES:
        route = '/admin/pending-leaves';
        context.push(
          route,
          extra: {
            'leave_status': '0',
            'isAutoLeave': '0',
            'access_type_id': accessTypeId,
          },
        );
        break;

      case VariableBag.ADMIN_VIEW_MENU_PENDING_EXPENSES:
        route = '/admin/pending-expenses';
        context.push(
          route,
          extra: {'expense_status': '0', 'access_type_id': accessTypeId},
        );
        break;

      case VariableBag.ADMIN_VIEW_MENU_WFH_APPROVAL:
        route = '/admin/wfh-approval';
        context.push(
          route,
          extra: {
            'no_data': modelSubMenu.accessTypeImage,
            'access_type_id': accessTypeId,
          },
        );
        break;

      case VariableBag.ADMIN_VIEW_MENU_PAST_DATE_REQUEST_ATTENDANCE:
        route = '/admin/past-date-attendance';
        context.push(route, extra: {'access_type_id': accessTypeId});
        break;

      case VariableBag.ADMIN_VIEW_MENU_PUNCH_OUT_MISSING_REQUEST:
        route = '/admin/punch-out-missing';
        context.push(route, extra: {'access_type_id': accessTypeId});
        break;

      case VariableBag.ADMIN_VIEW_MENU_ESCALATION:
        route = '/admin/escalation';
        context.push(
          route,
          extra: {
            'no_data': modelSubMenu.accessTypeImage,
            'access_type_id': accessTypeId,
          },
        );
        break;

      case VariableBag.ADMIN_VIEW_MENU_IDEA_APPROVAL:
        route = '/admin/idea-approval';
        context.push(route, extra: {'access_type_id': accessTypeId});
        break;

      case VariableBag.ADMIN_VIEW_MENU_OUT_OF_RANGE_REQUEST:
        route = '/admin/out-of-range-request';
        context.push(route, extra: {'access_type_id': accessTypeId});
        break;

      case VariableBag.ADMIN_VIEW_MENU_APPROVE_EMPLOYEE:
        route = '/admin/approve-employee';
        context.push(route, extra: {'access_type_id': accessTypeId});
        break;

      case VariableBag.ADMIN_VIEW_MENU_ONBOARDING:
        route = '/admin/onboarding';
        context.push(
          route,
          extra: {
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
          },
        );
        break;

      case VariableBag.ADMIN_VIEW_MENU_ABSENT_PRESENT:
        route = '/admin/absent-present';
        context.push(
          route,
          extra: {
            'no_data': modelSubMenu.accessTypeImage,
            'access_type_id': accessTypeId,
          },
        );
        break;

      case VariableBag.ADMIN_VIEW_MENU_MONTHLY_ATTENDANCE:
        route = '/admin/monthly-attendance';
        context.push(
          route,
          extra: {
            'no_data': modelSubMenu.accessTypeImage,
            'access_type_id': accessTypeId,
          },
        );
        break;

      case VariableBag.ADMIN_VIEW_MENU_DEVICE_CHANGE:
        route = '/admin/device-change';
        context.push(route, extra: {'access_type_id': accessTypeId});
        break;

      case VariableBag.ADMIN_VIEW_MENU_TRACK_EMPLOYEE:
        route = '/admin/track-employee';
        context.push(route, extra: {'access_type_id': accessTypeId});
        break;

      case VariableBag.ADMIN_VIEW_MENU_PERSONAL_INFO:
        route = '/admin/personal-info';
        context.push(
          route,
          extra: {
            'request_type': 1,
            'access_type_id': accessTypeId,
          },
        );
        break;

      case VariableBag.ADMIN_VIEW_MENU_WORK_REPORT:
        route = '/admin/work-report';
        context.push(
          route,
          extra: {
            'isReview': false,
            'titleName': preferenceManager.readString('view_work_report'),
            'access_type_id': accessTypeId,
          },
        );
        break;

      case VariableBag.ADMIN_VIEW_MENU_ADVANCE_SALARY_REQUEST:
        route = '/admin/advance-salary-request';
        context.push(
          route,
          extra: {
            'no_data': modelSubMenu.accessTypeImage,
            'access_type_id': accessTypeId,
          },
        );
        break;

      case VariableBag.ADMIN_VIEW_MENU_LOAN_REQUEST:
        route = '/admin/loan-request';
        context.push(
          route,
          extra: {
            'no_data': modelSubMenu.accessTypeImage,
            'access_type_id': accessTypeId,
          },
        );
        break;

      case VariableBag.ADMIN_VIEW_MENU_PENDING_VISIT_APPROVAL:
        route = '/admin/pending-visit-approval';
        context.push(route, extra: {'access_type_id': accessTypeId});
        break;

      case VariableBag.ADMIN_VIEW_MENU_END_VISIT_APPROVAL:
        route = '/admin/end-visit-approval';
        context.push(route, extra: {'access_type_id': accessTypeId});
        break;

      case VariableBag.ADMIN_VIEW_MENU_VIEW_EMPLOYEE_VISITS:
        route = '/admin/view-employee-visits';
        context.push(route, extra: {'access_type_id': accessTypeId});
        break;

      case VariableBag.ADMIN_VIEW_MENU_SHIFT_CHANGE_REQUESTS:
        route = '/admin/shift-change-requests';
        context.push(route, extra: {'access_type_id': accessTypeId});
        break;

      case VariableBag.ADMIN_VIEW_MENU_FACE_CHANGE_REQUESTS:
        route = '/admin/face-change-requests';
        context.push(route, extra: {'access_type_id': accessTypeId});
        break;

      case VariableBag.ADMIN_VIEW_MENU_ADVANCE_EXPENSE_REQUEST:
        route = '/admin/advance-expense-request';
        context.push(route, extra: {'access_type_id': accessTypeId});
        break;

      case VariableBag.ADMIN_VIEW_MENU_SHORT_LEAVE_REQUEST:
        route = '/admin/short-leave-request';
        context.push(route, extra: {'access_type_id': accessTypeId});
        break;

      case VariableBag.ADMIN_VIEW_MENU_BREAK_REQUEST:
        route = '/admin/break-request';
        context.push(
          route,
          extra: {
            'no_data': modelSubMenu.accessTypeImage,
            'access_type_id': accessTypeId,
            'break_status': '0',
          },
        );
        break;

      case VariableBag.ADMIN_VIEW_MENU_GPS_INTERNET_SUMMARY:
        route = '/admin/gps-internet-summary';
        context.push(route, extra: {'access_type_id': accessTypeId});
        break;

      case VariableBag.ADMIN_VIEW_MENU_AUTO_LEAVES:
        route = '/admin/auto-leaves';
        context.push(
          route,
          extra: {
            'leave_status': '1',
            'isAutoLeave': '1',
            'access_type_id': accessTypeId,
          },
        );
        break;

      case VariableBag.ADMIN_VIEW_MENU_VIEW_SHORT_LEAVES:
        route = '/admin/view-short-leaves';
        context.push(route, extra: {'access_type_id': accessTypeId});
        break;

      case VariableBag.ADMIN_VIEW_MENU_SANDWICH_LEAVES:
        route = '/admin/sandwich-leaves';
        context.push(route, extra: {'access_type_id': accessTypeId});
        break;

      case VariableBag.ADMIN_VIEW_MENU_REVIEW_WORK_REPORT:
        route = '/admin/review-work-report';
        context.push(
          route,
          extra: {
            'isReview': true,
            'titleName': preferenceManager.readString('review_work_report'),
            'access_type_id': accessTypeId,
          },
        );
        break;

      case VariableBag.ADMIN_VIEW_MENU_WORK_REPORT_SUMMARY:
        route = '/admin/work-report-summary';
        context.push(
          route,
          extra: {
            'no_data': modelSubMenu.accessTypeImage,
            'access_type_id': accessTypeId,
          },
        );
        break;

      case VariableBag.ADMIN_VIEW_MENU_TRACKING_SETTING:
        route = '/admin/tracking-setting';
        context.push(route, extra: {'access_type_id': accessTypeId});
        break;

      case VariableBag.ADMIN_VIEW_MENU_LIVE_MAP_VIEW:
        route = '/admin/live-map-view';
        context.push(route, extra: {'access_type_id': accessTypeId});
        break;

      case VariableBag.ADMIN_VIEW_MENU_TRAVEL_SUMMARY:
        route = '/admin/travel-summary';
        context.push(
          route,
          extra: {
            'access_type_id': accessTypeId,
            'isMySummary': false,
          },
        );
        break;

      case VariableBag.ADMIN_VIEW_MENU_PAID_EXPENSE:
        route = '/admin/paid-expense';
        context.push(
          route,
          extra: {
            'expense_status': '3',
            'access_type_id': accessTypeId,
          },
        );
        break;

      case VariableBag.ADMIN_VIEW_MENU_UNPAID_EXPENSE:
        route = '/admin/unpaid-expense';
        context.push(
          route,
          extra: {
            'expense_status': '4',
            'access_type_id': accessTypeId,
          },
        );
        break;

      case VariableBag.ADMIN_VIEW_MENU_OFFBOARDING:
        route = '/admin/offboarding';
        context.push(
          route,
          extra: {
            'no_data': modelSubMenu.accessTypeImage,
            'access_type_id': accessTypeId,
          },
        );
        break;

      case VariableBag.ADMIN_VIEW_MENU_CONTACT_INFO:
        route = '/admin/contact-info';
        context.push(
          route,
          extra: {
            'request_type': 2,
            'access_type_id': accessTypeId,
          },
        );
        break;

      case VariableBag.ADMIN_VIEW_MENU_PAST_EXPERIENCE:
        route = '/admin/past-experience';
        context.push(
          route,
          extra: {
            'request_type': 3,
            'access_type_id': accessTypeId,
          },
        );
        break;

      case VariableBag.ADMIN_VIEW_MENU_EDUCATION:
        route = '/admin/education';
        context.push(
          route,
          extra: {
            'request_type': 5,
            'access_type_id': accessTypeId,
          },
        );
        break;

      case VariableBag.ADMIN_VIEW_MENU_ACHIEVEMENTS:
        route = '/admin/achievements';
        context.push(
          route,
          extra: {
            'request_type': 4,
            'access_type_id': accessTypeId,
          },
        );
        break;

      case VariableBag.ADMIN_VIEW_MENU_EMPLOYEES_FACE:
        route = '/admin/employees-face';
        context.push(route, extra: {'access_type_id': accessTypeId});
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