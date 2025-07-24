// To parse this JSON data, do
//
//     final myUnitResponse = myUnitResponseFromJson(jsonString);

import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:myco_flutter/features/dashboard/domain/entites/my_unit_response_entity.dart';

part 'my_unit_response.g.dart';

MyUnitResponse myUnitResponseFromJson(String str) =>
    MyUnitResponse.fromJson(json.decode(str));

String myUnitResponseToJson(MyUnitResponse data) => json.encode(data.toJson());

@HiveType(typeId: 5)
@JsonSerializable()
class MyUnitResponse {
  @HiveField(0)
  @JsonKey(name: "android_location_tracking_loop_type")
  String? androidLocationTrackingLoopType;
  @HiveField(1)
  @JsonKey(name: "upcoming_events")
  bool? upcomingEvents;
  @HiveField(2)
  @JsonKey(name: "out_of_range_punch_in_restriction_msg")
  String? outOfRangePunchInRestrictionMsg;
  @HiveField(3)
  @JsonKey(name: "out_of_range_punch_out_restriction_msg")
  String? outOfRangePunchOutRestrictionMsg;
  @HiveField(4)
  @JsonKey(name: "today_birth_days")
  List<TodayBirthDay>? todayBirthDays;
  @HiveField(5)
  @JsonKey(name: "manager_level_visits")
  String? managerLevelVisits;
  @HiveField(6)
  @JsonKey(name: "expire_msg")
  String? expireMsg;
  @HiveField(7)
  @JsonKey(name: "is_plan_expired")
  bool? isPlanExpired;
  @HiveField(8)
  @JsonKey(name: "wfh_apply_type")
  String? wfhApplyType;
  @HiveField(9)
  @JsonKey(name: "restrict_user_profile")
  bool? restrictUserProfile;
  @HiveField(10)
  @JsonKey(name: "allow_zero_product_price_order")
  bool? allowZeroProductPriceOrder;
  @HiveField(11)
  @JsonKey(name: "customer_visibility")
  bool? customerVisibility;
  @HiveField(12)
  @JsonKey(name: "calculate_visit_distance")
  bool? calculateVisitDistance;
  @HiveField(13)
  @JsonKey(name: "distance_calculating_type")
  String? distanceCalculatingType;
  @HiveField(14)
  @JsonKey(name: "retailer_product_view")
  String? retailerProductView;
  @HiveField(15)
  @JsonKey(name: "retailer_photo_required")
  bool? retailerPhotoRequired;
  @HiveField(16)
  @JsonKey(name: "end_visit_attachment")
  String? endVisitAttachment;
  @HiveField(17)
  @JsonKey(name: "on_back_end_visit_required")
  bool? onBackEndVisitRequired;
  @HiveField(18)
  @JsonKey(name: "hide_distributor_selection")
  bool? hideDistributorSelection;
  @HiveField(19)
  @JsonKey(name: "only_auto_approved_attendance")
  bool? onlyAutoApprovedAttendance;
  @HiveField(20)
  @JsonKey(name: "take_end_visit_reason")
  bool? takeEndVisitReason;
  @HiveField(21)
  @JsonKey(name: "manage_order_stock")
  bool? manageOrderStock;
  @HiveField(22)
  @JsonKey(name: "is_finance_year")
  bool? isFinanceYear;
  @HiveField(23)
  @JsonKey(name: "app_update_dailog_type")
  String? appUpdateDailogType;
  @HiveField(24)
  @JsonKey(name: "multiple_company_login")
  bool? multipleCompanyLogin;
  @HiveField(25)
  @JsonKey(name: "order_without_punch_in")
  bool? orderWithoutPunchIn;
  @HiveField(26)
  @JsonKey(name: "location_log_every_minute")
  String? locationLogEveryMinute;
  @HiveField(27)
  @JsonKey(name: "share_order_access")
  bool? shareOrderAccess;
  @HiveField(28)
  @JsonKey(name: "cancel_order_after_confirm")
  bool? cancelOrderAfterConfirm;
  @HiveField(29)
  @JsonKey(name: "work_report_on")
  bool? workReportOn;
  @HiveField(30)
  @JsonKey(name: "take_product_price_from_user")
  bool? takeProductPriceFromUser;
  @HiveField(31)
  @JsonKey(name: "attendance_type")
  String? attendanceType;
  @HiveField(32)
  @JsonKey(name: "take_attendance_selfie")
  String? takeAttendanceSelfie;
  @HiveField(33)
  @JsonKey(name: "hide_timeline")
  bool? hideTimeline;
  @HiveField(34)
  @JsonKey(name: "hide_chat")
  bool? hideChat;
  @HiveField(35)
  @JsonKey(name: "hide_myactivity")
  bool? hideMyactivity;
  @HiveField(36)
  @JsonKey(name: "VPNCheck")
  bool? vpnCheck;
  @HiveField(37)
  @JsonKey(name: "socieaty_logo")
  String? socieatyLogo;
  @HiveField(38)
  @JsonKey(name: "download_url_tracking_app")
  String? downloadUrlTrackingApp;
  @HiveField(39)
  @JsonKey(name: "tracking_app_version_android")
  String? trackingAppVersionAndroid;
  @HiveField(40)
  @JsonKey(name: "hide_attendance_face_menu")
  bool? hideAttendanceFaceMenu;
  @HiveField(41)
  @JsonKey(name: "hide_birthday_view")
  bool? hideBirthdayView;
  @HiveField(42)
  @JsonKey(name: "hide_department_employee_view")
  bool? hideDepartmentEmployeeView;
  @HiveField(43)
  @JsonKey(name: "hide_gallery_view")
  bool? hideGalleryView;
  @HiveField(44)
  @JsonKey(name: "attendance_with_matching_face")
  bool? attendanceWithMatchingFace;
  @HiveField(45)
  @JsonKey(name: "attendance_with_matching_face_ios")
  bool? attendanceWithMatchingFaceIos;
  @HiveField(46)
  @JsonKey(name: "by_pass_route_list")
  bool? byPassRouteList;
  @HiveField(47)
  @JsonKey(name: "odometer_tracking")
  bool? odometerTracking;
  @HiveField(48)
  @JsonKey(name: "hide_expense_title")
  bool? hideExpenseTitle;
  @HiveField(49)
  @JsonKey(name: "is_amazon_face_match")
  bool? isAmazonFaceMatch;
  @HiveField(50)
  @JsonKey(name: "start_end_visit_with_face_match")
  bool? startEndVisitWithFaceMatch;
  @HiveField(51)
  @JsonKey(name: "view_salary_days_month_attendance")
  bool? viewSalaryDaysMonthAttendance;
  @HiveField(52)
  @JsonKey(name: "restrict_downloading")
  bool? restrictDownloading;
  @HiveField(53)
  @JsonKey(name: "restrict_screenshot")
  bool? restrictScreenshot;
  @HiveField(54)
  @JsonKey(name: "visit_add_expense_button_visibility")
  bool? visitAddExpenseButtonVisibility;
  @HiveField(55)
  @JsonKey(name: "dob_onboarding_required")
  bool? dobOnboardingRequired;
  @HiveField(56)
  @JsonKey(name: "resignation_date_required_mark_ex_employee")
  bool? resignationDateRequiredMarkExEmployee;
  @HiveField(57)
  @JsonKey(name: "auto_visit_start_end_default_time")
  String? autoVisitStartEndDefaultTime;
  @HiveField(58)
  @JsonKey(name: "employee_id_generate")
  bool? employeeIdGenerate;
  @HiveField(59)
  @JsonKey(name: "employee_id_required")
  bool? employeeIdRequired;
  @HiveField(60)
  @JsonKey(name: "employee_multiple_retailer_binding")
  String? employeeMultipleRetailerBinding;
  @HiveField(61)
  @JsonKey(name: "reminder")
  List<dynamic>? reminder;
  @HiveField(62)
  @JsonKey(name: "logoutIosDevice")
  bool? logoutIosDevice;
  @HiveField(63)
  @JsonKey(name: "user_id")
  String? userId;
  @HiveField(64)
  @JsonKey(name: "allow_to_pre_apply_short_leave")
  bool? allowToPreApplyShortLeave;
  @HiveField(65)
  @JsonKey(name: "link_punch_in_with_visit_start")
  bool? linkPunchInWithVisitStart;
  @HiveField(66)
  @JsonKey(name: "visit_auto_start_end_in_range")
  bool? visitAutoStartEndInRange;
  @HiveField(67)
  @JsonKey(name: "task_assign_to_other_employee_access")
  bool? taskAssignToOtherEmployeeAccess;
  @HiveField(68)
  @JsonKey(name: "shift_data")
  List<dynamic>? shiftData;
  @HiveField(69)
  @JsonKey(name: "is_expense_on")
  bool? isExpenseOn;
  @HiveField(70)
  @JsonKey(name: "changeFace")
  bool? changeFace;
  @HiveField(71)
  @JsonKey(name: "take_accessibility_permission")
  bool? takeAccessibilityPermission;
  @HiveField(72)
  @JsonKey(name: "society_id")
  String? societyId;
  @HiveField(73)
  @JsonKey(name: "state_id_employee")
  String? stateIdEmployee;
  @HiveField(74)
  @JsonKey(name: "take_attendance_from")
  String? takeAttendanceFrom;
  @HiveField(75)
  @JsonKey(name: "company_employee_id")
  String? companyEmployeeId;
  @HiveField(76)
  @JsonKey(name: "shift_time_id")
  String? shiftTimeId;
  @HiveField(77)
  @JsonKey(name: "user_employment_type")
  String? userEmploymentType;
  @HiveField(78)
  @JsonKey(name: "user_full_name")
  String? userFullName;
  @HiveField(79)
  @JsonKey(name: "user_first_name")
  String? userFirstName;
  @HiveField(80)
  @JsonKey(name: "user_last_name")
  String? userLastName;
  @HiveField(81)
  @JsonKey(name: "active_status")
  String? activeStatus;
  @HiveField(82)
  @JsonKey(name: "expense_grade_id")
  String? expenseGradeId;
  @HiveField(83)
  @JsonKey(name: "user_mobile")
  String? userMobile;
  @HiveField(84)
  @JsonKey(name: "country_code")
  String? countryCode;
  @HiveField(85)
  @JsonKey(name: "user_email")
  String? userEmail;
  @HiveField(86)
  @JsonKey(name: "user_id_proof")
  dynamic userIdProof;
  @HiveField(87)
  @JsonKey(name: "current_address_lat")
  String? currentAddressLat;
  @HiveField(88)
  @JsonKey(name: "current_address_long")
  String? currentAddressLong;
  @HiveField(89)
  @JsonKey(name: "permanent_address_lat")
  String? permanentAddressLat;
  @HiveField(90)
  @JsonKey(name: "permanent_address_long")
  String? permanentAddressLong;
  @HiveField(91)
  @JsonKey(name: "last_address")
  String? lastAddress;
  @HiveField(92)
  @JsonKey(name: "permanent_address")
  String? permanentAddress;
  @HiveField(93)
  @JsonKey(name: "faculty_username")
  String? facultyUsername;
  @HiveField(94)
  @JsonKey(name: "faculty_password")
  String? facultyPassword;
  @HiveField(95)
  @JsonKey(name: "faculty_token")
  String? facultyToken;
  @HiveField(96)
  @JsonKey(name: "faculty_token_data")
  String? facultyTokenData;
  @HiveField(97)
  @JsonKey(name: "is_admin_access")
  String? isAdminAccess;
  @HiveField(98)
  @JsonKey(name: "job_location_names")
  String? jobLocationNames;
  @HiveField(99)
  @JsonKey(name: "member_access_denied")
  bool? memberAccessDenied;
  @HiveField(100)
  @JsonKey(name: "expense_grade_assigned")
  bool? expenseGradeAssigned;
  @HiveField(101)
  @JsonKey(name: "chat_access_denied")
  bool? chatAccessDenied;
  @HiveField(102)
  @JsonKey(name: "timline_access_denied")
  bool? timlineAccessDenied;
  @HiveField(103)
  @JsonKey(name: "user_visiting_card")
  String? userVisitingCard;
  @HiveField(104)
  @JsonKey(name: "user_visiting_card_back")
  String? userVisitingCardBack;
  @HiveField(105)
  @JsonKey(name: "short_name")
  String? shortName;
  @HiveField(106)
  @JsonKey(name: "block_id")
  String? blockId;
  @HiveField(107)
  @JsonKey(name: "block_name")
  String? blockName;
  @HiveField(108)
  @JsonKey(name: "floor_name")
  String? floorName;
  @HiveField(109)
  @JsonKey(name: "base_url")
  String? baseUrl;
  @HiveField(110)
  @JsonKey(name: "floor_id")
  String? floorId;
  @HiveField(111)
  @JsonKey(name: "unit_id")
  String? unitId;
  @HiveField(112)
  @JsonKey(name: "zone_id")
  String? zoneId;
  @HiveField(113)
  @JsonKey(name: "branch_type")
  String? branchType;
  @HiveField(114)
  @JsonKey(name: "level_id")
  String? levelId;
  @HiveField(115)
  @JsonKey(name: "work_allocation_add_access")
  bool? workAllocationAddAccess;
  @HiveField(116)
  @JsonKey(name: "unit_status")
  String? unitStatus;
  @HiveField(117)
  @JsonKey(name: "user_status")
  String? userStatus;
  @HiveField(118)
  @JsonKey(name: "member_status")
  String? memberStatus;
  @HiveField(119)
  @JsonKey(name: "public_mobile")
  String? publicMobile;
  @HiveField(120)
  @JsonKey(name: "visitor_approved")
  String? visitorApproved;
  @HiveField(121)
  @JsonKey(name: "member_date_of_birth")
  DateTime? memberDateOfBirth;
  @HiveField(122)
  @JsonKey(name: "wedding_anniversary_date")
  String? weddingAnniversaryDate;
  @HiveField(123)
  @JsonKey(name: "facebook")
  String? facebook;
  @HiveField(124)
  @JsonKey(name: "instagram")
  String? instagram;
  @HiveField(125)
  @JsonKey(name: "linkedin")
  String? linkedin;
  @HiveField(126)
  @JsonKey(name: "user_geofence_latitude")
  String? userGeofenceLatitude;
  @HiveField(127)
  @JsonKey(name: "user_geofence_longitude")
  String? userGeofenceLongitude;
  @HiveField(128)
  @JsonKey(name: "user_geofence_range")
  String? userGeofenceRange;
  @HiveField(129)
  @JsonKey(name: "track_user_time")
  String? trackUserTime;
  @HiveField(130)
  @JsonKey(name: "geo_fence_in_out_notification")
  String? geoFenceInOutNotification;
  @HiveField(131)
  @JsonKey(name: "user_location_list")
  List<dynamic>? userLocationList;
  @HiveField(132)
  @JsonKey(name: "block_geofence_latitude")
  String? blockGeofenceLatitude;
  @HiveField(133)
  @JsonKey(name: "block_geofence_longitude")
  String? blockGeofenceLongitude;
  @HiveField(134)
  @JsonKey(name: "block_geofence_range")
  String? blockGeofenceRange;
  @HiveField(135)
  @JsonKey(name: "allow_wfh")
  bool? allowWfh;
  @HiveField(136)
  @JsonKey(name: "track_user_location")
  bool? trackUserLocation;
  @HiveField(137)
  @JsonKey(name: "add_assets_access")
  bool? addAssetsAccess;
  @HiveField(138)
  @JsonKey(name: "parcel_security_check")
  String? parcelSecurityCheck;
  @HiveField(139)
  @JsonKey(name: "view_other_assets")
  String? viewOtherAssets;
  @HiveField(140)
  @JsonKey(name: "add_visit_for_other")
  bool? addVisitForOther;
  @HiveField(141)
  @JsonKey(name: "designation")
  String? designation;
  @HiveField(142)
  @JsonKey(name: "account_deactive")
  bool? accountDeactive;
  @HiveField(143)
  @JsonKey(name: "blood_group")
  String? bloodGroup;
  @HiveField(144)
  @JsonKey(name: "alt_mobile")
  String? altMobile;
  @HiveField(145)
  @JsonKey(name: "country_code_alt")
  String? countryCodeAlt;
  @HiveField(146)
  @JsonKey(name: "user_profile_pic")
  String? userProfilePic;
  @HiveField(147)
  @JsonKey(name: "gender")
  String? gender;
  @HiveField(148)
  @JsonKey(name: "sister_company_id")
  String? sisterCompanyId;
  @HiveField(149)
  @JsonKey(name: "company_name")
  String? companyName;
  @HiveField(150)
  @JsonKey(name: "company_address")
  String? companyAddress;
  @HiveField(151)
  @JsonKey(name: "plot_lattitude")
  String? plotLattitude;
  @HiveField(152)
  @JsonKey(name: "plot_longitude")
  String? plotLongitude;
  @HiveField(153)
  @JsonKey(name: "company_logo")
  String? companyLogo;
  @HiveField(154)
  @JsonKey(name: "society_address")
  String? societyAddress;
  @HiveField(155)
  @JsonKey(name: "society_latitude")
  String? societyLatitude;
  @HiveField(156)
  @JsonKey(name: "society_longitude")
  String? societyLongitude;
  @HiveField(157)
  @JsonKey(name: "society_name")
  String? societyName;
  @HiveField(158)
  @JsonKey(name: "country_id")
  String? countryId;
  @HiveField(159)
  @JsonKey(name: "state_id")
  String? stateId;
  @HiveField(160)
  @JsonKey(name: "city_id")
  String? cityId;
  @HiveField(161)
  @JsonKey(name: "city_name")
  String? cityName;
  @HiveField(162)
  @JsonKey(name: "currency")
  String? currency;
  @HiveField(163)
  @JsonKey(name: "api_key")
  String? apiKey;
  @HiveField(164)
  @JsonKey(name: "is_society")
  bool? isSociety;
  @HiveField(165)
  @JsonKey(name: "profile_progress")
  String? profileProgress;
  @HiveField(166)
  @JsonKey(name: "read_status")
  String? readStatus;
  @HiveField(167)
  @JsonKey(name: "chat_status")
  String? chatStatus;
  @HiveField(168)
  @JsonKey(name: "visitor_on_off")
  String? visitorOnOff;
  @HiveField(169)
  @JsonKey(name: "entry_all_visitor_group")
  String? entryAllVisitorGroup;
  @HiveField(170)
  @JsonKey(name: "group_chat_status")
  String? groupChatStatus;
  @HiveField(171)
  @JsonKey(name: "screen_sort_capture_in_timeline")
  String? screenSortCaptureInTimeline;
  @HiveField(172)
  @JsonKey(name: "create_group")
  String? createGroup;
  @HiveField(173)
  @JsonKey(name: "member")
  List<Member>? member;
  @HiveField(174)
  @JsonKey(name: "total_employee_department")
  String? totalEmployeeDepartment;
  @HiveField(175)
  @JsonKey(name: "my_team")
  List<MyTeam>? myTeam;
  @HiveField(176)
  @JsonKey(name: "event_album")
  List<EventAlbum>? eventAlbum;
  @HiveField(177)
  @JsonKey(name: "unit_name")
  String? unitName;
  @HiveField(178)
  @JsonKey(name: "message")
  String? message;
  @HiveField(179)
  @JsonKey(name: "status")
  String? status;

