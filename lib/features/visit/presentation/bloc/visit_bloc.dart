import 'package:flutter_bloc/flutter_bloc.dart';
import 'visit_event.dart';
import 'visit_state.dart';

class VisitBloc extends Bloc<VisitEvent, VisitState> {
  VisitBloc() : super(VisitTabState(selectedIndex: 0)) {
    on<VisitTabChanged>((event, emit) {
      emit(VisitTabState(selectedIndex: event.index));
    });
  }
}
