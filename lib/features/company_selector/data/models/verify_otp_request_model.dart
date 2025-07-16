class VerifyOtpRequestModel {
  final String societyId;
  final String userMobile;
  final String countryCode;
  final String userToken;
  final String device;
  final String otp;
  final bool isFirebase;
  final String userMacAddress;
  final String macAddressDevice;
  final String macAddressPhoneModal;
  final String androidSdkVersion;
  final String androidVersion;
  final String androidOsName;
  final String loginVia;
  final String languageId;

  VerifyOtpRequestModel({
    required this.societyId,
    required this.userMobile,
    required this.countryCode,
    required this.userToken,
    required this.device,
    required this.otp,
    required this.isFirebase,
    required this.userMacAddress,
    required this.macAddressDevice,
    required this.macAddressPhoneModal,
    required this.androidSdkVersion,
    required this.androidVersion,
    required this.androidOsName,
    required this.loginVia,
    required this.languageId,
  });

  Map<String, dynamic> toMap() => {
    'user_verify_new_country': 'user_verify_new_country',
    'society_id': societyId,
    'user_mobile': userMobile,
    'country_code': countryCode,
    'user_token': userToken,
    'device': device,
    'otp': otp,
    'is_firebase': isFirebase,
    'user_mac_address': userMacAddress,
    'mac_address_device': macAddressDevice,
    'mac_address_phone_modal': macAddressPhoneModal,
    'android_sdk_version': androidSdkVersion,
    'android_version': androidVersion,
    'android_os_name': androidOsName,
    'login_via': loginVia,
    'language_id': languageId,
  };
}
