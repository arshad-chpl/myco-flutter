import 'package:myco_flutter/features/chat/data/models/chat_list_model.dart';
import 'package:myco_flutter/features/chat/data/models/group_chat_list_model.dart';
import 'package:myco_flutter/features/chat/data/models/member_chat_list_model.dart';

abstract class ChatDatasources {
  Future<ChatListModel> getChatList();
  Future<GroupChatListModel> getGroupChatList();
  Future<MemberChatListModel> getMemberChatList();
}