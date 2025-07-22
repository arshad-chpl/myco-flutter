import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc() : super(ChatInitial()) {
   on<SearchEvent> (_onSearch); 
   on<RemoveAvatar>(onRemove);
  }
  void _onSearch(SearchEvent event, Emitter<ChatState> emit) {
  final query = event.query.trim().toLowerCase();

  if (query.isEmpty) {
    emit(SearchQueryState(filteredList: event.chatList));
  } else {
    // Prioritize startsWith
    final startsWithResults = event.chatList
        .where((item) =>
            item['name']?.toLowerCase().startsWith(query) ?? false)
        .toList();

    // Fallback contains (excluding already matched items)
    final containsResults = event.chatList
        .where((item) =>
            !(item['name']?.toLowerCase().startsWith(query) ?? false) &&
            (item['name']?.toLowerCase().contains(query) ?? false))
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

}

