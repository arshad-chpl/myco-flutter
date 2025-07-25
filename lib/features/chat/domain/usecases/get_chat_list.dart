import 'package:dartz/dartz.dart';
import 'package:myco_flutter/core/error/failure.dart';
import 'package:myco_flutter/features/chat/domain/entities/chat_list_entities.dart';
import 'package:myco_flutter/features/chat/domain/repositories/chat_repository.dart';

class GetChatList {
  final ChatRepository repository;
  GetChatList(this.repository);

  Future<Either<Failure, ChatListEntity>> call() async => await repository.getChatList();
}