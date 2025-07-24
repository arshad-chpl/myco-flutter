part of 'member_chat_bloc.dart';

sealed class MemberChatState extends Equatable {
  const MemberChatState();

  @override
  List<Object> get props => [];
}

final class MemberChatInitial extends MemberChatState {}

final class MemberSearchQueryState extends MemberChatState {
  final List filteredListMember;

  const MemberSearchQueryState({required this.filteredListMember});
  @override
  List<Object> get props => [filteredListMember];
}

// Get Member Chat list states

class GetMemberChatListLoadingState extends MemberChatState {}

class GetMemberChatListSuccessState extends MemberChatState {
  final MemberChatListEntity memberChatList;
  const GetMemberChatListSuccessState({required this.memberChatList});
  @override
  List<Object> get props => [memberChatList];
}

class GetMemberChatListErrorState extends MemberChatState {
  final String message;
  const GetMemberChatListErrorState({required this.message});
  @override
  List<Object> get props => [message];
}
