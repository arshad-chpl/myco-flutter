import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:myco_flutter/features/chat/domain/entities/chat_list_entities.dart';
import 'package:myco_flutter/features/chat/domain/entities/group_chat_list_entities.dart' ;
import 'package:myco_flutter/features/chat/domain/usecases/get_chat_list.dart';
import 'package:myco_flutter/features/chat/domain/usecases/get_group_chat_list.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatListBloc extends Bloc<ChatListEvent, ChatListState> {
  final GetChatList getChatList;

  List fullList = [];
   final List<Map<String, String>> _selectedDepartments = [];
  ChatListBloc(this.getChatList ) : super(ChatInitial()) {
   on<SearchEvent> (_onSearch); 
  //  on<RemoveAvatar>(onRemove);
  //  on<SelectDepEvent>(onSelectDept);
  //  on<RemoveDepEvent>(onRemoveDep);
   on<GetChatListEvent>(getUserChatList);

  }
  void _onSearch(SearchEvent event, Emitter<ChatListState> emit) {
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




FutureOr<void> getUserChatList(GetChatListEvent event , Emitter<ChatListState> emit)async{
  emit(GetChatListLoadingState());

  final result = await getChatList();

  result.fold((failure) => emit(GetChatListErrorState(message:  failure.message)), (response) { 
    fullList = response.member ?? [];
    emit(GetChatListSuccessState(chatList: response));
    });

}

// FutureOr<void> getMemberGroupChatList(GetGroupChatListEvent event , Emitter<ChatListState> emit)async{
//   emit(GetGroupChatListLoadingState());

//   final result = await getGroupChatList();
//   log(result.toString(), name: "getMemberGroupChatList");
//   result.fold((failure) => emit(GetGroupChatListErrorState(message:  failure.message)), (response) { 
//     fullList = response.member ?? [];
//     emit(GetGroupChatListSuccessState(groupChatList: response));
//     });

// }
// void onRemove(RemoveAvatar event, Emitter<ChatListState> emit){
//    final updatedList = event.avtarList
//    ..removeAt(event.index);
//       emit(RemoveAvatarState(updateAvtarList: updatedList));
    
// }

// void onSelectDept(SelectDepEvent event, Emitter<ChatListState> emit){
 
//   final alreadyExists = _selectedDepartments.any(
//       (d) => d['id'] == event.department['id'],
//     );

//     if (!alreadyExists && event.department['id']!.isNotEmpty) {
//       _selectedDepartments.add(event.department);
//       emit(SelectDepState(selectedDepartments: List.from(_selectedDepartments)));
//     }
// }

// void onRemoveDep(RemoveDepEvent event, Emitter<ChatListState> emit){
//  _selectedDepartments.removeWhere((d) => d['id'] == event.departmentId);
//     emit(SelectDepState(selectedDepartments: List.from(_selectedDepartments)));
// }
}



