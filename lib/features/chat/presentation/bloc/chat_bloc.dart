import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:myco_flutter/features/chat/domain/entities/chat_list_entities.dart';
import 'package:myco_flutter/features/chat/domain/usecases/get_chat_list.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final GetChatList getChatList;
  List<MemberEntity> fullList = [];
   final List<Map<String, String>> _selectedDepartments = [];
  ChatBloc(this.getChatList) : super(ChatInitial()) {
   on<SearchEvent> (_onSearch); 
   on<RemoveAvatar>(onRemove);
   on<SelectDepEvent>(onSelectDept);
   on<RemoveDepEvent>(onRemoveDep);
   on<GetChatListEvent>(getMemberChatList);
  }
  void _onSearch(SearchEvent event, Emitter<ChatState> emit) {
  final query = event.query.trim().toLowerCase();
  log(fullList.toString(), name: "fullList in _onSearch");
  log(fullList.length.toString(), name: "fullList in _onSearch_length");
  if (query.isEmpty) {
    emit(SearchQueryState(filteredList: fullList));
  } else {
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

    emit(SearchQueryState(filteredList: filtered));
  }
}


void onRemove(RemoveAvatar event, Emitter<ChatState> emit){
   final updatedList = event.avtarList
   ..removeAt(event.index);
      emit(RemoveAvatarState(updateAvtarList: updatedList));
    
}

void onSelectDept(SelectDepEvent event, Emitter<ChatState> emit){
 
  final alreadyExists = _selectedDepartments.any(
      (d) => d['id'] == event.department['id'],
    );

    if (!alreadyExists && event.department['id']!.isNotEmpty) {
      _selectedDepartments.add(event.department);
      emit(SelectDepState(selectedDepartments: List.from(_selectedDepartments)));
    }
}

void onRemoveDep(RemoveDepEvent event, Emitter<ChatState> emit){
 _selectedDepartments.removeWhere((d) => d['id'] == event.departmentId);
    emit(SelectDepState(selectedDepartments: List.from(_selectedDepartments)));
}

FutureOr<void> getMemberChatList(GetChatListEvent event , Emitter<ChatState> emit)async{
  emit(GetChatListLoadingState());

  final result = await getChatList();

  result.fold((failure) => emit(GetChatListErrorState(message:  failure.message)), (response) { 
    fullList = response.member ?? [];
    emit(GetChatListSuccessState(chatList: response));
    });

}
}
