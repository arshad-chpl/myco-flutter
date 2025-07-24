import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';


class PreferenceManager {
    static const String companyName = "company_name";
  static const String companyId = "company_id";
  static const String countryId = "country_id";
  static const String companyAddress = "company_address";
  static const String baseUrl = "base_url";
  static const String appLanguage = "lang_app";
  static const String languageId = "lang_id";
  static const String userId = "user_id";
  static const String mobileNo = "mobile_no";
  static const String registrationRequestPendingUserId =
      "registration_request_pending_user_id";
  static const String subEnd = "employeeMobileApi/";
  static const String residentApiEnd = "residentApiNew/";
  static const String mainKey = "bmsapikey";
  static const String mainURL = "https://master.my-company.app/mainApiEnc/";
  static const String masterAPICall = "masterAPICall";
  static const String employeeMobileApi = "employeeMobileApi";
  static const String residentApiNew = "residentApiNew";
  static const String cachedEmployeeResponse = 'cached_employee_response';

  static final PreferenceManager _instance = PreferenceManager._internal();
  factory PreferenceManager() => _instance;
  PreferenceManager._internal();

  Future<void> clearSecureStorageOnFreshInstall() async {
    final prefs = await SharedPreferences.getInstance();
    const installFlag = 'hasInstalled';

    final hasInstalled = prefs.getBool(installFlag) ?? false;

    if (!hasInstalled) {
      await prefs.clear(); // 🧹 Clear all stored preferences
      await prefs.setBool(installFlag, true);
    }
  }

  // ====== String ======
  Future<void> writeString(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }

  Future<String?> readString(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  // ====== Int ======
  Future<void> writeInt(String key, int value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(key, value);
  }

  Future<int?> readInt(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(key);
  }

  // ====== Double ======
  Future<void> writeDouble(String key, double value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble(key, value);
  }

  Future<double?> readDouble(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getDouble(key);
  }

  // ====== Bool ======
  Future<void> writeBool(String key, bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(key, value);
  }

  Future<bool?> readBool(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key);
  }

  // ====== Object ======
  Future<void> writeObject<T>(
    String key,
    T object,
    Map<String, dynamic> Function(T) toJson,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = jsonEncode(toJson(object));
    await prefs.setString(key, jsonString);
  }

  Future<T?> readObject<T>(
    String key,
    T Function(Map<String, dynamic>) fromJson,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(key);
    if (jsonString == null) return null;
    final Map<String, dynamic> jsonMap = jsonDecode(jsonString);
    return fromJson(jsonMap);
  }

  // ====== Delete / Clear ======
  Future<void> delete(String key) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
  }

  Future<void> clearAll() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  Future<void> setKeyValueString(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }

  // Get string value
  Future<String> getKeyValueString(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key) ?? '';
  }

  // ====== Custom Methods ======

  Future<void> setUserId(String value) async {
    await writeString(userId, value);
  }

  //TODO: Dummy static return for now
  Future<String?> getUserId() => readString(userId);

  Future<void> setUserMobileNo(String value) async {
    await writeString(mobileNo, value);
  }

  Future<String?> getUserMobileNo() => readString(mobileNo);

  Future<void> setLanguageId(String value) async {
    await writeString(languageId, value);
  }

  Future<String?> getLanguageId() => readString(languageId);

  Future<void> setCompanyId(String value) async {
    await writeString(companyId, value);
  }

  Future<String?> getCompanyId() => readString(companyId);

  Future<void> setCountryId(String value) async {
    await writeString(countryId, '101');
  }

  Future<String?> getCountryId() => readString(countryId);

  Future<void> setCompanyName(String value) async {
    await writeString(companyName, value);
  }

  Future<String?> getCompanyName() => readString(companyName);

  Future<void> setCompanyAddress(String value) async {
    await writeString(companyAddress, value);
  }

  Future<String?> getCompanyAddress() => readString(companyAddress);

  Future<void> setBaseUrl(String value) async {
    await writeString(baseUrl, value);
  }

  Future<String?> getBaseUrl() => readString(baseUrl);

  // Future<Society?> getSelectedCompany() async {
  //   final jsonString = await readString('selectedCompany');
  //   if (jsonString == null) return null;
  //   final json = jsonDecode(jsonString);
  //   return Society.fromJson(json);
  // }

  // ====== Employee Methods ======
  Future<void> setCachedEmployeeResponse(String json) =>
      writeString(cachedEmployeeResponse, json);

  Future<String?> getCachedEmployeeResponse() =>
      readString(cachedEmployeeResponse);

  Future<void> clearCachedEmployeeResponse() => delete(cachedEmployeeResponse);

  Future<void> setLoginSession(bool value) async {
    await writeBool("loginSession", value);
  }

  Future<bool?> getLoginSession() => readBool("loginSession");
}
