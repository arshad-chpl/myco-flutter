import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'take_order_event.dart';
part 'take_order_state.dart';

class TakeOrderBloc extends Bloc<TakeOrderEvent, TakeOrderState> {
  TakeOrderBloc() : super(TakeOrderInitial()) {
    // on<TakeOrderEvent>((event, emit) {
    //   // TODO: implement event handler
    // });
    on<TabChangeEvent>(tabChangeEvent);
  }

  void tabChangeEvent(TabChangeEvent event, Emitter<TakeOrderState> emit) {
    emit(TabChangeState(selectedIndex: event.index));
  }
}
