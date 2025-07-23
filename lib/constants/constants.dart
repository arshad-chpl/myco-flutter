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
  static const String dioWithAuth = 'dioWithAuth';
  static const String companyName = 'company_name';
  static const String companyId = 'company_id';
  static const String countryId = 'country_id';
  static const String companyAddress = 'company_address';
  static const String baseUrl = 'base_url';
  static const String appLanguage = 'lang_app';
  static const String languageId = 'lang_id';
  static const String userId = 'user_id';
  static const String registrationRequestPendingUserId = 'registration_request_pending_user_id';
  static const String REGISTRATION_REQUEST_IS_APPROVE = 'registration_request_is_approved';
  static const String REQUEST_EMPLOYEE = 'request_employee';
  static const String SOCIETY_ID = 'societyId';
  static const String subEnd = 'employeeMobileApi/';
  static const String residentApiEnd = 'residentApiNew/';
  static const String mainKey = 'bmsapikey';
  static const String mainURL = 'https://master.my-company.app/mainApiEnc/';
  static const String URL_PRIVACY = 'https://master.my-company.app/';
  static const String CP_URL = 'https://www.my-co.app/cancellationpolicy';
  // "https://master.my-company.app/mainApiEnc/";
  static const String masterAPICall = 'masterAPICall';
  static const String employeeMobileApi = 'employeeMobileApi';
  static const String residentApiNew = 'residentApiNew';
  static const String employeeApi = 'employeeApi';
  static const String residentAPI = 'residentAPI';

  /////////////////////////
  // Admin Menu
  ////////////////////////
  static const String ADMIN_VIEW_MENU_PENDING_LEAVES = '1';
  static const String ADMIN_VIEW_MENU_PENDING_EXPENSES = '2';
  static const String ADMIN_VIEW_MENU_PAST_DATE_REQUEST_ATTENDANCE = '5';
  static const String ADMIN_VIEW_MENU_PUNCH_OUT_MISSING_REQUEST = '6';
  static const String ADMIN_VIEW_MENU_ESCALATION = '7';
  static const String ADMIN_VIEW_MENU_IDEA_APPROVAL = '8';
  static const String ADMIN_VIEW_MENU_OUT_OF_RANGE_REQUEST = '9';
  static const String ADMIN_VIEW_MENU_APPROVE_EMPLOYEE = '10';
  static const String ADMIN_VIEW_MENU_ONBOARDING = '11';
  static const String ADMIN_VIEW_MENU_ABSENT_PRESENT = '12';
  static const String ADMIN_VIEW_MENU_WFH_APPROVAL = '13';
  static const String ADMIN_VIEW_MENU_MONTHLY_ATTENDANCE = '14';
  static const String ADMIN_VIEW_MENU_DEVICE_CHANGE = '16';
  static const String ADMIN_VIEW_MENU_TRACK_EMPLOYEE = '17';
  static const String ADMIN_VIEW_MENU_PERSONAL_INFO = '18';
  static const String ADMIN_VIEW_MENU_WORK_REPORT = '19';
  static const String ADMIN_VIEW_MENU_ADVANCE_SALARY_REQUEST = '21';
  static const String ADMIN_VIEW_MENU_LOAN_REQUEST = '22';
  static const String ADMIN_VIEW_MENU_PENDING_VISIT_APPROVAL = '23';
  static const String ADMIN_VIEW_MENU_END_VISIT_APPROVAL = '24';
  static const String ADMIN_VIEW_MENU_VIEW_EMPLOYEE_VISITS = '25';
  static const String ADMIN_VIEW_MENU_SHIFT_CHANGE_REQUESTS = '26';
  static const String ADMIN_VIEW_MENU_FACE_CHANGE_REQUESTS = '27';
  static const String ADMIN_VIEW_MENU_ADVANCE_EXPENSE_REQUEST = '37';
  static const String ADMIN_VIEW_MENU_SHORT_LEAVE_REQUEST = '38';
  static const String ADMIN_VIEW_MENU_BREAK_REQUEST = '39';
  static const String ADMIN_VIEW_MENU_GPS_INTERNET_SUMMARY = '40';
  static const String ADMIN_VIEW_MENU_AUTO_LEAVES = '51';
  static const String ADMIN_VIEW_MENU_VIEW_SHORT_LEAVES = '52';
  static const String ADMIN_VIEW_MENU_SANDWICH_LEAVES = '53';
  static const String ADMIN_VIEW_MENU_REVIEW_WORK_REPORT = '54';
  static const String ADMIN_VIEW_MENU_WORK_REPORT_SUMMARY = '55';
  static const String ADMIN_VIEW_MENU_TRACKING_SETTING = '56';
  static const String ADMIN_VIEW_MENU_LIVE_MAP_VIEW = '57';
  static const String ADMIN_VIEW_MENU_TRAVEL_SUMMARY = '58';
  static const String ADMIN_VIEW_MENU_PAID_EXPENSE = '59';
  static const String ADMIN_VIEW_MENU_UNPAID_EXPENSE = '60';
  static const String ADMIN_VIEW_MENU_OFFBOARDING = '62';
  static const String ADMIN_VIEW_MENU_CONTACT_INFO = '63';
  static const String ADMIN_VIEW_MENU_PAST_EXPERIENCE = '64';
  static const String ADMIN_VIEW_MENU_EDUCATION = '65';
  static const String ADMIN_VIEW_MENU_ACHIEVEMENTS = '66';
  static const String ADMIN_VIEW_MENU_EMPLOYEES_FACE = '69';

  /////////////////////////
  // Hive Boxes
  ////////////////////////

  static const String ADMIN_VIEW_BOX = 'admin_view_box';


  // const variables of pages
  static const formContentSpacingVertical = 20 ;
  static const screenHorizontalPadding = 26.0;
  static const textFieldRowGap = 10;
  static const buttonBorderRadius = 30.0;
  static const bottomSheetBorderRadius = 30.0;
  static const bottomSheetLeftPadding  = 26.0;
  static const bottomSheetRightPadding = 26.0;
  static const bottomSheetTopPadding = 20.0;
  static const bottomSheetBottomPadding = 20.0;
  static const buttonRowSpacing = 15; // width
  static const buttonColumnSpacing = 20; // height
  static const containerBorderRadius = 12.0; // responsive
  static const shadowContainerVerticalPadding = 16.0;
  static const commonCardVerticalPadding = 15.0;
  static const commonCardHorizontalPadding = 10.0;
  static const commonCardBorderRadius = 15.0;
  static const tabBarAfterSpace = 30; // height
  static const searchFiledAfterSpace = 30; // height
  static const commonContainerPadding = 10.0; //all
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