  MyUnitResponse({
    this.androidLocationTrackingLoopType,
    this.upcomingEvents,
    this.outOfRangePunchInRestrictionMsg,
    this.outOfRangePunchOutRestrictionMsg,
    this.todayBirthDays,
    this.managerLevelVisits,
    this.expireMsg,
    this.isPlanExpired,
    this.wfhApplyType,
    this.restrictUserProfile,
    this.allowZeroProductPriceOrder,
    this.customerVisibility,
    this.calculateVisitDistance,
    this.distanceCalculatingType,
    this.retailerProductView,
    this.retailerPhotoRequired,
    this.endVisitAttachment,
    this.onBackEndVisitRequired,
    this.hideDistributorSelection,
    this.onlyAutoApprovedAttendance,
    this.takeEndVisitReason,
    this.manageOrderStock,
    this.isFinanceYear,
    this.appUpdateDailogType,
    this.multipleCompanyLogin,
    this.orderWithoutPunchIn,
    this.locationLogEveryMinute,
    this.shareOrderAccess,
    this.cancelOrderAfterConfirm,
    this.workReportOn,
    this.takeProductPriceFromUser,
    this.attendanceType,
    this.takeAttendanceSelfie,
    this.hideTimeline,
    this.hideChat,
    this.hideMyactivity,
    this.vpnCheck,
    this.socieatyLogo,
    this.downloadUrlTrackingApp,
    this.trackingAppVersionAndroid,
    this.hideAttendanceFaceMenu,
    this.hideBirthdayView,
    this.hideDepartmentEmployeeView,
    this.hideGalleryView,
    this.attendanceWithMatchingFace,
    this.attendanceWithMatchingFaceIos,
    this.byPassRouteList,
    this.odometerTracking,
    this.hideExpenseTitle,
    this.isAmazonFaceMatch,
    this.startEndVisitWithFaceMatch,
    this.viewSalaryDaysMonthAttendance,
    this.restrictDownloading,
    this.restrictScreenshot,
    this.visitAddExpenseButtonVisibility,
    this.dobOnboardingRequired,
    this.resignationDateRequiredMarkExEmployee,
    this.autoVisitStartEndDefaultTime,
    this.employeeIdGenerate,
    this.employeeIdRequired,
    this.employeeMultipleRetailerBinding,
    this.reminder,
    this.logoutIosDevice,
    this.userId,
    this.allowToPreApplyShortLeave,
    this.linkPunchInWithVisitStart,
    this.visitAutoStartEndInRange,
    this.taskAssignToOtherEmployeeAccess,
    this.shiftData,
    this.isExpenseOn,
    this.changeFace,
    this.takeAccessibilityPermission,
    this.societyId,
    this.stateIdEmployee,
    this.takeAttendanceFrom,
    this.companyEmployeeId,
    this.shiftTimeId,
    this.userEmploymentType,
    this.userFullName,
    this.userFirstName,
    this.userLastName,
    this.activeStatus,
    this.expenseGradeId,
    this.userMobile,
    this.countryCode,
    this.userEmail,
    this.userIdProof,
    this.currentAddressLat,
    this.currentAddressLong,
    this.permanentAddressLat,
    this.permanentAddressLong,
    this.lastAddress,
    this.permanentAddress,
    this.facultyUsername,
    this.facultyPassword,
    this.facultyToken,
    this.facultyTokenData,
    this.isAdminAccess,
    this.jobLocationNames,
    this.memberAccessDenied,
    this.expenseGradeAssigned,
    this.chatAccessDenied,
    this.timlineAccessDenied,
    this.userVisitingCard,
    this.userVisitingCardBack,
    this.shortName,
    this.blockId,
    this.blockName,
    this.floorName,
    this.baseUrl,
    this.floorId,
    this.unitId,
    this.zoneId,
    this.branchType,
    this.levelId,
    this.workAllocationAddAccess,
    this.unitStatus,
    this.userStatus,
    this.memberStatus,
    this.publicMobile,
    this.visitorApproved,
    this.memberDateOfBirth,
    this.weddingAnniversaryDate,
    this.facebook,
    this.instagram,
    this.linkedin,
    this.userGeofenceLatitude,
    this.userGeofenceLongitude,
    this.userGeofenceRange,
    this.trackUserTime,
    this.geoFenceInOutNotification,
    this.userLocationList,
    this.blockGeofenceLatitude,
    this.blockGeofenceLongitude,
    this.blockGeofenceRange,
    this.allowWfh,
    this.trackUserLocation,
    this.addAssetsAccess,
    this.parcelSecurityCheck,
    this.viewOtherAssets,
    this.addVisitForOther,
    this.designation,
    this.accountDeactive,
    this.bloodGroup,
    this.altMobile,
    this.countryCodeAlt,
    this.userProfilePic,
    this.gender,
    this.sisterCompanyId,
    this.companyName,
    this.companyAddress,
    this.plotLattitude,
    this.plotLongitude,
    this.companyLogo,
    this.societyAddress,
    this.societyLatitude,
    this.societyLongitude,
    this.societyName,
    this.countryId,
    this.stateId,
    this.cityId,
    this.cityName,
    this.currency,
    this.apiKey,
    this.isSociety,
    this.profileProgress,
    this.readStatus,
    this.chatStatus,
    this.visitorOnOff,
    this.entryAllVisitorGroup,
    this.groupChatStatus,
    this.screenSortCaptureInTimeline,
    this.createGroup,
    this.member,
    this.totalEmployeeDepartment,
    this.myTeam,
    this.eventAlbum,
    this.unitName,
    this.message,
    this.status,
  });

