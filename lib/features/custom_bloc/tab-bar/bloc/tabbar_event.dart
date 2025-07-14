part of 'tabbar_bloc.dart';

sealed class TabbarEvent extends Equatable {
  const TabbarEvent();

  @override
  List<Object> get props => [];
}

class TabChangeEvent extends TabbarEvent {
  final int index;

  const TabChangeEvent({required this.index});

  @override
  List<Object> get props => [index];
}
