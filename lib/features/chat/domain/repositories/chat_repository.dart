import 'package:dartz/dartz.dart';
import 'package:myco_flutter/core/error/failure.dart';
import 'package:myco_flutter/features/chat/domain/entities/chat_list_entities.dart';

abstract class ChatRepository {
  Future<Either<Failure, ChatListEntity>> getChatList();
}