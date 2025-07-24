part of 'chat_bloc.dart';

sealed class ChatListState extends Equatable {
  const ChatListState();
  
  @override
  List<Object> get props => [];
}

final class ChatInitial extends ChatListState {}

final class SearchQueryState extends ChatListState {
  final List filteredList;
  
  const SearchQueryState({required this.filteredList});
  @override
  List<Object> get props => [filteredList];
}

final class RemoveAvatarState extends ChatListState{
  final List<Map<String, dynamic>> updateAvtarList;

  const RemoveAvatarState({required this.updateAvtarList});
  @override
  List<Object> get props => [updateAvtarList];
}

final class SelectDepState extends ChatListState {
   final List<Map<String, String>> selectedDepartments;
  const SelectDepState({required this.selectedDepartments});
  @override
  List<Object> get props => [selectedDepartments];
}

// Get Chat list states

class GetChatListLoadingState extends ChatListState {}

class GetChatListSuccessState extends ChatListState {
  final ChatListEntity chatList;
  const GetChatListSuccessState({required this.chatList});
  @override
  List<Object> get props => [chatList];
}

class GetChatListErrorState extends ChatListState {
  final String message;
  const GetChatListErrorState({required this.message});
  @override
  List<Object> get props => [message];
}

// Get Group Chat list states

// class GetGroupChatListLoadingState extends ChatListState {}

// class GetGroupChatListSuccessState extends ChatListState {
//   final GroupChatListEntity groupChatList;
//   const GetGroupChatListSuccessState({required this.groupChatList});
//   @override
//   List<Object> get props => [groupChatList];
// }

// class GetGroupChatListErrorState extends ChatListState {
//   final String message;
//   const GetGroupChatListErrorState({required this.message});
//   @override
//   List<Object> get props => [message];
// }