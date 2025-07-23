part of 'bottom_navigation_bar_bloc.dart';

sealed class BottomNavigationBarState extends Equatable {
  final int currentIndex;
  final bool isMenuSelected;
  const BottomNavigationBarState({
    required this.currentIndex,
    required this.isMenuSelected,
  });

  @override
  List<Object> get props => [currentIndex, isMenuSelected];
}

final class BottomNavigationBarInitial extends BottomNavigationBarState {
  const BottomNavigationBarInitial()
    : super(currentIndex: 0, isMenuSelected: false);
}

class ChangeNavigationIndexState extends BottomNavigationBarState {
  const ChangeNavigationIndexState({
    required super.currentIndex,
    required super.isMenuSelected,
  });

  @override
  List<Object> get props => [currentIndex, isMenuSelected];
}

class ToggleIconState extends BottomNavigationBarState {
  const ToggleIconState({
    required super.currentIndex,
    required super.isMenuSelected,
  });
  @override
  List<Object> get props => [currentIndex, isMenuSelected];
}
