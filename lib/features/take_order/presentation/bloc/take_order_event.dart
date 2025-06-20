part of 'take_order_bloc.dart';

sealed class TakeOrderEvent extends Equatable {
  const TakeOrderEvent();

  @override
  List<Object> get props => [];
}

class TabChangeEvent extends TakeOrderEvent {
  final int index;

  const TabChangeEvent({required this.index});

  @override
  List<Object> get props => [index];
}