  factory MyUnitResponse.fromJson(Map<String, dynamic> json) =>
      _$MyUnitResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MyUnitResponseToJson(this);

  MyUnitResponseEntity toEntity() => MyUnitResponseEntity(
    androidLocationTrackingLoopType: androidLocationTrackingLoopType,
    upcomingEvents: upcomingEvents,
    outOfRangePunchInRestrictionMsg: outOfRangePunchInRestrictionMsg,
    outOfRangePunchOutRestrictionMsg: outOfRangePunchOutRestrictionMsg,
    todayBirthDays: todayBirthDays?.map((e) => e.toEntity()).toList() ?? [],
    managerLevelVisits: managerLevelVisits,
    expireMsg: expireMsg,
    isPlanExpired: isPlanExpired,
    wfhApplyType: wfhApplyType,
    restrictUserProfile: restrictUserProfile,
    allowZeroProductPriceOrder: allowZeroProductPriceOrder,
    customerVisibility: customerVisibility,
    calculateVisitDistance: calculateVisitDistance,
    distanceCalculatingType: distanceCalculatingType,
    retailerProductView: retailerProductView,
    retailerPhotoRequired: retailerPhotoRequired,
    endVisitAttachment: endVisitAttachment,
    onBackEndVisitRequired: onBackEndVisitRequired,
    hideDistributorSelection: hideDistributorSelection,
    onlyAutoApprovedAttendance: onlyAutoApprovedAttendance,
    takeEndVisitReason: takeEndVisitReason,
    manageOrderStock: manageOrderStock,
    isFinanceYear: isFinanceYear,
    appUpdateDailogType: appUpdateDailogType,
    multipleCompanyLogin: multipleCompanyLogin,
    orderWithoutPunchIn: orderWithoutPunchIn,
    locationLogEveryMinute: locationLogEveryMinute,
    shareOrderAccess: shareOrderAccess,
    cancelOrderAfterConfirm: cancelOrderAfterConfirm,
    workReportOn: workReportOn,
    takeProductPriceFromUser: takeProductPriceFromUser,
    attendanceType: attendanceType,
    takeAttendanceSelfie: takeAttendanceSelfie,
    hideTimeline: hideTimeline,
    hideChat: hideChat,
    hideMyactivity: hideMyactivity,
    vpnCheck: vpnCheck,
    socieatyLogo: socieatyLogo,
    downloadUrlTrackingApp: downloadUrlTrackingApp,
    trackingAppVersionAndroid: trackingAppVersionAndroid,
    hideAttendanceFaceMenu: hideAttendanceFaceMenu,
    hideBirthdayView: hideBirthdayView,
    hideDepartmentEmployeeView: hideDepartmentEmployeeView,
    hideGalleryView: hideGalleryView,
    attendanceWithMatchingFace: attendanceWithMatchingFace,
    attendanceWithMatchingFaceIos: attendanceWithMatchingFaceIos,
    byPassRouteList: byPassRouteList,
    odometerTracking: odometerTracking,
    hideExpenseTitle: hideExpenseTitle,
    isAmazonFaceMatch: isAmazonFaceMatch,
    startEndVisitWithFaceMatch: startEndVisitWithFaceMatch,
    viewSalaryDaysMonthAttendance: viewSalaryDaysMonthAttendance,
    restrictDownloading: restrictDownloading,
    restrictScreenshot: restrictScreenshot,
    visitAddExpenseButtonVisibility: visitAddExpenseButtonVisibility,
    dobOnboardingRequired: dobOnboardingRequired,
    resignationDateRequiredMarkExEmployee:
        resignationDateRequiredMarkExEmployee,
    autoVisitStartEndDefaultTime: autoVisitStartEndDefaultTime,
    employeeIdGenerate: employeeIdGenerate,
    employeeIdRequired: employeeIdRequired,
    employeeMultipleRetailerBinding: employeeMultipleRetailerBinding,
    reminder: reminder,
    logoutIosDevice: logoutIosDevice,
    userId: userId,
    allowToPreApplyShortLeave: allowToPreApplyShortLeave,
    linkPunchInWithVisitStart: linkPunchInWithVisitStart,
    visitAutoStartEndInRange: visitAutoStartEndInRange,
    taskAssignToOtherEmployeeAccess: taskAssignToOtherEmployeeAccess,
    shiftData: shiftData,
    isExpenseOn: isExpenseOn,
    changeFace: changeFace,
    takeAccessibilityPermission: takeAccessibilityPermission,
    societyId: societyId,
    stateIdEmployee: stateIdEmployee,
    takeAttendanceFrom: takeAttendanceFrom,
    companyEmployeeId: companyEmployeeId,
    shiftTimeId: shiftTimeId,
    userEmploymentType: userEmploymentType,
    userFullName: userFullName,
    userFirstName: userFirstName,
    userLastName: userLastName,
    activeStatus: activeStatus,
    expenseGradeId: expenseGradeId,
    userMobile: userMobile,
    countryCode: countryCode,
    userEmail: userEmail,
    userIdProof: userIdProof,
    currentAddressLat: currentAddressLat,
    currentAddressLong: currentAddressLong,
    permanentAddressLat: permanentAddressLat,
    permanentAddressLong: permanentAddressLong,
    lastAddress: lastAddress,
    permanentAddress: permanentAddress,
    facultyUsername: facultyUsername,
    facultyPassword: facultyPassword,
    facultyToken: facultyToken,
    facultyTokenData: facultyTokenData,
    isAdminAccess: isAdminAccess,
    jobLocationNames: jobLocationNames,
    memberAccessDenied: memberAccessDenied,
    expenseGradeAssigned: expenseGradeAssigned,
    chatAccessDenied: chatAccessDenied,
    timlineAccessDenied: timlineAccessDenied,
    userVisitingCard: userVisitingCard,
    userVisitingCardBack: userVisitingCardBack,
    shortName: shortName,
    blockId: blockId,
    blockName: blockName,
    floorName: floorName,
    baseUrl: baseUrl,
    floorId: floorId,
    unitId: unitId,
    zoneId: zoneId,
    branchType: branchType,
    levelId: levelId,
    workAllocationAddAccess: workAllocationAddAccess,
    unitStatus: unitStatus,
    userStatus: userStatus,
    memberStatus: memberStatus,
    publicMobile: publicMobile,
    visitorApproved: visitorApproved,
    memberDateOfBirth: memberDateOfBirth,
    weddingAnniversaryDate: weddingAnniversaryDate,
    facebook: facebook,
    instagram: instagram,
    linkedin: linkedin,
    userGeofenceLatitude: userGeofenceLatitude,
    userGeofenceLongitude: userGeofenceLongitude,
    userGeofenceRange: userGeofenceRange,
    trackUserTime: trackUserTime,
    geoFenceInOutNotification: geoFenceInOutNotification,
    userLocationList: userLocationList,
    blockGeofenceLatitude: blockGeofenceLatitude,
    blockGeofenceLongitude: blockGeofenceLongitude,
    blockGeofenceRange: blockGeofenceRange,
    allowWfh: allowWfh,
    trackUserLocation: trackUserLocation,
    addAssetsAccess: addAssetsAccess,
    parcelSecurityCheck: parcelSecurityCheck,
    viewOtherAssets: viewOtherAssets,
    addVisitForOther: addVisitForOther,
    designation: designation,
    accountDeactive: accountDeactive,
    bloodGroup: bloodGroup,
    altMobile: altMobile,
    countryCodeAlt: countryCodeAlt,
    userProfilePic: userProfilePic,
    gender: gender,
    sisterCompanyId: sisterCompanyId,
    companyName: companyName,
    companyAddress: companyAddress,
    plotLattitude: plotLattitude,
    plotLongitude: plotLongitude,
    companyLogo: companyLogo,
    societyAddress: societyAddress,
    societyLatitude: societyLatitude,
    societyLongitude: societyLongitude,
    societyName: societyName,
    countryId: countryId,
    stateId: stateId,
    cityId: cityId,
    cityName: cityName,
    currency: currency,
    apiKey: apiKey,
    isSociety: isSociety,
    profileProgress: profileProgress,
    readStatus: readStatus,
    chatStatus: chatStatus,
    visitorOnOff: visitorOnOff,
    entryAllVisitorGroup: entryAllVisitorGroup,
    groupChatStatus: groupChatStatus,
    screenSortCaptureInTimeline: screenSortCaptureInTimeline,
    createGroup: createGroup,
    member: member?.map((e) => e.toEntity()).toList() ?? [],
    totalEmployeeDepartment: totalEmployeeDepartment,
    myTeam: myTeam?.map((e) => e.toEntity()).toList() ?? [],
    eventAlbum: eventAlbum?.map((e) => e.toEntity()).toList() ?? [],
    unitName: unitName,
    message: message,
    status: status,
  );
}

