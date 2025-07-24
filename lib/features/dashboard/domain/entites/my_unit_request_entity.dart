class GetMyUnitsRequest {
  String? getMultiUnits;
  String? userMobile;
  String? countryCode;
  String? userId;
  String? blockId;
  String? floorId;
  String? levelId;
  String? userToken;
  String? fakeToken;
  String? companyId;
  String? appVersionCode;
  String? appVersionName;
  String? phoneModel;
  String? phoneBrand;
  String? androidSdkVersion;
  String? androidVersion;
  String? androidOsName;
  String? userMacAddress;
  String? device;
  String? locationPermissionStatus;
  String? languageId;
  GetMyUnitsRequest({
    this.getMultiUnits,
    this.userMobile,
    this.countryCode,
    this.userId,
    this.blockId,
    this.floorId,
    this.levelId,
    this.userToken,
    this.fakeToken,
    this.companyId,
    this.appVersionCode,
    this.appVersionName,
    this.phoneModel,
    this.phoneBrand,
    this.androidSdkVersion,
    this.androidVersion,
    this.androidOsName,
    this.userMacAddress,
    this.device,
    this.locationPermissionStatus,
    this.languageId,
  });

  Map<String, dynamic> toJson() => {
    'getMultiUnitsFast': getMultiUnits,
    'user_mobile': userMobile,
    'country_code': countryCode,
    'user_id': userId,
    'block_id': blockId,
    'floor_id': floorId,
    'level_id': levelId,
    'user_token': userToken,
    'fake_user_token': fakeToken,
    'society_id': companyId,
    'app_version_code': appVersionCode,
    'app_version_name': appVersionName,
    'phone_model': phoneModel,
    'phone_brand': phoneBrand,
    'android_sdk_version': androidSdkVersion,
    'android_version': androidVersion,
    'android_os_name': androidOsName,
    'user_mac_address': userMacAddress,
    'device': device,
    'location_permission_status': locationPermissionStatus,
    'language_id': languageId,
  };
}
