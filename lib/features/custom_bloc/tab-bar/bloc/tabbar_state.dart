part of 'tabbar_bloc.dart';

sealed class TabbarState extends Equatable {
  const TabbarState();

  @override
  List<Object> get props => [];
}

final class TabbarInitial extends TabbarState {}

class TabChangeState extends TabbarState {
  final int selectedIndex;

  const TabChangeState({required this.selectedIndex});

  @override
  List<Object> get props => [selectedIndex];
}
