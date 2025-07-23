// To parse this JSON data, do
//
//     final myUnitResponse = myUnitResponseFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'my_unit_response.g.dart';

MyUnitResponse myUnitResponseFromJson(String str) => MyUnitResponse.fromJson(json.decode(str));

String myUnitResponseToJson(MyUnitResponse data) => json.encode(data.toJson());

@JsonSerializable()
class MyUnitResponse {
    @JsonKey(name: "android_location_tracking_loop_type")
    String? androidLocationTrackingLoopType;
    @JsonKey(name: "upcoming_events")
    bool? upcomingEvents;
    @JsonKey(name: "out_of_range_punch_in_restriction_msg")
    String? outOfRangePunchInRestrictionMsg;
    @JsonKey(name: "out_of_range_punch_out_restriction_msg")
    String? outOfRangePunchOutRestrictionMsg;
    @JsonKey(name: "today_birth_days")
    List<TodayBirthDay>? todayBirthDays;
    @JsonKey(name: "manager_level_visits")
    String? managerLevelVisits;
    @JsonKey(name: "expire_msg")
    String? expireMsg;
    @JsonKey(name: "is_plan_expired")
    bool? isPlanExpired;
    @JsonKey(name: "wfh_apply_type")
    String? wfhApplyType;
    @JsonKey(name: "restrict_user_profile")
    bool? restrictUserProfile;
    @JsonKey(name: "allow_zero_product_price_order")
    bool? allowZeroProductPriceOrder;
    @JsonKey(name: "customer_visibility")
    bool? customerVisibility;
    @JsonKey(name: "calculate_visit_distance")
    bool? calculateVisitDistance;
    @JsonKey(name: "distance_calculating_type")
    String? distanceCalculatingType;
    @JsonKey(name: "retailer_product_view")
    String? retailerProductView;
    @JsonKey(name: "retailer_photo_required")
    bool? retailerPhotoRequired;
    @JsonKey(name: "end_visit_attachment")
    String? endVisitAttachment;
    @JsonKey(name: "on_back_end_visit_required")
    bool? onBackEndVisitRequired;
    @JsonKey(name: "hide_distributor_selection")
    bool? hideDistributorSelection;
    @JsonKey(name: "only_auto_approved_attendance")
    bool? onlyAutoApprovedAttendance;
    @JsonKey(name: "take_end_visit_reason")
    bool? takeEndVisitReason;
    @JsonKey(name: "manage_order_stock")
    bool? manageOrderStock;
    @JsonKey(name: "is_finance_year")
    bool? isFinanceYear;
    @JsonKey(name: "app_update_dailog_type")
    String? appUpdateDailogType;
    @JsonKey(name: "multiple_company_login")
    bool? multipleCompanyLogin;
    @JsonKey(name: "order_without_punch_in")
    bool? orderWithoutPunchIn;
    @JsonKey(name: "location_log_every_minute")
    String? locationLogEveryMinute;
    @JsonKey(name: "share_order_access")
    bool? shareOrderAccess;
    @JsonKey(name: "cancel_order_after_confirm")
    bool? cancelOrderAfterConfirm;
    @JsonKey(name: "work_report_on")
    bool? workReportOn;
    @JsonKey(name: "take_product_price_from_user")
    bool? takeProductPriceFromUser;
    @JsonKey(name: "attendance_type")
    String? attendanceType;
    @JsonKey(name: "take_attendance_selfie")
    String? takeAttendanceSelfie;
    @JsonKey(name: "hide_timeline")
    bool? hideTimeline;
    @JsonKey(name: "hide_chat")
    bool? hideChat;
    @JsonKey(name: "hide_myactivity")
    bool? hideMyactivity;
    @JsonKey(name: "VPNCheck")
    bool? vpnCheck;
    @JsonKey(name: "socieaty_logo")
    String? socieatyLogo;
    @JsonKey(name: "download_url_tracking_app")
    String? downloadUrlTrackingApp;
    @JsonKey(name: "tracking_app_version_android")
    String? trackingAppVersionAndroid;
    @JsonKey(name: "hide_attendance_face_menu")
    bool? hideAttendanceFaceMenu;
    @JsonKey(name: "hide_birthday_view")
    bool? hideBirthdayView;
    @JsonKey(name: "hide_department_employee_view")
    bool? hideDepartmentEmployeeView;
    @JsonKey(name: "hide_gallery_view")
    bool? hideGalleryView;
    @JsonKey(name: "attendance_with_matching_face")
    bool? attendanceWithMatchingFace;
    @JsonKey(name: "attendance_with_matching_face_ios")
    bool? attendanceWithMatchingFaceIos;
    @JsonKey(name: "by_pass_route_list")
    bool? byPassRouteList;
    @JsonKey(name: "odometer_tracking")
    bool? odometerTracking;
    @JsonKey(name: "hide_expense_title")
    bool? hideExpenseTitle;
    @JsonKey(name: "is_amazon_face_match")
    bool? isAmazonFaceMatch;
    @JsonKey(name: "start_end_visit_with_face_match")
    bool? startEndVisitWithFaceMatch;
    @JsonKey(name: "view_salary_days_month_attendance")
    bool? viewSalaryDaysMonthAttendance;
    @JsonKey(name: "restrict_downloading")
    bool? restrictDownloading;
    @JsonKey(name: "restrict_screenshot")
    bool? restrictScreenshot;
    @JsonKey(name: "visit_add_expense_button_visibility")
    bool? visitAddExpenseButtonVisibility;
    @JsonKey(name: "dob_onboarding_required")
    bool? dobOnboardingRequired;
    @JsonKey(name: "resignation_date_required_mark_ex_employee")
    bool? resignationDateRequiredMarkExEmployee;
    @JsonKey(name: "auto_visit_start_end_default_time")
    String? autoVisitStartEndDefaultTime;
    @JsonKey(name: "employee_id_generate")
    bool? employeeIdGenerate;
    @JsonKey(name: "employee_id_required")
    bool? employeeIdRequired;
    @JsonKey(name: "employee_multiple_retailer_binding")
    String? employeeMultipleRetailerBinding;
    @JsonKey(name: "reminder")
    List<dynamic>? reminder;
    @JsonKey(name: "logoutIosDevice")
    bool? logoutIosDevice;
    @JsonKey(name: "user_id")
    String? userId;
    @JsonKey(name: "allow_to_pre_apply_short_leave")
    bool? allowToPreApplyShortLeave;
    @JsonKey(name: "link_punch_in_with_visit_start")
    bool? linkPunchInWithVisitStart;
    @JsonKey(name: "visit_auto_start_end_in_range")
    bool? visitAutoStartEndInRange;
    @JsonKey(name: "task_assign_to_other_employee_access")
    bool? taskAssignToOtherEmployeeAccess;
    @JsonKey(name: "shift_data")
    List<dynamic>? shiftData;
    @JsonKey(name: "is_expense_on")
    bool? isExpenseOn;
    @JsonKey(name: "changeFace")
    bool? changeFace;
    @JsonKey(name: "take_accessibility_permission")
    bool? takeAccessibilityPermission;
    @JsonKey(name: "society_id")
    String? societyId;
    @JsonKey(name: "state_id_employee")
    String? stateIdEmployee;
    @JsonKey(name: "take_attendance_from")
    String? takeAttendanceFrom;
    @JsonKey(name: "company_employee_id")
    String? companyEmployeeId;
    @JsonKey(name: "shift_time_id")
    String? shiftTimeId;
    @JsonKey(name: "user_employment_type")
    String? userEmploymentType;
    @JsonKey(name: "user_full_name")
    String? userFullName;
    @JsonKey(name: "user_first_name")
    String? userFirstName;
    @JsonKey(name: "user_last_name")
    String? userLastName;
    @JsonKey(name: "active_status")
    String? activeStatus;
    @JsonKey(name: "expense_grade_id")
    String? expenseGradeId;
    @JsonKey(name: "user_mobile")
    String? userMobile;
    @JsonKey(name: "country_code")
    String? countryCode;
    @JsonKey(name: "user_email")
    String? userEmail;
    @JsonKey(name: "user_id_proof")
    dynamic userIdProof;
    @JsonKey(name: "current_address_lat")
    String? currentAddressLat;
    @JsonKey(name: "current_address_long")
    String? currentAddressLong;
    @JsonKey(name: "permanent_address_lat")
    String? permanentAddressLat;
    @JsonKey(name: "permanent_address_long")
    String? permanentAddressLong;
    @JsonKey(name: "last_address")
    String? lastAddress;
    @JsonKey(name: "permanent_address")
    String? permanentAddress;
    @JsonKey(name: "faculty_username")
    String? facultyUsername;
    @JsonKey(name: "faculty_password")
    String? facultyPassword;
    @JsonKey(name: "faculty_token")
    String? facultyToken;
    @JsonKey(name: "faculty_token_data")
    String? facultyTokenData;
    @JsonKey(name: "is_admin_access")
    String? isAdminAccess;
    @JsonKey(name: "job_location_names")
    String? jobLocationNames;
    @JsonKey(name: "member_access_denied")
    bool? memberAccessDenied;
    @JsonKey(name: "expense_grade_assigned")
    bool? expenseGradeAssigned;
    @JsonKey(name: "chat_access_denied")
    bool? chatAccessDenied;
    @JsonKey(name: "timline_access_denied")
    bool? timlineAccessDenied;
    @JsonKey(name: "user_visiting_card")
    String? userVisitingCard;
    @JsonKey(name: "user_visiting_card_back")
    String? userVisitingCardBack;
    @JsonKey(name: "short_name")
    String? shortName;
    @JsonKey(name: "block_id")
    String? blockId;
    @JsonKey(name: "block_name")
    String? blockName;
    @JsonKey(name: "floor_name")
    String? floorName;
    @JsonKey(name: "base_url")
    String? baseUrl;
    @JsonKey(name: "floor_id")
    String? floorId;
    @JsonKey(name: "unit_id")
    String? unitId;
    @JsonKey(name: "zone_id")
    String? zoneId;
    @JsonKey(name: "branch_type")
    String? branchType;
    @JsonKey(name: "level_id")
    String? levelId;
    @JsonKey(name: "work_allocation_add_access")
    bool? workAllocationAddAccess;
    @JsonKey(name: "unit_status")
    String? unitStatus;
    @JsonKey(name: "user_status")
    String? userStatus;
    @JsonKey(name: "member_status")
    String? memberStatus;
    @JsonKey(name: "public_mobile")
    String? publicMobile;
    @JsonKey(name: "visitor_approved")
    String? visitorApproved;
    @JsonKey(name: "member_date_of_birth")
    DateTime? memberDateOfBirth;
    @JsonKey(name: "wedding_anniversary_date")
    String? weddingAnniversaryDate;
    @JsonKey(name: "facebook")
    String? facebook;
    @JsonKey(name: "instagram")
    String? instagram;
    @JsonKey(name: "linkedin")
    String? linkedin;
    @JsonKey(name: "user_geofence_latitude")
    String? userGeofenceLatitude;
    @JsonKey(name: "user_geofence_longitude")
    String? userGeofenceLongitude;
    @JsonKey(name: "user_geofence_range")
    String? userGeofenceRange;
    @JsonKey(name: "track_user_time")
    String? trackUserTime;
    @JsonKey(name: "geo_fence_in_out_notification")
    String? geoFenceInOutNotification;
    @JsonKey(name: "user_location_list")
    List<dynamic>? userLocationList;
    @JsonKey(name: "block_geofence_latitude")
    String? blockGeofenceLatitude;
    @JsonKey(name: "block_geofence_longitude")
    String? blockGeofenceLongitude;
    @JsonKey(name: "block_geofence_range")
    String? blockGeofenceRange;
    @JsonKey(name: "allow_wfh")
    bool? allowWfh;
    @JsonKey(name: "track_user_location")
    bool? trackUserLocation;
    @JsonKey(name: "add_assets_access")
    bool? addAssetsAccess;
    @JsonKey(name: "parcel_security_check")
    String? parcelSecurityCheck;
    @JsonKey(name: "view_other_assets")
    String? viewOtherAssets;
    @JsonKey(name: "add_visit_for_other")
    bool? addVisitForOther;
    @JsonKey(name: "designation")
    String? designation;
    @JsonKey(name: "account_deactive")
    bool? accountDeactive;
    @JsonKey(name: "blood_group")
    String? bloodGroup;
    @JsonKey(name: "alt_mobile")
    String? altMobile;
    @JsonKey(name: "country_code_alt")
    String? countryCodeAlt;
    @JsonKey(name: "user_profile_pic")
    String? userProfilePic;
    @JsonKey(name: "gender")
    String? gender;
    @JsonKey(name: "sister_company_id")
    String? sisterCompanyId;
    @JsonKey(name: "company_name")
    String? companyName;
    @JsonKey(name: "company_address")
    String? companyAddress;
    @JsonKey(name: "plot_lattitude")
    String? plotLattitude;
    @JsonKey(name: "plot_longitude")
    String? plotLongitude;
    @JsonKey(name: "company_logo")
    String? companyLogo;
    @JsonKey(name: "society_address")
    String? societyAddress;
    @JsonKey(name: "society_latitude")
    String? societyLatitude;
    @JsonKey(name: "society_longitude")
    String? societyLongitude;
    @JsonKey(name: "society_name")
    String? societyName;
    @JsonKey(name: "country_id")
    String? countryId;
    @JsonKey(name: "state_id")
    String? stateId;
    @JsonKey(name: "city_id")
    String? cityId;
    @JsonKey(name: "city_name")
    String? cityName;
    @JsonKey(name: "currency")
    String? currency;
    @JsonKey(name: "api_key")
    String? apiKey;
    @JsonKey(name: "is_society")
    bool? isSociety;
    @JsonKey(name: "profile_progress")
    String? profileProgress;
    @JsonKey(name: "read_status")
    String? readStatus;
    @JsonKey(name: "chat_status")
    String? chatStatus;
    @JsonKey(name: "visitor_on_off")
    String? visitorOnOff;
    @JsonKey(name: "entry_all_visitor_group")
    String? entryAllVisitorGroup;
    @JsonKey(name: "group_chat_status")
    String? groupChatStatus;
    @JsonKey(name: "screen_sort_capture_in_timeline")
    String? screenSortCaptureInTimeline;
    @JsonKey(name: "create_group")
    String? createGroup;
    @JsonKey(name: "member")
    List<Member>? member;
    @JsonKey(name: "total_employee_department")
    String? totalEmployeeDepartment;
    @JsonKey(name: "my_team")
    List<MyTeam>? myTeam;
    @JsonKey(name: "event_album")
    List<EventAlbum>? eventAlbum;
    @JsonKey(name: "unit_name")
    String? unitName;
    @JsonKey(name: "message")
    String? message;
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

