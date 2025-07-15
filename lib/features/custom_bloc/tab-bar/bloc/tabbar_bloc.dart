import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'tabbar_event.dart';
part 'tabbar_state.dart';

class TabbarBloc extends Bloc<TabbarEvent, TabbarState> {
  TabbarBloc() : super(TabbarInitial()) {
    on<TabChangeEvent>(tabChangeEvent);
  }
}

void tabChangeEvent(TabChangeEvent event, Emitter<TabbarState> emit) {
  emit(TabChangeState(selectedIndex: event.index));
}
