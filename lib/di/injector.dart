
import 'package:get_it/get_it.dart';
import 'package:myco_flutter/core/router/app_router.dart';
import 'package:myco_flutter/core/services/preference_manager.dart';
import 'package:myco_flutter/di/modules/network_module.dart';
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
  // languageSelectorDi(sl);
}