@HiveType(typeId: 6)
@JsonSerializable()
class EventAlbum {
  @HiveField(0)
  @JsonKey(name: "gallery_album_id")
  String? galleryAlbumId;
  @HiveField(1)
  @JsonKey(name: "album_title")
  String? albumTitle;
  @HiveField(2)
  @JsonKey(name: "event_id")
  String? eventId;
  @HiveField(3)
  @JsonKey(name: "event_date")
  DateTime? eventDate;
  @HiveField(4)
  @JsonKey(name: "block_id")
  String? blockId;
  @HiveField(5)
  @JsonKey(name: "floor_id")
  String? floorId;
  @HiveField(6)
  @JsonKey(name: "upload_date")
  String? uploadDate;
  @HiveField(7)
  @JsonKey(name: "image_one")
  String? imageOne;
  @HiveField(8)
  @JsonKey(name: "gallery_type")
  String? galleryType;

  EventAlbum({
    this.galleryAlbumId,
    this.albumTitle,
    this.eventId,
    this.eventDate,
    this.blockId,
    this.floorId,
    this.uploadDate,
    this.imageOne,
    this.galleryType,
  });

  factory EventAlbum.fromJson(Map<String, dynamic> json) =>
      _$EventAlbumFromJson(json);

  Map<String, dynamic> toJson() => _$EventAlbumToJson(this);
  EventAlbumEntity toEntity() => EventAlbumEntity(
    galleryAlbumId: galleryAlbumId,
    albumTitle: albumTitle,
    eventId: eventId,
    eventDate: eventDate,
    blockId: blockId,
    floorId: floorId,
    uploadDate: uploadDate,
    imageOne: imageOne,
    galleryType: galleryType,
  );
}

