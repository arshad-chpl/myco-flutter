import 'dart:convert';
import 'dart:developer';


import 'package:myco_flutter/core/network/api_client.dart';
import 'package:myco_flutter/core/services/preference_manager.dart';
import 'package:myco_flutter/features/chat/data/datasources/chat_datasources.dart';
import 'package:myco_flutter/features/chat/data/models/chat_list_model.dart';
import 'package:myco_flutter/features/chat/data/models/group_chat_list_model.dart';
import 'package:myco_flutter/features/chat/data/models/member_chat_list_model.dart';

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
      'user_id' : await PreferenceManager().getUserId(), 
      'language_id' : '1',
    };
    log(body.toString(), name: "body");
    final response = await apiClient.postFormDynamic('chat_list_controller.php', body);

    return ChatListModel.fromJson(json.decode(response));
  }

  @override
  Future<GroupChatListModel> getGroupChatList() async{
    final body = {
      'getGroupListRecentNew' : 'getGroupListRecentNew',
      'society_id' : '1',
      'user_id' : '2', 
      'unit_id' : '1',
      'block_id' : '30',
      'floor_id' : '151',
      'zone_id' : '0',
      'level_id' : '3',
      'user_token' : 'f2uTcR19SjSIuBygfK4TOP%3AAPA91bGbY9nHxA0cDE5lnTL4teMy_Nn4p9tH-Pcfnj1ySZM733nvIleUb5xZ8NUrujp8mS2rll8WcYzE65ms3b46kH9e9T9WAhay1Ta-ofYvHzzBj4PsALbN1ug60aBI_3bUlq8JpL3z',
      'device' : 'android',
      'language_id' : '1',  
    };
    log(body.toString(), name: "body");
    final response = await apiClient.postFormDynamic('chat_list_controller.php', body);

    return GroupChatListModel.fromJson(json.decode(response));
  }

  @override
  Future<MemberChatListModel> getMemberChatList() async{
    final body = {
      'getRecentChatMember' : 'getRecentChatMember',
      'society_id' : '1',
      'unit_id' : '1',
      'group_id' : '',
      'floor_id' : '0',
      'floor_id_access' : '1',
      'block_id' : '1',
      'user_type' : '',
      'user_id' : '1776', 
      'language_id' : '1',
    };
    log(body.toString(), name: "body");
    final response = await apiClient.postFormDynamic('chat_list_controller.php', body);

    return MemberChatListModel.fromJson(json.decode(response));
}
}