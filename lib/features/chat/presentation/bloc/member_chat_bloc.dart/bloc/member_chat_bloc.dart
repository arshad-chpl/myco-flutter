import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:myco_flutter/core/error/failure.dart';
import 'package:myco_flutter/features/chat/domain/entities/member_chat_list_entities.dart';
import 'package:myco_flutter/features/chat/domain/usecases/grt_member_chat_list.dart';

part 'member_chat_event.dart';
part 'member_chat_state.dart';

class MemberChatBloc extends Bloc<MemberChatEvent, MemberChatState> {
  final GetMemberChatList getMemberChatList;
  List fullList = [];
  MemberChatBloc(this.getMemberChatList) : super(MemberChatInitial()) {
    on<SearchEventMember>(_onSearchEventMember);
    on<GetMemberChatListEvent> (_getMemberChatList);
  }

  void _onSearchEventMember(SearchEventMember event, Emitter<MemberChatState> emit) {
    final query = event.query.trim().toLowerCase();
    if (query.isEmpty) {
      emit(MemberSearchQueryState(filteredListMember: fullList));
    }
    else {
    // Prioritize startsWith
    final startsWithResults = fullList
        .where((item) =>
            item.userFullName?.toLowerCase().startsWith(query) ?? false)
        .toList();

log(startsWithResults.toString(), name: "startsWithResults in _onSearch");
    // Fallback contains (excluding already matched items)
    final containsResults = fullList
        .where((item) =>
            !(item.userFullName?.toLowerCase().startsWith(query) ?? false) &&
            (item.userFullName?.toLowerCase().contains(query) ?? false))
        .toList();

    // Combine both
    final filtered = [...startsWithResults, ...containsResults];

    emit(MemberSearchQueryState(filteredListMember: filtered));
  }
  }

  FutureOr<void> _getMemberChatList(GetMemberChatListEvent event , Emitter<MemberChatState> emit)async{
    emit(GetMemberChatListLoadingState());

    final result = await getMemberChatList();
    log(result.toString(), name: "getMemberChatList");
    result.fold((failure) => emit(GetMemberChatListErrorState(message:  failure.message)), (response) { 
      fullList = response.member ?? [];
      emit(GetMemberChatListSuccessState(memberChatList: response));});

}
}