part of 'chat_bloc.dart';

sealed class ChatEvent extends Equatable {
  const ChatEvent();

  @override
  List<Object> get props => [];
}

class SearchEvent extends ChatEvent {
  final String query;
  final List chatList;

  const SearchEvent(this.query, this.chatList);

  @override
  List<Object> get props => [query,chatList];
}

class RemoveAvatar extends ChatEvent {
  final List<Map<String, dynamic>> avtarList;
  final int index;

  const RemoveAvatar(this.avtarList , this.index);
  @override
  List<Object> get props => [avtarList , index];
  
}