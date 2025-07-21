class RequestOtpRequestModel {
  final String societyId;
  final String countryCode;
  final String otpType;
  final String userMobile;
  final bool isFirebase;
  final String userMacAddress;
  final String loginVia;
  final String languageId;

  RequestOtpRequestModel({
    required this.societyId,
    required this.countryCode,
    required this.otpType,
    required this.userMobile,
    required this.isFirebase,
    required this.userMacAddress,
    required this.loginVia,
    required this.languageId,
  });

  Map<String, dynamic> toMap() => {
      'user_login_new': 'user_login_new',
      'society_id': societyId,
      'country_code': countryCode,
      'otp_type': otpType,
      'user_mobile': userMobile,
      'is_firebase': isFirebase,
      'user_mac_address': userMacAddress,
      'login_via': loginVia,
      'language_id': languageId,
    };
}
