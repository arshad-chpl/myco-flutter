import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'take_order_event.dart';
part 'take_order_state.dart';

class TakeOrderBloc extends Bloc<TakeOrderEvent, TakeOrderState> {
  Timer? _timer;
  Duration _duration = Duration.zero;
  TakeOrderBloc() : super(TakeOrderInitial()) {
    // on<TakeOrderEvent>((event, emit) {
    //   // TODO: implement event handler
    // });
    on<TabChangeEvent>(tabChangeEvent);
    on<StartVisitEvent>(onStart);
    on<StopVisitEvent>(onStop);
    on<RefreshTimerEvent>(onRefresh);
    on<TickEvent>(onTick);
  }

  void tabChangeEvent(TabChangeEvent event, Emitter<TakeOrderState> emit) {
    emit(TabChangeState(selectedIndex: event.index));
  }

  void onStart(StartVisitEvent event, Emitter<TakeOrderState> emit) {
    _timer?.cancel();

    // Reset the Duration
    _duration = Duration.zero;

    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (_) => add(TickEvent()),
    );
    emit(VisitRunning(_duration));
  }

  void onStop(StopVisitEvent event, Emitter<TakeOrderState> emit) {
    _timer?.cancel();
    emit(VisitStopped(_duration));
  }

  void onRefresh(RefreshTimerEvent event, Emitter<TakeOrderState> emit) {}
  void onTick(TickEvent event, Emitter<TakeOrderState> emit) {
    _duration += const Duration(seconds: 1);
    emit(VisitRunning(_duration));
  }
}
