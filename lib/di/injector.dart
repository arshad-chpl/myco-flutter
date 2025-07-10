import 'package:get_it/get_it.dart';
import 'package:myco_flutter/core/router/app_router.dart';
import 'package:myco_flutter/core/services/preference_manager.dart';
import 'package:myco_flutter/di/modules/network_module.dart';
import 'package:myco_flutter/features/admin_view/presentation/di/admin_view_di.dart';
import 'package:myco_flutter/features/company_info/presentation/di/company_info_di.dart';
import 'package:myco_flutter/features/company_selector/presentation/di/company_select_di.dart';
import 'package:myco_flutter/features/holiday/presentation/di/holiday_di.dart';
import 'package:myco_flutter/features/language_selector/presentation/di/language_di.dart';
import 'package:myco_flutter/features/my_visit/presentation/di/face_detection_di.dart';
import 'package:myco_flutter/features/splash/presentation/di/splash_di.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerSingleton<AppRouter>(AppRouter());
  sl.registerSingleton<PreferenceManager>(PreferenceManager());
  // await initFirebaseModule(sl);

  await initNetworkModule(sl);

  // Initialize feature modules
  //========Splash=========
  splashDi(sl);

  //========Language Selector=========
  setupLanguageDI(sl);

  //========Company Selector=========
  companySelectorDi(sl);

  //========Inquiry=========
  InquiryDi(sl);

  //========Face Detection=========
  faceDetectionDi(sl);

  //========Company Info=========
  setupCompanyInfoDI(sl);

  //========Holiday=========
  setupHolidayDI(sl);

  // ========Admin View=========
  await adminViewDi(sl);
}
