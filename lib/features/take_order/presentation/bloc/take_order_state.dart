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

final class VisitRunning extends TakeOrderState {
  final Duration duration;

  const VisitRunning(this.duration);

  @override
  List<Object> get props => [duration];
}

final class VisitStopped extends TakeOrderState {
  final Duration duration;

  const VisitStopped(this.duration);

  @override
  List<Object> get props => [duration];
}
