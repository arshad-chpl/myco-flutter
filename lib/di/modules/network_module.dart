import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:myco_flutter/constants/constants.dart';
import 'package:myco_flutter/core/network/api_client.dart';
import 'package:myco_flutter/core/network/dio_provider.dart';
import 'package:myco_flutter/core/network/network_info.dart';
import 'package:myco_flutter/core/services/preference_manager.dart';
import 'package:myco_flutter/core/utils/safe_api_call.dart';
import 'package:myco_flutter/core/utils/util.dart';

Future<void> initNetworkModule(GetIt sl) async {
  sl.registerLazySingleton(() => SafeApiCall(sl()));

  final PreferenceManager preference = sl<PreferenceManager>();
  final userId = preference.getUserId();
  final companyId = await preference.getCompanyId();
  final userMobile = preference.getUserMobile();
  final baseUrl = await preference.getBaseUrl();
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

  _registerOrReplace<ApiClient>(
    ApiClient(sl(), baseUrl: baseUrl! + VariableBag.residentApiEnd),
    sl,
    instanceName: VariableBag.residentApiNew,
  );

  _registerOrReplace<ApiClient>(
    ApiClient(sl(), baseUrl: baseUrl + VariableBag.subEnd),
    sl,
    instanceName: VariableBag.employeeMobileApi,
  );

  _registerOrReplace<ApiClient>(
    ApiClient(sl(), baseUrl: baseUrl + VariableBag.subEnd),
    sl,
    instanceName: VariableBag.employeeApi,
  );

  _registerOrReplace<ApiClient>(
    ApiClient(sl(), baseUrl: baseUrl + VariableBag.residentApiEnd),
    sl,
    instanceName: VariableBag.residentAPI,
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
