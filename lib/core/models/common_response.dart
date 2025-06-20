class CommonResponse {
  final String? status;

  final String? message;

  final bool? isFirebase;

  final String? trxId;

  final bool? isEmailOtp;

  final bool? isVoiceOtp;

  final String? error;

  final bool? viewDialog;

  final bool? viewDialogApiCall;

  CommonResponse({
    this.status,
    this.message,
    this.isFirebase,
    this.trxId,
    this.isEmailOtp,
    this.isVoiceOtp,
    this.error,
    this.viewDialog,
    this.viewDialogApiCall,
  });

  factory CommonResponse.fromJson(Map<String, dynamic> json) => CommonResponse(
    status: json['status'] as String?,
    message: json['message'] as String?,
    isFirebase: json['is_firebase'] as bool?,
    trxId: json['trx_id'] as String?,
    isEmailOtp: json['is_email_otp'] as bool?,
    isVoiceOtp: json['is_voice_otp'] as bool?,
    error: json['error'] as String?,
    viewDialog: json['view_dialog'] as bool?,
    viewDialogApiCall: json['view_dialog_api_call'] as bool?,
  );

  Map<String, dynamic> toJson() => <String, dynamic>{
    'status': status,
    'message': message,
    'is_firebase': isFirebase,
    'trx_id': trxId,
    'is_email_otp': isEmailOtp,
    'is_voice_otp': isVoiceOtp,
    'error': error,
    'view_dialog': viewDialog,
    'view_dialog_api_call': viewDialogApiCall,
  };
}
