import 'package:dio/dio.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:myco_flutter/constants/constants.dart';

Dio createDio(credentials) {
  final dio = Dio(
    BaseOptions(
      baseUrl: VariableBag.mainURL, // Replace with your API base URL
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      headers: {'Content-Type': 'application/json'},
    ),
  );
  dio.options.headers['Authorization'] = 'Basic $credentials';
  dio.options.headers['Accept'] = 'application/json'; // Optional
  dio.options.headers['key'] = VariableBag.mainKey; // Optional
  dio.options.headers['countryid'] = '101'; // Optional
  dio.options.headers['languageid'] = '1'; // Optional
  dio.options.headers['societyid'] = '1'; // Optional
  dio.options.headers['header_device'] = 'android'; // Optional
  dio.options.headers['headerappversion'] = '206'; // Optional
  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) {
        print("🚀 Request[${options.method}] => PATH: ${options.path}");
        return handler.next(options);
      },
      onResponse: (response, handler) {
        print("✅ Response[${response.statusCode}] => ${response.data}");
        return handler.next(response);
      },
      onError: (e, handler) {
        print("❌ Error[${e.response?.statusCode}] => ${e.message}");
        FirebaseCrashlytics.instance.recordError(e, e.stackTrace);
        return handler.next(e);
      },
    ),
  );
  return dio;
}
