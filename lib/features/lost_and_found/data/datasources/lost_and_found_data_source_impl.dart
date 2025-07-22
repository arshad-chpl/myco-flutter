import 'dart:convert';

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
    final encryptedBody = GzipUtil.encryptAES(jsonEncode(request));

    final response = await safeApiCall(() {
      return GetIt.I<ApiClient>().postDynamic(
        'https://dev.my-company.app/india/employeeMobileApi/lost_found_controller.php',
        encryptedBody,
      );
    });

    return response.fold(
      (failure) => throw failure,
      (data) =>
          LostAndFoundModel.fromJson(jsonDecode(GzipUtil.decryptAES(data))),
    );
  }
}
