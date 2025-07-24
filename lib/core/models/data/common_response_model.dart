import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';
import 'package:myco_flutter/core/models/domain/common_response_entity.dart';

part 'common_response_model.g.dart';

// Helper function to decode JSON string
CommonResponseModel commonResponseModelFromJson(String str) =>
    CommonResponseModel.fromJson(json.decode(str));

// The main response model that mirrors the JSON structure
@JsonSerializable()
class CommonResponseModel {
  @JsonKey(name: 'out_range_reason')
  final List<OutOfRangeReasonListModel>? outOfRangeReason;
  @JsonKey(name: 'status')
  final String? status;
  @JsonKey(name: 'error')
  final String? error;
  @JsonKey(name: 'view_dialog_api_call')
  final bool? viewDialogApiCall;
  @JsonKey(name: 'view_dialog')
  final bool? viewDialog;
  @JsonKey(name: 'remining_document_count')
  final String? reminingDocumentCount;
  @JsonKey(name: 'message')
  final String? message;
  @JsonKey(name: 'view_message')
  final String? viewMessage;
  @JsonKey(name: 'work_report_on', defaultValue: false)
  final bool workReportOn;
  @JsonKey(name: 'reminder_id')
  final String? reminderId;
  @JsonKey(name: 'travel_mode_id')
  final String? travelModeId;
  @JsonKey(name: 'no_stock_product_variant_ids', defaultValue: "")
  final String noStockProductVariantIds;
  @JsonKey(name: 'start_time')
  final String? startTime;
  @JsonKey(name: 'leave_status')
  final String? leaveStatus;
  @JsonKey(name: 'leave_status_view')
  final String? leaveStatusView;
  @JsonKey(name: 'work_report_added', defaultValue: false)
  final bool workReportAdded;
  @JsonKey(name: 'total_work_report')
  final String? totalWorkReport;
  @JsonKey(name: 'punch_out_work_report_requirement')
  final String? punchOutWorkReportRequirement;
  @JsonKey(name: 'template')
  final List<Template>? template;
  @JsonKey(name: 'work_report_message')
  final String? workReportMessage;
  @JsonKey(name: 'remaining_work_report')
  final String? remainingWorkReport;
  @JsonKey(name: 'availableBalance')
  final String? availableBalance;
  @JsonKey(name: 'account_deactive', defaultValue: false)
  final bool accountDeactive;
  @JsonKey(name: 'otp_popup', defaultValue: false)
  final bool otpPopup;
  @JsonKey(name: 'is_email_otp', defaultValue: false)
  final bool isEmailOtp;
  @JsonKey(name: 'is_voice_otp', defaultValue: false)
  final bool isVoiceOtp;
  @JsonKey(name: 'late_in', defaultValue: false)
  final bool lateIn;
  @JsonKey(name: 'early_out', defaultValue: false)
  final bool earlyOut;
  @JsonKey(name: 'trx_id')
  final String? trxId;
  @JsonKey(name: 'task_important_id')
  final String? taskImportantId;
  @JsonKey(name: 'task_my_day_id')
  final String? taskMyDayId;
  @JsonKey(name: 'purchase_cart_id')
  final String? purchaseCartId;
  @JsonKey(name: 'cart_count')
  final String? cartCount;
  @JsonKey(name: 'user_id')
  final String? userId;
  @JsonKey(name: 'user_mobile')
  final String? userMobile;
  @JsonKey(name: 'is_firebase', defaultValue: false)
  final bool isFirebase;
  @JsonKey(name: 'allow_punch_in_after_work_report', defaultValue: false)
  final bool allowPunchInAfterWorkReport;
  @JsonKey(name: 'total_punch_in_work_report')
  final String? totalPunchInWorkReport;
  @JsonKey(name: 'view_punch_in_wr_view', defaultValue: false)
  final bool viewPunchInWrView;
  @JsonKey(name: 'total_report_added')
  final String? totalReportAdded;
  @JsonKey(name: 'remaining_punch_in_work_report')
  final String? remainingPunchInWorkReport;
  @JsonKey(name: 'work_report_id')
  final String? workReportId;
  @JsonKey(name: 'visit_id')
  final String? visitId;
  @JsonKey(name: 'user_visiting_card')
  final String? userVisitingCard;
  @JsonKey(name: 'user_visiting_card_back')
  final String? userVisitingCardBack;
  @JsonKey(name: 'face_image_two')
  final String? faceImageTwo;
  @JsonKey(name: 'face_image_one')
  final String? faceImageOne;
  @JsonKey(name: 'face_added_date')
  final String? faceAddedDate;
  @JsonKey(name: 'retailer_id')
  final String? retailerId;
  @JsonKey(name: 'retailer_code')
  final String? retailerCode;
  @JsonKey(name: 'added_count')
  final String? addedCount;
  @JsonKey(name: 'return_count')
  final String? returnCount;
  @JsonKey(name: 'verify_count')
  final String? verifyCount;
  @JsonKey(name: 'view_date')
  final String? viewDate;
  @JsonKey(name: 'task_id')
  final String? taskId;
  @JsonKey(name: 'is_approve', defaultValue: false)
  final bool isApprove;
  @JsonKey(name: 'short_name')
  final String? shortName;
  @JsonKey(name: 'user_profile_pic')
  final String? userProfilePic;
  @JsonKey(name: 'wfh_address_id')
  final String? wfhAddressId;
  @JsonKey(name: 'available_wfh_balance')
  final String? availableWfhBalance;

