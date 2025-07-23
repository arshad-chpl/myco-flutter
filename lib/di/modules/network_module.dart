import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
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
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(Connectivity()));

  // final PreferenceManager preference = sl<PreferenceManager>();
  // final userId = preference.getUserId();
  // final companyId = await preference.getCompanyId();
  // final userMobile = preference.getUserMobile();
  // final baseUrl = await preference.getBaseUrl();
  // final password = Util.getCurrentPassword(
  //   companyId.toString(),
  //   userId,
  //   userMobile.toString(),
  // );

  await refreshApiServiceCompany(sl);
}

Future<void> refreshApiServiceCompany(GetIt sl) async {
  final preference = sl<PreferenceManager>();
  final companyId = await preference.getCompanyId();

  // TODO: currently static userID and Mobile, need to change later
  final userId = '1365';
  final userMobile ='6265784954';
  var baseUrl = await preference.getBaseUrl();
  final password = Util.getCurrentPassword(
    companyId?.toString() ?? '',
    userId?.toString() ?? '',
    userMobile.toString(),
  );
  final credentials = base64Encode(utf8.encode('$userId:$password'));
  // final Dio dioWithAuth= createDio(credentials);
  // sl.registerLazySingleton(() => createDio(credentials));
  // sl.registerLazySingleton(() => ApiClient(sl()));

  _registerOrReplace<Dio>(
    createDio(credentials),
    sl,
    instanceName: VariableBag.dioWithAuth,
  );
  final dio = sl<Dio>(instanceName: VariableBag.dioWithAuth);
  _registerOrReplace<ApiClient>(
    ApiClient(dio),
    sl,
    instanceName: VariableBag.masterAPICall,
  );
  if (baseUrl == null) return;

  _registerOrReplace<ApiClient>(
    ApiClient(dio, baseUrl: baseUrl + VariableBag.residentApiEnd),
    sl,
    instanceName: VariableBag.residentApiNew,
  );

  _registerOrReplace<ApiClient>(
    ApiClient(dio, baseUrl: baseUrl + VariableBag.subEnd),
    sl,
    instanceName: VariableBag.employeeMobileApi,
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