@HiveType(typeId: 7)
@JsonSerializable()
class Member {
  @HiveField(0)
  @JsonKey(name: "user_id")
  String? userId;
  @HiveField(1)
  @JsonKey(name: "user_full_name")
  String? userFullName;
  @HiveField(2)
  @JsonKey(name: "user_first_name")
  String? userFirstName;
  @HiveField(3)
  @JsonKey(name: "user_last_name")
  String? userLastName;
  @HiveField(4)
  @JsonKey(name: "user_designation")
  String? userDesignation;
  @HiveField(5)
  @JsonKey(name: "short_name")
  String? shortName;
  @HiveField(6)
  @JsonKey(name: "user_profile_pic")
  String? userProfilePic;

  Member({
    this.userId,
    this.userFullName,
    this.userFirstName,
    this.userLastName,
    this.userDesignation,
    this.shortName,
    this.userProfilePic,
  });

  factory Member.fromJson(Map<String, dynamic> json) => _$MemberFromJson(json);

  Map<String, dynamic> toJson() => _$MemberToJson(this);
  MyMemberEntity toEntity() => MyMemberEntity(
    userId: userId,
    userFullName: userFullName,
    userFirstName: userFirstName,
    userLastName: userLastName,
    userDesignation: userDesignation,
    shortName: shortName,
    userProfilePic: userProfilePic,
  );
}

