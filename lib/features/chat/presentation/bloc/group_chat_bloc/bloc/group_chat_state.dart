part of 'group_chat_bloc.dart';

sealed class GroupChatState extends Equatable {
  const GroupChatState();
  
  @override
  List<Object> get props => [];
}

final class GroupChatInitial extends GroupChatState {}

final class GroupSearchQueryState extends GroupChatState {
  final List filteredListGroup;
  
  const GroupSearchQueryState({required this.filteredListGroup});
  @override
  List<Object> get props => [filteredListGroup];
}




// Get Group Chat list states

class GetGroupChatListLoadingState extends GroupChatState {}

class GetGroupChatListSuccessState extends GroupChatState {
  final GroupChatListEntity groupChatList;
  const GetGroupChatListSuccessState({required this.groupChatList});
  @override
  List<Object> get props => [groupChatList];
}
class GetGroupChatListErrorState extends GroupChatState {
  final String message;
  const GetGroupChatListErrorState({required this.message});
  @override
  List<Object> get props => [message];
}