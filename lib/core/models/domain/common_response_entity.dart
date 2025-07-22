import 'package:equatable/equatable.dart';

// The main entity for the common response.
class CommonResponseModelEntity extends Equatable {
  final List<OutOfRangeReasonListModelEntity>? outOfRangeReason;
  final String? status;
  final String? error;
  final bool? viewDialogApiCall;
  final bool? viewDialog;
  final String? reminingDocumentCount;
  final String? message;
  final String? viewMessage;
  final bool? workReportOn;
  final String? reminderId;
  final String? travelModeId;
  final String? noStockProductVariantIds;
  final String? startTime;
  final String? leaveStatus;
  final String? leaveStatusView;
  final bool? workReportAdded;
  final String? totalWorkReport;
  final String? punchOutWorkReportRequirement;
  final List<TemplateEntity>? template;
  final String? workReportMessage;
  final String? remainingWorkReport;
  final String? availableBalance;
  final bool? accountDeactive;
  final bool? otpPopup;
  final bool? isEmailOtp;
  final bool? isVoiceOtp;
  final bool? lateIn;
  final bool? earlyOut;
  final String? trxId;
  final String? taskImportantId;
  final String? taskMyDayId;
  final String? purchaseCartId;
  final String? cartCount;
  final String? userId;
  final String? userMobile;
  final bool? isFirebase;
  final bool? allowPunchInAfterWorkReport;
  final String? totalPunchInWorkReport;
  final bool? viewPunchInWrView;
  final String? totalReportAdded;
  final String? remainingPunchInWorkReport;
  final String? workReportId;
  final String? visitId;
  final String? userVisitingCard;
  final String? userVisitingCardBack;
  final String? faceImageTwo;
  final String? faceImageOne;
  final String? faceAddedDate;
  final String? retailerId;
  final String? retailerCode;
  final String? addedCount;
  final String? returnCount;
  final String? verifyCount;
  final String? viewDate;
  final String? taskId;
  final bool? isApprove;
  final String? shortName;
  final String? userProfilePic;
  final String? wfhAddressId;
  final String? availableWfhBalance;

  const CommonResponseModelEntity({
    this.outOfRangeReason,
    this.status,
    this.error,
    this.viewDialogApiCall,
    this.viewDialog,
    this.reminingDocumentCount,
    this.message,
    this.viewMessage,
    this.workReportOn,
    this.reminderId,
    this.travelModeId,
    this.noStockProductVariantIds,
    this.startTime,
    this.leaveStatus,
    this.leaveStatusView,
    this.workReportAdded,
    this.totalWorkReport,
    this.punchOutWorkReportRequirement,
    this.template,
    this.workReportMessage,
    this.remainingWorkReport,
    this.availableBalance,
    this.accountDeactive,
    this.otpPopup,
    this.isEmailOtp,
    this.isVoiceOtp,
    this.lateIn,
    this.earlyOut,
    this.trxId,
    this.taskImportantId,
    this.taskMyDayId,
    this.purchaseCartId,
    this.cartCount,
    this.userId,
    this.userMobile,
    this.isFirebase,
    this.allowPunchInAfterWorkReport,
    this.totalPunchInWorkReport,
    this.viewPunchInWrView,
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
    this.isApprove,
    this.shortName,
    this.userProfilePic,
    this.wfhAddressId,
    this.availableWfhBalance,
  });

  @override
  List<Object?> get props => [
    outOfRangeReason,
    status,
    error,
    viewDialogApiCall,
    viewDialog,
    reminingDocumentCount,
    message,
    viewMessage,
    workReportOn,
    reminderId,
    travelModeId,
    noStockProductVariantIds,
    startTime,
    leaveStatus,
    leaveStatusView,
    workReportAdded,
    totalWorkReport,
    punchOutWorkReportRequirement,
    template,
    workReportMessage,
    remainingWorkReport,
    availableBalance,
    accountDeactive,
    otpPopup,
    isEmailOtp,
    isVoiceOtp,
    lateIn,
    earlyOut,
    trxId,
    taskImportantId,
    taskMyDayId,
    purchaseCartId,
    cartCount,
    userId,
    userMobile,
    isFirebase,
    allowPunchInAfterWorkReport,
    totalPunchInWorkReport,
    viewPunchInWrView,
    totalReportAdded,
    remainingPunchInWorkReport,
    workReportId,
    visitId,
    userVisitingCard,
    userVisitingCardBack,
    faceImageTwo,
    faceImageOne,
    faceAddedDate,
    retailerId,
    retailerCode,
    addedCount,
    returnCount,
    verifyCount,
    viewDate,
    taskId,
    isApprove,
    shortName,
    userProfilePic,
    wfhAddressId,
    availableWfhBalance,
  ];
}

// The entity for an out of range reason.
class OutOfRangeReasonListModelEntity extends Equatable {
  final String? reasonName;

  const OutOfRangeReasonListModelEntity({this.reasonName});

  @override
  List<Object?> get props => [reasonName];
}

// The entity for a template.
class TemplateEntity extends Equatable {
  final bool? reportAdded;
  final bool? isRequired;
  final String? templateId;
  final String? templateName;

  const TemplateEntity({
    this.reportAdded,
    this.isRequired,
    this.templateId,
    this.templateName,
  });

  @override
  List<Object?> get props => [
    reportAdded,
    isRequired,
    templateId,
    templateName,
  ];
}
