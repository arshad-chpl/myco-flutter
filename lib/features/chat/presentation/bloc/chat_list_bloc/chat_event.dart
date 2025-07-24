part of 'chat_bloc.dart';

sealed class ChatListEvent extends Equatable {
  const ChatListEvent();

  @override
  List<Object> get props => [];
}

class SearchEvent extends ChatListEvent {
  final String query;
  // final List chatList;

  const SearchEvent(this.query,
  //  this.chatList
   );

  @override
  List<Object> get props => [query,
  // chatList
  ];
}

class RemoveAvatar extends ChatListEvent {
  final List<Map<String, dynamic>> avtarList;
  final int index;

  const RemoveAvatar(this.avtarList , this.index);
  @override
  List<Object> get props => [avtarList , index];
  
}

class SelectDepEvent extends ChatListEvent {
  final Map<String, String> department;
  const SelectDepEvent(this.department);
  @override
  List<Object> get props => [department];
}

class RemoveDepEvent extends ChatListEvent {
  final String departmentId;
  const RemoveDepEvent(this.departmentId);
  @override
  List<Object> get props => [departmentId];
}

class GetChatListEvent extends ChatListEvent {
  @override
  List<Object> get props => [];
}

// class GetGroupChatListEvent extends ChatListEvent {
//   @override
//   List<Object> get props => [];
// }