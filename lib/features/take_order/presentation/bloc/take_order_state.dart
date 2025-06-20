part of 'take_order_bloc.dart';

sealed class TakeOrderState extends Equatable {
  const TakeOrderState();

  @override
  List<Object> get props => [];
}

final class TakeOrderInitial extends TakeOrderState {}

class TabChangeState extends TakeOrderState {
  final int selectedIndex;

  const TabChangeState({required this.selectedIndex});

  @override
  List<Object> get props => [selectedIndex];
}
