
import 'package:equatable/equatable.dart';


sealed class ListIdeaEvent extends Equatable {
 const ListIdeaEvent();

 @override
 List<Object?> get props => [];
}

class IdeaTabChangeEvent extends ListIdeaEvent{
  final int index;
 
  IdeaTabChangeEvent({required this.index});
  @override
  List<Object?> get props => [index];
}