@HiveType(typeId: 8)
@JsonSerializable()
class MyTeam {
  @HiveField(0)
  @JsonKey(name: "user_id")
  String? userId;
  @HiveField(1)
  @JsonKey(name: "level_id")
  String? levelId;
  @HiveField(2)
  @JsonKey(name: "level_name")
  String? levelName;
  @HiveField(3)
  @JsonKey(name: "user_full_name")
  String? userFullName;
  @HiveField(4)
  @JsonKey(name: "short_name")
  String? shortName;
  @HiveField(5)
  @JsonKey(name: "user_designation")
  String? userDesignation;
  @HiveField(6)
  @JsonKey(name: "user_profile_pic")
  String? userProfilePic;
  @HiveField(7)
  @JsonKey(name: "is_present")
  bool? isPresent;
  @HiveField(8)
  @JsonKey(name: "status_view")
  String? statusView;
  @HiveField(9)
  @JsonKey(name: "is_break")
  bool? isBreak;
  @HiveField(10)
  @JsonKey(name: "leave_data")
  List<dynamic>? leaveData;
  @HiveField(11)
  @JsonKey(name: "is_leave_full")
  bool? isLeaveFull;
  @HiveField(12)
  @JsonKey(name: "is_leave_half")
  bool? isLeaveHalf;

