import 'package:get_it/get_it.dart';
import 'package:myco_flutter/core/router/app_router.dart';
import 'package:myco_flutter/core/services/cache_service.dart';
import 'package:myco_flutter/core/services/hive_cache_service.dart';
import 'package:myco_flutter/core/services/preference_manager.dart';
import 'package:myco_flutter/di/modules/network_module.dart';
import 'package:myco_flutter/features/admin_view/presentation/di/admin_view_di.dart';
import 'package:myco_flutter/features/company_info/presentation/di/company_info_di.dart';
import 'package:myco_flutter/features/company_selector/presentation/di/company_select_di.dart';
import 'package:myco_flutter/features/company_selector/presentation/di/request_otp_di.dart';
import 'package:myco_flutter/features/dashboard/presentation/di/dashboard_di.dart';
import 'package:myco_flutter/features/holiday/presentation/di/holiday_di.dart';
import 'package:myco_flutter/features/language_selector/presentation/di/language_di.dart';
import 'package:myco_flutter/features/my_visit/presentation/di/face_detection_di.dart';
import 'package:myco_flutter/features/my_visit/presentation/di/visit_with_di.dart';
import 'package:myco_flutter/features/my_visit/presentation/di/face_detection_di.dart';
import 'package:myco_flutter/features/splash/presentation/di/splash_di.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerSingleton<AppRouter>(AppRouter());

  // Register our Hive-based CacheService as a singleton
  sl.registerSingleton<CacheService>(HiveCacheService());

  sl.registerSingleton<PreferenceManager>(PreferenceManager());
  // await initFirebaseModule(sl);

  await initNetworkModule(sl);

  // Initialize feature modules
  //========Language Selector=========
  setupLanguageDI(sl);

  //========Splash=========
  splashDi(sl);

  //========Language Selector=========
  setupLanguageDI(sl);
  //========Login=========
  await setupLoginDi(sl);

  //========Company Selector=========
  companySelectorDi(sl);

  //========Dashboard=========
  DashboardDi(sl);

  //========Inquiry=========
  InquiryDi(sl);

  //========Face Detection=========
  faceDetectionDi(sl);

  // ========Admin View=========
  await adminViewDi(sl);

  //========VISIT WITH=========
  visitWithDi(sl);

  // ========Admin View=========
  adminViewDi(sl);
}
