part of 'member_chat_bloc.dart';

sealed class MemberChatEvent extends Equatable {
  const MemberChatEvent();

  @override
  List<Object> get props => [];
}

class SearchEventMember extends MemberChatEvent {
  final String query;
  // final List chatList;

  const SearchEventMember(
    this.query,
    //  this.chatList
  );

  @override
  List<Object> get props => [
    query,
    // chatList
  ];
}

class GetMemberChatListEvent extends MemberChatEvent {
  @override
  List<Object> get props => [];
}
