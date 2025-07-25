// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'common_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommonResponseModel _$CommonResponseModelFromJson(
  Map<String, dynamic> json,
) => CommonResponseModel(
  outOfRangeReason:
      (json['out_range_reason'] as List<dynamic>?)
          ?.map(
            (e) =>
                OutOfRangeReasonListModel.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
  status: json['status'] as String?,
  error: json['error'] as String?,
  viewDialogApiCall: json['view_dialog_api_call'] as bool?,
  viewDialog: json['view_dialog'] as bool?,
  reminingDocumentCount: json['remining_document_count'] as String?,
  message: json['message'] as String?,
  viewMessage: json['view_message'] as String?,
  workReportOn: json['work_report_on'] as bool? ?? false,
  reminderId: json['reminder_id'] as String?,
  travelModeId: json['travel_mode_id'] as String?,
  noStockProductVariantIds:
      json['no_stock_product_variant_ids'] as String? ?? '',
  startTime: json['start_time'] as String?,
  leaveStatus: json['leave_status'] as String?,
  leaveStatusView: json['leave_status_view'] as String?,
  workReportAdded: json['work_report_added'] as bool? ?? false,
  totalWorkReport: json['total_work_report'] as String?,
  punchOutWorkReportRequirement:
      json['punch_out_work_report_requirement'] as String?,
  template:
      (json['template'] as List<dynamic>?)
          ?.map((e) => Template.fromJson(e as Map<String, dynamic>))
          .toList(),
  workReportMessage: json['work_report_message'] as String?,
  remainingWorkReport: json['remaining_work_report'] as String?,
  availableBalance: json['availableBalance'] as String?,
  accountDeactive: json['account_deactive'] as bool? ?? false,
  otpPopup: json['otp_popup'] as bool? ?? false,
  isEmailOtp: json['is_email_otp'] as bool? ?? false,
  isVoiceOtp: json['is_voice_otp'] as bool? ?? false,
  lateIn: json['late_in'] as bool? ?? false,
  earlyOut: json['early_out'] as bool? ?? false,
  trxId: json['trx_id'] as String?,
  taskImportantId: json['task_important_id'] as String?,
  taskMyDayId: json['task_my_day_id'] as String?,
  purchaseCartId: json['purchase_cart_id'] as String?,
  cartCount: json['cart_count'] as String?,
  userId: json['user_id'] as String?,
  userMobile: json['user_mobile'] as String?,
  isFirebase: json['is_firebase'] as bool? ?? false,
  allowPunchInAfterWorkReport:
      json['allow_punch_in_after_work_report'] as bool? ?? false,
  totalPunchInWorkReport: json['total_punch_in_work_report'] as String?,
  viewPunchInWrView: json['view_punch_in_wr_view'] as bool? ?? false,
  totalReportAdded: json['total_report_added'] as String?,
  remainingPunchInWorkReport: json['remaining_punch_in_work_report'] as String?,
  workReportId: json['work_report_id'] as String?,
  visitId: json['visit_id'] as String?,
  userVisitingCard: json['user_visiting_card'] as String?,
  userVisitingCardBack: json['user_visiting_card_back'] as String?,
  faceImageTwo: json['face_image_two'] as String?,
  faceImageOne: json['face_image_one'] as String?,
  faceAddedDate: json['face_added_date'] as String?,
  retailerId: json['retailer_id'] as String?,
  retailerCode: json['retailer_code'] as String?,
  addedCount: json['added_count'] as String?,
  returnCount: json['return_count'] as String?,
  verifyCount: json['verify_count'] as String?,
  viewDate: json['view_date'] as String?,
  taskId: json['task_id'] as String?,
  isApprove: json['is_approve'] as bool? ?? false,
  shortName: json['short_name'] as String?,
  userProfilePic: json['user_profile_pic'] as String?,
  wfhAddressId: json['wfh_address_id'] as String?,
  availableWfhBalance: json['available_wfh_balance'] as String?,
);

Map<String, dynamic> _$CommonResponseModelToJson(
  CommonResponseModel instance,
) => <String, dynamic>{
  'out_range_reason': instance.outOfRangeReason,
  'status': instance.status,
  'error': instance.error,
  'view_dialog_api_call': instance.viewDialogApiCall,
  'view_dialog': instance.viewDialog,
  'remining_document_count': instance.reminingDocumentCount,
  'message': instance.message,
  'view_message': instance.viewMessage,
  'work_report_on': instance.workReportOn,
  'reminder_id': instance.reminderId,
  'travel_mode_id': instance.travelModeId,
  'no_stock_product_variant_ids': instance.noStockProductVariantIds,
  'start_time': instance.startTime,
  'leave_status': instance.leaveStatus,
  'leave_status_view': instance.leaveStatusView,
  'work_report_added': instance.workReportAdded,
  'total_work_report': instance.totalWorkReport,
  'punch_out_work_report_requirement': instance.punchOutWorkReportRequirement,
  'template': instance.template,
  'work_report_message': instance.workReportMessage,
  'remaining_work_report': instance.remainingWorkReport,
  'availableBalance': instance.availableBalance,
  'account_deactive': instance.accountDeactive,
  'otp_popup': instance.otpPopup,
  'is_email_otp': instance.isEmailOtp,
  'is_voice_otp': instance.isVoiceOtp,
  'late_in': instance.lateIn,
  'early_out': instance.earlyOut,
  'trx_id': instance.trxId,
  'task_important_id': instance.taskImportantId,
  'task_my_day_id': instance.taskMyDayId,
  'purchase_cart_id': instance.purchaseCartId,
  'cart_count': instance.cartCount,
  'user_id': instance.userId,
  'user_mobile': instance.userMobile,
  'is_firebase': instance.isFirebase,
  'allow_punch_in_after_work_report': instance.allowPunchInAfterWorkReport,
  'total_punch_in_work_report': instance.totalPunchInWorkReport,
  'view_punch_in_wr_view': instance.viewPunchInWrView,
  'total_report_added': instance.totalReportAdded,
  'remaining_punch_in_work_report': instance.remainingPunchInWorkReport,
  'work_report_id': instance.workReportId,
  'visit_id': instance.visitId,
  'user_visiting_card': instance.userVisitingCard,
  'user_visiting_card_back': instance.userVisitingCardBack,
  'face_image_two': instance.faceImageTwo,
  'face_image_one': instance.faceImageOne,
  'face_added_date': instance.faceAddedDate,
  'retailer_id': instance.retailerId,
  'retailer_code': instance.retailerCode,
  'added_count': instance.addedCount,
  'return_count': instance.returnCount,
  'verify_count': instance.verifyCount,
  'view_date': instance.viewDate,
  'task_id': instance.taskId,
  'is_approve': instance.isApprove,
  'short_name': instance.shortName,
  'user_profile_pic': instance.userProfilePic,
  'wfh_address_id': instance.wfhAddressId,
  'available_wfh_balance': instance.availableWfhBalance,
};

OutOfRangeReasonListModel _$OutOfRangeReasonListModelFromJson(
  Map<String, dynamic> json,
) => OutOfRangeReasonListModel(reasonName: json['reason_name'] as String?);

Map<String, dynamic> _$OutOfRangeReasonListModelToJson(
  OutOfRangeReasonListModel instance,
) => <String, dynamic>{'reason_name': instance.reasonName};

Template _$TemplateFromJson(Map<String, dynamic> json) => Template(
  reportAdded: json['reportAdded'] as bool?,
  isRequired: json['is_required'] as bool?,
  templateId: json['template_id'] as String?,
  templateName: json['template_name'] as String?,
);

Map<String, dynamic> _$TemplateToJson(Template instance) => <String, dynamic>{
  'reportAdded': instance.reportAdded,
  'is_required': instance.isRequired,
  'template_id': instance.templateId,
  'template_name': instance.templateName,
};
