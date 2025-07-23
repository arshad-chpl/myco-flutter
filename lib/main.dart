import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:myco_flutter/constants/constants.dart';
import 'package:myco_flutter/core/router/app_router.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/di/injector.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  await dotenv.load(fileName: '.env');
  ApiUrl.getMainURL();

  await Hive.initFlutter();

  await initDi();

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      // statusBarIconBrightness: Brightness.dark, // for Android
      // statusBarBrightness: Brightness.light, // for iOS
      // systemNavigationBarColor: Colors.white, // bottom nav bar color
      // systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );

  runApp(
    //     DevicePreview(
    //   enabled: !kReleaseMode,
    //   builder: (context) => MyApp(), // Wrap your app
    // ),
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final router = GetIt.I<AppRouter>().router;
    return MaterialApp.router(
      title: 'MyCo Flutter',
      themeMode: ThemeMode.system,
      theme: AppTheme.lightTheme(context),
      darkTheme: AppTheme.darkTheme(context),
      routerConfig: router,
      debugShowCheckedModeBanner: false,
    );
  }
}