  const CommonResponseModel({
    this.outOfRangeReason,
    this.status,
    this.error,
    this.viewDialogApiCall,
    this.viewDialog,
    this.reminingDocumentCount,
    this.message,
    this.viewMessage,
    required this.workReportOn,
    this.reminderId,
    this.travelModeId,
    required this.noStockProductVariantIds,
    this.startTime,
    this.leaveStatus,
    this.leaveStatusView,
    required this.workReportAdded,
    this.totalWorkReport,
    this.punchOutWorkReportRequirement,
    this.template,
    this.workReportMessage,
    this.remainingWorkReport,
    this.availableBalance,
    required this.accountDeactive,
    required this.otpPopup,
    required this.isEmailOtp,
    required this.isVoiceOtp,
    required this.lateIn,
    required this.earlyOut,
    this.trxId,
    this.taskImportantId,
    this.taskMyDayId,
    this.purchaseCartId,
    this.cartCount,
    this.userId,
    this.userMobile,
    required this.isFirebase,
    required this.allowPunchInAfterWorkReport,
    this.totalPunchInWorkReport,
    required this.viewPunchInWrView,
    this.totalReportAdded,
    this.remainingPunchInWorkReport,
    this.workReportId,
    this.visitId,
    this.userVisitingCard,
    this.userVisitingCardBack,
    this.faceImageTwo,
    this.faceImageOne,
    this.faceAddedDate,
    this.retailerId,
    this.retailerCode,
    this.addedCount,
    this.returnCount,
    this.verifyCount,
    this.viewDate,
    this.taskId,
    required this.isApprove,
    this.shortName,
    this.userProfilePic,
    this.wfhAddressId,
    this.availableWfhBalance,
  });

  factory CommonResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CommonResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$CommonResponseModelToJson(this);

  /// Converts the data model to a domain entity.
  CommonResponseModelEntity toEntity() => CommonResponseModelEntity(
    outOfRangeReason: outOfRangeReason?.map((e) => e.toEntity()).toList(),
    status: status,
    error: error,
    viewDialogApiCall: viewDialogApiCall,
    viewDialog: viewDialog,
    reminingDocumentCount: reminingDocumentCount,
    message: message,
    viewMessage: viewMessage,
    workReportOn: workReportOn,
    reminderId: reminderId,
    travelModeId: travelModeId,
    noStockProductVariantIds: noStockProductVariantIds,
    startTime: startTime,
    leaveStatus: leaveStatus,
    leaveStatusView: leaveStatusView,
    workReportAdded: workReportAdded,
    totalWorkReport: totalWorkReport,
    punchOutWorkReportRequirement: punchOutWorkReportRequirement,
    template: template?.map((e) => e.toEntity()).toList(),
    workReportMessage: workReportMessage,
    remainingWorkReport: remainingWorkReport,
    availableBalance: availableBalance,
    accountDeactive: accountDeactive,
    otpPopup: otpPopup,
    isEmailOtp: isEmailOtp,
    isVoiceOtp: isVoiceOtp,
    lateIn: lateIn,
    earlyOut: earlyOut,
    trxId: trxId,
    taskImportantId: taskImportantId,
    taskMyDayId: taskMyDayId,
    purchaseCartId: purchaseCartId,
    cartCount: cartCount,
    userId: userId,
    userMobile: userMobile,
    isFirebase: isFirebase,
    allowPunchInAfterWorkReport: allowPunchInAfterWorkReport,
    totalPunchInWorkReport: totalPunchInWorkReport,
    viewPunchInWrView: viewPunchInWrView,
    totalReportAdded: totalReportAdded,
    remainingPunchInWorkReport: remainingPunchInWorkReport,
    workReportId: workReportId,
    visitId: visitId,
    userVisitingCard: userVisitingCard,
    userVisitingCardBack: userVisitingCardBack,
    faceImageTwo: faceImageTwo,
    faceImageOne: faceImageOne,
    faceAddedDate: faceAddedDate,
    retailerId: retailerId,
    retailerCode: retailerCode,
    addedCount: addedCount,
    returnCount: returnCount,
    verifyCount: verifyCount,
    viewDate: viewDate,
    taskId: taskId,
    isApprove: isApprove,
    shortName: shortName,
    userProfilePic: userProfilePic,
    wfhAddressId: wfhAddressId,
    availableWfhBalance: availableWfhBalance,
  );
}

@JsonSerializable()
class OutOfRangeReasonListModel {
  @JsonKey(name: 'reason_name')
  final String? reasonName;

  OutOfRangeReasonListModel({this.reasonName});

  factory OutOfRangeReasonListModel.fromJson(Map<String, dynamic> json) =>
      _$OutOfRangeReasonListModelFromJson(json);

  Map<String, dynamic> toJson() => _$OutOfRangeReasonListModelToJson(this);

  /// Converts the data model to a domain entity.
  OutOfRangeReasonListModelEntity toEntity() => OutOfRangeReasonListModelEntity(
    reasonName: reasonName,
  );
}

@JsonSerializable()
class Template {
  @JsonKey(name: 'reportAdded')
  final bool? reportAdded;
  @JsonKey(name: 'is_required')
  final bool? isRequired;
  @JsonKey(name: 'template_id')
  final String? templateId;
  @JsonKey(name: 'template_name')
  final String? templateName;

  Template({
    this.reportAdded,
    this.isRequired,
    this.templateId,
    this.templateName,
  });

  factory Template.fromJson(Map<String, dynamic> json) =>
      _$TemplateFromJson(json);

  Map<String, dynamic> toJson() => _$TemplateToJson(this);

  /// Converts the data model to a domain entity.
  TemplateEntity toEntity() => TemplateEntity(
    reportAdded: reportAdded,
    isRequired: isRequired,
    templateId: templateId,
    templateName: templateName,
  );
}