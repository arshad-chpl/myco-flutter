// import 'dart:convert';
//
// import 'package:get_it/get_it.dart';
// import 'package:myco_flutter/core/encryption/gzip_util.dart';
// import 'package:myco_flutter/core/error/failure.dart';
// import 'package:myco_flutter/core/network/api_client.dart';
// import 'package:myco_flutter/features/lost_and_found/data/datasources/lost_and_found_data_source.dart';
// import 'package:myco_flutter/features/lost_and_found/data/model/lost_and_found_item_model.dart';
//
// class LostAndFoundDataSourceImpl implements LostAndFoundDataSource {
//   @override
//   Future<LostAndFoundModel> getLostAndFoundItems(
//     Map<String, dynamic> request,
//   ) async {
//     final encryptedBody = GzipUtil.encryptAES(jsonEncode(request));
//
//     final response = await safeApiCall(() {
//       return GetIt.I<ApiClient>().postDynamic(
//         'https://dev.my-company.app/india/employeeMobileApi/lost_found_controller.php',
//         encryptedBody,
//       );
//     });
//
//     return response.fold(
//       (failure) => throw failure,
//       (data) =>
//           LostAndFoundModel.fromJson(jsonDecode(GzipUtil.decryptAES(data))),
//     );
//   }
// }
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:myco_flutter/core/encryption/gzip_util.dart';
import 'package:myco_flutter/core/error/failure.dart';
import 'package:myco_flutter/core/network/api_client.dart';
import 'package:myco_flutter/features/lost_and_found/data/datasources/lost_and_found_data_source.dart';
import 'package:myco_flutter/features/lost_and_found/data/model/lost_and_found_item_model.dart';

class LostAndFoundDataSourceImpl implements LostAndFoundDataSource {
  @override
  Future<LostAndFoundModel> getLostAndFoundItems(
    Map<String, dynamic> request,
  ) async {
    try {
      final encryptedBody = GzipUtil.encryptAES(jsonEncode(request));

      final response = await GetIt.I<ApiClient>().postDynamic(
        'https://dev.my-company.app/india/employeeMobileApi/lost_found_controller.php',
        encryptedBody,
      );

      final decrypted = GzipUtil.decryptAES(response);
      return LostAndFoundModel.fromJson(jsonDecode(decrypted));
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        throw const TimeoutFailure();
      } else if (e.type == DioErrorType.badResponse) {
        switch (e.response?.statusCode) {
          case 401:
            throw const UnauthorizedFailure();
          case 403:
            throw const ForbiddenFailure();
          case 404:
            throw const NotFoundFailure();
          case 409:
            throw const ConflictFailure();
          default:
            throw UnknownFailure("Server error: ${e.response?.statusCode}");
        }
      } else if (e.type == DioExceptionType.cancel) {
        throw const CancelledFailure();
      } else if (e.error is SocketException) {
        throw const NetworkFailure();
      } else {
        throw UnknownFailure();
      }
    } catch (e) {
      throw UnknownFailure(e.toString());
    }
  }
}