  MyTeam({
    this.userId,
    this.levelId,
    this.levelName,
    this.userFullName,
    this.shortName,
    this.userDesignation,
    this.userProfilePic,
    this.isPresent,
    this.statusView,
    this.isBreak,
    this.leaveData,
    this.isLeaveFull,
    this.isLeaveHalf,
  });

  factory MyTeam.fromJson(Map<String, dynamic> json) => _$MyTeamFromJson(json);

  Map<String, dynamic> toJson() => _$MyTeamToJson(this);

  MyTeamEntity toEntity() => MyTeamEntity(
    userId: userId,
    levelId: levelId,
    levelName: levelName,
    userFullName: userFullName,
    shortName: shortName,
    userDesignation: userDesignation,
    userProfilePic: userProfilePic,
    isPresent: isPresent,
    statusView: statusView,
    isBreak: isBreak,
    leaveData: leaveData,
    isLeaveFull: isLeaveFull,
    isLeaveHalf: isLeaveHalf,
  );
}

@HiveType(typeId: 9)
@JsonSerializable()
class TodayBirthDay {
  @HiveField(0)
  @JsonKey(name: "user_id")
  String? userId;
  @HiveField(1)
  @JsonKey(name: "user_full_name")
  String? userFullName;
  @HiveField(2)
  @JsonKey(name: "user_designation")
  String? userDesignation;
  @HiveField(3)
  @JsonKey(name: "block_name")
  String? blockName;
  @HiveField(4)
  @JsonKey(name: "floor_name")
  String? floorName;
  @HiveField(5)
  @JsonKey(name: "wish_id")
  String? wishId;
  @HiveField(6)
  @JsonKey(name: "wish_reply")
  String? wishReply;
  @HiveField(7)
  @JsonKey(name: "short_name")
  String? shortName;
  @HiveField(8)
  @JsonKey(name: "user_profile_pic")
  String? userProfilePic;
  @HiveField(9)
  @JsonKey(name: "member_date_of_birth")
  String? memberDateOfBirth;
  @HiveField(10)
  @JsonKey(name: "isBirthDay")
  bool? isBirthDay;
  @HiveField(11)
  @JsonKey(name: "isAnniversary")
  bool? isAnniversary;
  @HiveField(12)
  @JsonKey(name: "isWorkAnniversary")
  bool? isWorkAnniversary;
  @HiveField(13)
  @JsonKey(name: "total_year_view")
  String? totalYearView;
  @HiveField(14)
  @JsonKey(name: "is_today")
  bool? isToday;
  @HiveField(15)
  @JsonKey(name: "member_date_of_birth_view")
  String? memberDateOfBirthView;
  @HiveField(16)
  @JsonKey(name: "joining_date")
  String? joiningDate;

