part of 'chat_bloc.dart';

sealed class ChatState extends Equatable {
  const ChatState();
  
  @override
  List<Object> get props => [];
}

final class ChatInitial extends ChatState {}

final class SearchQueryState extends ChatState {
  final List filteredList;
  const SearchQueryState({required this.filteredList});
  @override
  List<Object> get props => [filteredList];
}

final class RemoveAvatarState extends ChatState{
  final List<Map<String, dynamic>> updateAvtarList;

  const RemoveAvatarState({required this.updateAvtarList});
  @override
  List<Object> get props => [updateAvtarList];
}

final class SelectDepState extends ChatState {
   final List<Map<String, String>> selectedDepartments;
  const SelectDepState({required this.selectedDepartments});
  @override
  List<Object> get props => [selectedDepartments];
}