import 'package:go_router/go_router.dart';
import 'package:myco_flutter/core/router/route_paths.dart';
import 'package:myco_flutter/features/admin_view/presentation/pages/admin_view_maintenance_page.dart';

final List<RouteBase> adminViewRoutes = [
  GoRoute(
    path: RoutePaths.adminPendingLeaves,
    builder: (context, state) => AdminViewMaintenancePage(title: 'Pending Leaves', extra: state.extra as Map<String, dynamic>?),
  ),
  GoRoute(
    path: RoutePaths.adminPendingExpenses,
    builder: (context, state) => AdminViewMaintenancePage(title: 'Pending Expenses', extra: state.extra as Map<String, dynamic>?),
  ),
  GoRoute(
    path: RoutePaths.adminWfhApproval,
    builder: (context, state) => AdminViewMaintenancePage(title: 'Work From Home Approval', extra: state.extra as Map<String, dynamic>?),
  ),
  GoRoute(
    path: RoutePaths.adminPastDateAttendance,
    builder: (context, state) => AdminViewMaintenancePage(title: 'Past Date Attendance Request', extra: state.extra as Map<String, dynamic>?),
  ),
  GoRoute(
    path: RoutePaths.adminPunchOutMissing,
    builder: (context, state) => AdminViewMaintenancePage(title: 'Punch Out Missing Request', extra: state.extra as Map<String, dynamic>?),
  ),
  GoRoute(
    path: RoutePaths.adminEscalation,
    builder: (context, state) => AdminViewMaintenancePage(title: 'Escalation Requests', extra: state.extra as Map<String, dynamic>?),
  ),
  GoRoute(
    path: RoutePaths.adminIdeaApproval,
    builder: (context, state) => AdminViewMaintenancePage(title: 'Idea Box Approval', extra: state.extra as Map<String, dynamic>?),
  ),
  GoRoute(
    path: RoutePaths.adminOutOfRangeRequest,
    builder: (context, state) => AdminViewMaintenancePage(title: 'Out of Range Request', extra: state.extra as Map<String, dynamic>?),
  ),
  GoRoute(
    path: RoutePaths.adminApproveEmployee,
    builder: (context, state) => AdminViewMaintenancePage(title: 'Approve Employee', extra: state.extra as Map<String, dynamic>?),
  ),
  GoRoute(
    path: RoutePaths.adminOnboarding,
    builder: (context, state) => AdminViewMaintenancePage(title: 'Employee Onboarding', extra: state.extra as Map<String, dynamic>?),
  ),
  GoRoute(
    path: RoutePaths.adminAbsentPresent,
    builder: (context, state) => AdminViewMaintenancePage(title: 'Absent/Present View', extra: state.extra as Map<String, dynamic>?),
  ),
  GoRoute(
    path: RoutePaths.adminMonthlyAttendance,
    builder: (context, state) => AdminViewMaintenancePage(title: 'Monthly Attendance', extra: state.extra as Map<String, dynamic>?),
  ),
  GoRoute(
    path: RoutePaths.adminDeviceChange,
    builder: (context, state) => AdminViewMaintenancePage(title: 'Device Change Request', extra: state.extra as Map<String, dynamic>?),
  ),
  GoRoute(
    path: RoutePaths.adminTrackEmployee,
    builder: (context, state) => AdminViewMaintenancePage(title: 'Track Employee', extra: state.extra as Map<String, dynamic>?),
  ),
  GoRoute(
    path: RoutePaths.adminPersonalInfo,
    builder: (context, state) => AdminViewMaintenancePage(title: 'Personal Info Request', extra: state.extra as Map<String, dynamic>?),
  ),
  GoRoute(
    path: RoutePaths.adminWorkReport,
    builder: (context, state) => AdminViewMaintenancePage(title: 'Work Report', extra: state.extra as Map<String, dynamic>?),
  ),
  GoRoute(
    path: RoutePaths.adminAdvanceSalaryRequest,
    builder: (context, state) => AdminViewMaintenancePage(title: 'Advance Salary Request', extra: state.extra as Map<String, dynamic>?),
  ),
  GoRoute(
    path: RoutePaths.adminLoanRequest,
    builder: (context, state) => AdminViewMaintenancePage(title: 'Loan Request', extra: state.extra as Map<String, dynamic>?),
  ),
  GoRoute(
    path: RoutePaths.adminPendingVisitApproval,
    builder: (context, state) => AdminViewMaintenancePage(title: 'Pending Visit Approval', extra: state.extra as Map<String, dynamic>?),
  ),
  GoRoute(
    path: RoutePaths.adminEndVisitApproval,
    builder: (context, state) => AdminViewMaintenancePage(title: 'End Visit Approval', extra: state.extra as Map<String, dynamic>?),
  ),
  GoRoute(
    path: RoutePaths.adminViewEmployeeVisits,
    builder: (context, state) => AdminViewMaintenancePage(title: 'View Employee Visits', extra: state.extra as Map<String, dynamic>?),
  ),
  GoRoute(
    path: RoutePaths.adminShiftChangeRequests,
    builder: (context, state) => AdminViewMaintenancePage(title: 'Shift Change Requests', extra: state.extra as Map<String, dynamic>?),
  ),
  GoRoute(
    path: RoutePaths.adminFaceChangeRequests,
    builder: (context, state) => AdminViewMaintenancePage(title: 'Face Change Requests', extra: state.extra as Map<String, dynamic>?),
  ),
  GoRoute(
    path: RoutePaths.adminAdvanceExpenseRequest,
    builder: (context, state) => AdminViewMaintenancePage(title: 'Advance Expense Request', extra: state.extra as Map<String, dynamic>?),
  ),
  GoRoute(
    path: RoutePaths.adminShortLeaveRequest,
    builder: (context, state) => AdminViewMaintenancePage(title: 'Short Leave Request', extra: state.extra as Map<String, dynamic>?),
  ),
  GoRoute(
    path: RoutePaths.adminBreakRequest,
    builder: (context, state) => AdminViewMaintenancePage(title: 'Break Request', extra: state.extra as Map<String, dynamic>?),
  ),
  GoRoute(
    path: RoutePaths.adminGpsInternetSummary,
    builder: (context, state) => AdminViewMaintenancePage(title: 'GPS Internet Summary', extra: state.extra as Map<String, dynamic>?),
  ),
  GoRoute(
    path: RoutePaths.adminAutoLeaves,
    builder: (context, state) => AdminViewMaintenancePage(title: 'Auto Leaves', extra: state.extra as Map<String, dynamic>?),
  ),
  GoRoute(
    path: RoutePaths.adminViewShortLeaves,
    builder: (context, state) => AdminViewMaintenancePage(title: 'View Short Leaves', extra: state.extra as Map<String, dynamic>?),
  ),
  GoRoute(
    path: RoutePaths.adminSandwichLeaves,
    builder: (context, state) => AdminViewMaintenancePage(title: 'Sandwich Leaves', extra: state.extra as Map<String, dynamic>?),
  ),
  GoRoute(
    path: RoutePaths.adminReviewWorkReport,
    builder: (context, state) => AdminViewMaintenancePage(title: 'Review Work Report', extra: state.extra as Map<String, dynamic>?),
  ),
  GoRoute(
    path: RoutePaths.adminWorkReportSummary,
    builder: (context, state) => AdminViewMaintenancePage(title: 'Work Report Summary', extra: state.extra as Map<String, dynamic>?),
  ),
  GoRoute(
    path: RoutePaths.adminTrackingSetting,
    builder: (context, state) => AdminViewMaintenancePage(title: 'Tracking Setting', extra: state.extra as Map<String, dynamic>?),
  ),
  GoRoute(
    path: RoutePaths.adminLiveMapView,
    builder: (context, state) => AdminViewMaintenancePage(title: 'Live Map View', extra: state.extra as Map<String, dynamic>?),
  ),
  GoRoute(
    path: RoutePaths.adminTravelSummary,
    builder: (context, state) => AdminViewMaintenancePage(title: 'Travel Summary', extra: state.extra as Map<String, dynamic>?),
  ),
  GoRoute(
    path: RoutePaths.adminPaidExpense,
    builder: (context, state) => AdminViewMaintenancePage(title: 'Paid Expenses', extra: state.extra as Map<String, dynamic>?),
  ),
  GoRoute(
    path: RoutePaths.adminUnpaidExpense,
    builder: (context, state) => AdminViewMaintenancePage(title: 'Unpaid Expenses', extra: state.extra as Map<String, dynamic>?),
  ),
  GoRoute(
    path: RoutePaths.adminOffboarding,
    builder: (context, state) => AdminViewMaintenancePage(title: 'Employee Offboarding', extra: state.extra as Map<String, dynamic>?),
  ),
  GoRoute(
    path: RoutePaths.adminContactInfo,
    builder: (context, state) => AdminViewMaintenancePage(title: 'Contact Info Request', extra: state.extra as Map<String, dynamic>?),
  ),
  GoRoute(
    path: RoutePaths.adminPastExperience,
    builder: (context, state) => AdminViewMaintenancePage(title: 'Past Experience Request', extra: state.extra as Map<String, dynamic>?),
  ),
  GoRoute(
    path: RoutePaths.adminEducation,
    builder: (context, state) => AdminViewMaintenancePage(title: 'Education Request', extra: state.extra as Map<String, dynamic>?),
  ),
  GoRoute(
    path: RoutePaths.adminAchievements,
    builder: (context, state) => AdminViewMaintenancePage(title: 'Achievements Request', extra: state.extra as Map<String, dynamic>?),
  ),
  GoRoute(
    path: RoutePaths.adminEmployeesFace,
    builder: (context, state) => AdminViewMaintenancePage(title: 'Employees Face Management', extra: state.extra as Map<String, dynamic>?),
  ),
];