    factory MyUnitResponse.fromJson(Map<String, dynamic> json) => _$MyUnitResponseFromJson(json);

    Map<String, dynamic> toJson() => _$MyUnitResponseToJson(this);
}

@JsonSerializable()
class EventAlbum {
    @JsonKey(name: "gallery_album_id")
    String? galleryAlbumId;
    @JsonKey(name: "album_title")
    String? albumTitle;
    @JsonKey(name: "event_id")
    String? eventId;
    @JsonKey(name: "event_date")
    DateTime? eventDate;
    @JsonKey(name: "block_id")
    String? blockId;
    @JsonKey(name: "floor_id")
    String? floorId;
    @JsonKey(name: "upload_date")
    String? uploadDate;
    @JsonKey(name: "image_one")
    String? imageOne;
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

    factory EventAlbum.fromJson(Map<String, dynamic> json) => _$EventAlbumFromJson(json);

    Map<String, dynamic> toJson() => _$EventAlbumToJson(this);
}

@JsonSerializable()
class Member {
    @JsonKey(name: "user_id")
    String? userId;
    @JsonKey(name: "user_full_name")
    String? userFullName;
    @JsonKey(name: "user_first_name")
    String? userFirstName;
    @JsonKey(name: "user_last_name")
    String? userLastName;
    @JsonKey(name: "user_designation")
    String? userDesignation;
    @JsonKey(name: "short_name")
    String? shortName;
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
}

