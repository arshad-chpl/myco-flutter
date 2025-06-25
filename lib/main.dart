import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:myco_flutter/core/router/app_router.dart';
import 'package:myco_flutter/di/injector.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  await init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final router = GetIt.I<AppRouter>().router;
    return MaterialApp.router(
      title: 'MyCo Flutter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      routerConfig: router,
      debugShowCheckedModeBanner: false,
    );
  }
}
