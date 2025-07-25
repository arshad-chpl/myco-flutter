import 'package:dartz/dartz.dart';
import 'package:myco_flutter/core/error/failure.dart';
import 'package:myco_flutter/features/chat/domain/entities/chat_list_entities.dart';
import 'package:myco_flutter/features/chat/domain/entities/group_chat_list_entities.dart';
import 'package:myco_flutter/features/chat/domain/entities/member_chat_list_entities.dart';

abstract class ChatRepository {
  Future<Either<Failure, ChatListEntity>> getChatList();
}

abstract class GroupChatRepository {
  Future<Either<Failure, GroupChatListEntity>> getGroupChatList();
}

abstract class MemberChatRepository {
  Future<Either<Failure, MemberChatListEntity>> getMemberChatList();
}