@JsonSerializable()
class MyTeam {
    @JsonKey(name: "user_id")
    String? userId;
    @JsonKey(name: "level_id")
    String? levelId;
    @JsonKey(name: "level_name")
    String? levelName;
    @JsonKey(name: "user_full_name")
    String? userFullName;
    @JsonKey(name: "short_name")
    String? shortName;
    @JsonKey(name: "user_designation")
    String? userDesignation;
    @JsonKey(name: "user_profile_pic")
    String? userProfilePic;
    @JsonKey(name: "is_present")
    bool? isPresent;
    @JsonKey(name: "status_view")
    String? statusView;
    @JsonKey(name: "is_break")
    bool? isBreak;
    @JsonKey(name: "leave_data")
    List<dynamic>? leaveData;
    @JsonKey(name: "is_leave_full")
    bool? isLeaveFull;
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
}

@JsonSerializable()
class TodayBirthDay {
    @JsonKey(name: "user_id")
    String? userId;
    @JsonKey(name: "user_full_name")
    String? userFullName;
    @JsonKey(name: "user_designation")
    String? userDesignation;
    @JsonKey(name: "block_name")
    String? blockName;
    @JsonKey(name: "floor_name")
    String? floorName;
    @JsonKey(name: "wish_id")
    String? wishId;
    @JsonKey(name: "wish_reply")
    String? wishReply;
    @JsonKey(name: "short_name")
    String? shortName;
    @JsonKey(name: "user_profile_pic")
    String? userProfilePic;
    @JsonKey(name: "member_date_of_birth")
    String? memberDateOfBirth;
    @JsonKey(name: "isBirthDay")
    bool? isBirthDay;
    @JsonKey(name: "isAnniversary")
    bool? isAnniversary;
    @JsonKey(name: "isWorkAnniversary")
    bool? isWorkAnniversary;
    @JsonKey(name: "total_year_view")
    String? totalYearView;
    @JsonKey(name: "is_today")
    bool? isToday;
    @JsonKey(name: "member_date_of_birth_view")
    String? memberDateOfBirthView;
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

    factory TodayBirthDay.fromJson(Map<String, dynamic> json) => _$TodayBirthDayFromJson(json);

    Map<String, dynamic> toJson() => _$TodayBirthDayToJson(this);
}