  TodayBirthDay({
    this.userId,
    this.userFullName,
    this.userDesignation,
    this.blockName,
    this.floorName,
    this.wishId,
    this.wishReply,
    this.shortName,
    this.userProfilePic,
    this.memberDateOfBirth,
    this.isBirthDay,
    this.isAnniversary,
    this.isWorkAnniversary,
    this.totalYearView,
    this.isToday,
    this.memberDateOfBirthView,
    this.joiningDate,
  });

  factory TodayBirthDay.fromJson(Map<String, dynamic> json) =>
      _$TodayBirthDayFromJson(json);

  Map<String, dynamic> toJson() => _$TodayBirthDayToJson(this);

  TodayBirthDayEntity toEntity() => TodayBirthDayEntity(
    userId: userId,
    userFullName: userFullName,
    userDesignation: userDesignation,
    blockName: blockName,
    floorName: floorName,
    wishId: wishId,
    wishReply: wishReply,
    shortName: shortName,
    userProfilePic: userProfilePic,
    memberDateOfBirth: memberDateOfBirth,
    isBirthDay: isBirthDay,
    isAnniversary: isAnniversary,
    isWorkAnniversary: isWorkAnniversary,
    totalYearView: totalYearView,
    isToday: isToday,
    memberDateOfBirthView: memberDateOfBirthView,
    joiningDate: joiningDate,
  );
}
