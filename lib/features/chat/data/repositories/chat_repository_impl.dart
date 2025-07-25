import 'package:dartz/dartz.dart';
import 'package:myco_flutter/core/error/failure.dart';
import 'package:myco_flutter/core/utils/safe_api_call.dart';
import 'package:myco_flutter/features/chat/data/datasources/chat_datasources.dart';
import 'package:myco_flutter/features/chat/domain/entities/chat_list_entities.dart';
import 'package:myco_flutter/features/chat/domain/entities/group_chat_list_entities.dart';
import 'package:myco_flutter/features/chat/domain/entities/member_chat_list_entities.dart';
import 'package:myco_flutter/features/chat/domain/repositories/chat_repository.dart';

class ChatRepositoryImpl implements ChatRepository{
  final SafeApiCall safeApiCall;
  final ChatDatasources chatDatasources;

  ChatRepositoryImpl(this.safeApiCall, this.chatDatasources);
  @override
  Future<Either<Failure, ChatListEntity>> getChatList() async{
    final result = await safeApiCall.execute(chatDatasources.getChatList);

    return result.map((responseModel) => responseModel.toEntity());


  }
  
}

class GroupChatRepositoryImpl implements GroupChatRepository{
  final SafeApiCall safeApiCall;
  final ChatDatasources chatDatasources;

  GroupChatRepositoryImpl(this.safeApiCall, this.chatDatasources);
  @override
  Future<Either<Failure, GroupChatListEntity>> getGroupChatList() async{
    final result = await safeApiCall.execute(chatDatasources.getGroupChatList);

    return result.map((responseModel) => responseModel.toEntity());
  }
  
}

class MemberChatRepositoryImpl implements MemberChatRepository{
  final SafeApiCall safeApiCall;
  final ChatDatasources chatDatasources;

  MemberChatRepositoryImpl(this.safeApiCall, this.chatDatasources);

  Future<Either<Failure, MemberChatListEntity>> getMemberChatList() async{
    final result = await safeApiCall.execute(chatDatasources.getMemberChatList);

    return result.map((responseModel) => responseModel.toEntity());
  }

}