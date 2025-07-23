import 'package:myco_flutter/features/chat/data/models/chat_list_model.dart';

abstract class ChatDatasources {
  Future<ChatListModel> getChatList();
}