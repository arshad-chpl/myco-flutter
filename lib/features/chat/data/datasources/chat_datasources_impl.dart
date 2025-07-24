import 'dart:convert';
<<<<<<< HEAD

import 'package:myco_flutter/core/network/api_client.dart';
=======
import 'dart:developer';


import 'package:myco_flutter/core/network/api_client.dart';
import 'package:myco_flutter/core/services/preference_manager.dart';
>>>>>>> main
import 'package:myco_flutter/features/chat/data/datasources/chat_datasources.dart';
import 'package:myco_flutter/features/chat/data/models/chat_list_model.dart';

class ChatDatasourcesImpl implements ChatDatasources{

  final ApiClient apiClient;

  ChatDatasourcesImpl({required this.apiClient});
  @override
  Future<ChatListModel> getChatList() async{
    final body = {
      'getMemberListNew' : 'getMemberListNew',
      'society_id' : '1',
      'unit_id' : '1',
      'group_id' : '',
      'floor_id' : '0',
      'floor_id_access' : '1',
      'block_id' : '1',
      'user_type' : '',
<<<<<<< HEAD
      'user_id' : '21',
      'language_id' : '1',
    };

=======
      'user_id' : await PreferenceManager().getUserId(), 
      'language_id' : '1',
    };
    log(body.toString(), name: "body");
>>>>>>> main
    final response = await apiClient.postFormDynamic('chat_list_controller.php', body);

    return ChatListModel.fromJson(json.decode(response));
  }
}