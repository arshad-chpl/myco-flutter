import 'package:dartz/dartz.dart';
import 'package:myco_flutter/core/error/failure.dart';
import 'package:myco_flutter/features/chat/domain/entities/member_chat_list_entities.dart';
import 'package:myco_flutter/features/chat/domain/repositories/chat_repository.dart';

class GetMemberChatList {
  final MemberChatRepository repository;
  GetMemberChatList(this.repository);

  Future<Either<Failure, MemberChatListEntity>> call() async => await repository.getMemberChatList();
}