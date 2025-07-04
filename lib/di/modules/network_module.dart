import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:myco_flutter/constants/constants.dart';
import 'package:myco_flutter/core/network/api_client.dart';
import 'package:myco_flutter/core/network/dio_provider.dart';
import 'package:myco_flutter/core/network/network_info.dart';
import 'package:myco_flutter/core/services/preference_manager.dart';
import 'package:myco_flutter/core/utils/safe_api_call.dart';
import 'package:myco_flutter/core/utils/util.dart';

Future<void> initNetworkModule(GetIt sl) async {
  sl.registerLazySingleton(() => SafeApiCall(sl()));

  PreferenceManager preference = sl<PreferenceManager>();
  final userId = await preference.getUserId();
  final companyId = await preference.getCompanyId();
  final userMobile = await preference.getUserMobile();
  var baseUrl = await preference.getBaseUrl();
  final password = Util.getCurrentPassword(
    companyId.toString(),
    userId,
    userMobile.toString(),
  );
  final credentials = base64Encode(utf8.encode('$userId:$password'));
  sl.registerLazySingleton(() => createDio(credentials));
  sl.registerLazySingleton(() => ApiClient(sl()));
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(Connectivity()));

  _registerOrReplace<ApiClient>(
    ApiClient(sl(), baseUrl: baseUrl ?? ''),
    sl,
    instanceName: VariableBag.masterAPICall,
  );
}

void _registerOrReplace<T extends Object>(
  T instance,
  GetIt sl, {
  String? instanceName,
}) {
  if (sl.isRegistered<T>(instanceName: instanceName)) {
    sl.unregister<T>(instanceName: instanceName);
  }
  sl.registerSingleton<T>(instance, instanceName: instanceName);
}
