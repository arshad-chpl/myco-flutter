import 'package:equatable/equatable.dart';

sealed class ListIdeaState extends Equatable {
  const ListIdeaState();

  @override
  List<Object?> get props => [];
}

class IdeaBoxInitialState extends ListIdeaState{}

class IdeaTabChangeState extends ListIdeaState {
  final int selectedIndex;

  const IdeaTabChangeState({required this.selectedIndex});

  @override
  List<Object?> get props => [selectedIndex];
}
