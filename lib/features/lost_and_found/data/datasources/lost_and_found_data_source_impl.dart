import 'dart:convert';
import 'dart:developer';
import 'package:get_it/get_it.dart';
import 'package:myco_flutter/constants/constants.dart';
import 'package:myco_flutter/core/encryption/gzip_util.dart';
import 'package:myco_flutter/core/network/api_client.dart';
import 'package:myco_flutter/core/services/preference_manager.dart';
import 'package:myco_flutter/features/lost_and_found/data/datasources/lost_and_found_data_source.dart';
import 'package:myco_flutter/features/lost_and_found/data/model/lost_and_found_item_model.dart';

class LostAndFoundDataSourceImpl implements LostAndFoundDataSource {
  final ApiClient apiClient;

  LostAndFoundDataSourceImpl({required this.apiClient});

  @override
  Future<LostAndFoundModel> getLostAndFoundItems() async {
    final Map<String, dynamic> request = {
      'getListNew': 'getListNew',
      'society_id': '1',
      // 'user_id': '10',
      'user_id': await PreferenceManager().getUserId(),
      'language_id': '1',
      'lost_found_master_id': '',
      'is_details_view': '0',
    };
    final encryptedBody = GzipUtil.encryptAES(jsonEncode(request));

    // final String encryptedBody =
    //     ' VgpkCnU5vQ6Ae8gWdprS6Rh4JQ0aX4mK5WDmM+wHbk/bvUubUKmUhNuPcBDcAJR4IfxXGvIv/7ZcGQ5eO46mVkfVzMI34MPTMzHzOvQzDvu6N+S+Cg3Qjl12bB1/bwYdKenE2SpyTlbfimHfvz+nncMcZ+0OlE/9WWq4EJQIgkA=';

    log(encryptedBody);
    final response = await apiClient.postDynamic(
      'lost_found_controller.php',
      encryptedBody,
    );

    log(name: "jenil", json.decode(GzipUtil.decryptAES(response)));
    return LostAndFoundModel.fromJson(
      json.decode(GzipUtil.decryptAES(response)),
    );

    // final decrypted = GzipUtil.decryptAES(response);
    // log("🔓 Decrypted API Response", name: "LostFound", error: decrypted);
    //
    // final decodedJson = json.decode(decrypted);
    // return LostAndFoundModel.fromJson(decodedJson);

    //   CompanyResponseModel.fromJson(
    //   json.decode(GzipUtil.decryptAES(response)),
    // );
    // (
    //     'https://dev.my-company.app/india/employeeMobileApi/lost_found_controller.php',
    //     encryptedBody,
    //   );
    // });

    // return response.fold(
    //   (failure) => throw failure,
    //   (data) =>
    //       LostAndFoundModel.fromJson(jsonDecode(GzipUtil.decryptAES(data))),
    // );
  }
}
