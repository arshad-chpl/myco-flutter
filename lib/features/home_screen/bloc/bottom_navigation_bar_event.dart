part of 'bottom_navigation_bar_bloc.dart';

sealed class BottomNavigationBarEvent extends Equatable {
  const BottomNavigationBarEvent();

  @override
  List<Object> get props => [];
}

class ChangeNavigationIndexEvent extends BottomNavigationBarEvent {
  final int index;

  const ChangeNavigationIndexEvent(this.index);

  @override
  List<Object> get props => [index];
}

class ToggleIconEvent extends BottomNavigationBarEvent {
  @override
  List<Object> get props => [];
}
