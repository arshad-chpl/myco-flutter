import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:myco_flutter/features/chat/domain/entities/group_chat_list_entities.dart';
import 'package:myco_flutter/features/chat/domain/usecases/get_group_chat_list.dart';

part 'group_chat_event.dart';
part 'group_chat_state.dart';

class GroupChatBloc extends Bloc<GroupChatEvent, GroupChatState> {
  final GetGroupChatList getGroupChatList;
  List fullList = [];
   GroupChatBloc(this.getGroupChatList ) : super(GroupChatInitial()){

      // TODO: implement event handler
      on<SearchEventGroup>(_onSearchGroup);
      on<GetGroupChatListEvent>(getGroupChat);

  }
  void _onSearchGroup(SearchEventGroup event, Emitter<GroupChatState> emit) {
    final query = event.query.trim().toLowerCase();
    log(fullList.toString(), name: "fullList in _onSearch");
    log(fullList.length.toString(), name: "fullList in _onSearch_length");
    if (query.isEmpty) {
      emit(GroupSearchQueryState(filteredListGroup: fullList));
    } else {
      // Prioritize startsWith
      final startsWithResults = fullList
          .where(
            (item) =>
                item.topicName?.toLowerCase().startsWith(query) ?? false,
          )
          .toList();

      log(startsWithResults.toString(), name: "startsWithResults in _onSearch");
      // Fallback contains (excluding already matched items)
      final containsResults = fullList
          .where(
            (item) =>
                !(item.userFullName?.toLowerCase().startsWith(query) ??
                    false) &&
                (item.userFullName?.toLowerCase().contains(query) ?? false),
          )
          .toList();

      // Combine both
      final filtered = [...startsWithResults, ...containsResults];

      emit(GroupSearchQueryState(filteredListGroup: filtered));
    }
  }

  FutureOr<void> getGroupChat(
    GetGroupChatListEvent event,
    Emitter<GroupChatState> emit,
  ) async {
    emit(GetGroupChatListLoadingState());

    final result = await getGroupChatList();
    log(result.toString(), name: "getMemberGroupChatList");
    result.fold(
      (failure) => emit(GetGroupChatListErrorState(message: failure.message)),
      (response) {
        fullList = response.member ?? [];
        emit(GetGroupChatListSuccessState(groupChatList: response));
      },
    );
  }
}
