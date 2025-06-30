import 'dart:developer';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:myco_flutter/core/env/environment.dart';

class AppConstants {
  // App Info
  static const String appName = 'MyCo Flutter App';
  static const String version = '1.0.0';
}

class SharedPreferenceConstants {
  // App Info
  static const bool KEY_IS_WHITELABEL_APP = false;
  static const bool KEY_WHITE_LABEL_BYPASS_COMPANYLIST = true;
}

class VariableBag {
  static const String companyName = "company_name";
  static const String companyId = "company_id";
  static const String countryId = "country_id";
  static const String companyAddress = "company_address";
  static const String baseUrl = "base_url";
  static const String appLanguage = "lang_app";
  static const String languageId = "lang_id";
  static const String userId = "user_id";
  static const String registrationRequestPendingUserId =
      "registration_request_pending_user_id";
  static const String subEnd = "employeeMobileApi/";
  static const String residentApiEnd = "residentApiNew/";
  static const String mainKey = "bmsapikey";
  static String mainURL = ApiUrl.baseUrl;
  // "https://master.my-company.app/mainApiEnc/";
  static const String masterAPICall = "masterAPICall";
  static const String employeeMobileApi = "employeeMobileApi";
  static const String residentApiNew = "residentApiNew";
}

class ApiUrl {
  static String baseUrl = '';

  static void getMainURL() {
    final String env = dotenv.env['env'] ?? 'dev';
    log(env.toString(), name: 'environment');
    switch (env) {
      case 'prod':
        baseUrl = 'https://master.my-company.app/mainApiEnc/';
        break;
      case 'staging':
        baseUrl = 'https://staging.my-company.app/mainApiEnc/';
        break;
      case 'dev':
      default:
        baseUrl = 'https://dev.my-company.app/mainApiEnc/';
        break;
    }

    log(baseUrl, name: 'baseurl in apiurl');
  }
}
