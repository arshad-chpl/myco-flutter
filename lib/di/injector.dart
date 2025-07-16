import 'package:get_it/get_it.dart';
import 'package:myco_flutter/core/router/app_router.dart';
import 'package:myco_flutter/core/services/preference_manager.dart';
import 'package:myco_flutter/di/modules/network_module.dart';
import 'package:myco_flutter/features/admin_view/presentation/di/admin_view_di.dart';
import 'package:myco_flutter/features/company_selector/presentation/di/company_select_di.dart';
import 'package:myco_flutter/features/language_selector/presentation/di/language_di.dart';
import 'package:myco_flutter/features/my_visit/presentation/di/face_detection_di.dart';
import 'package:myco_flutter/features/my_visit/presentation/di/visit_with_di.dart';
import 'package:myco_flutter/features/splash/presentation/di/splash_di.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerSingleton<AppRouter>(AppRouter());
  sl.registerSingleton<PreferenceManager>(PreferenceManager());
  // await initFirebaseModule(sl);

  await initNetworkModule(sl);

  // Initialize feature modules
  //========Language Selector=========
  setupLanguageDI(sl);
  
  //========Splash=========
  splashDi(sl);


  //========Company Selector=========
  companySelectorDi(sl);

  //========Inquiry=========
  InquiryDi(sl);

  //========Face Detection=========
  faceDetectionDi(sl);

  // ========Admin View=========
  await adminViewDi(sl);

  //========VISIT WITH=========
  visitWithDi(sl);
}
