import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'visit_event.dart';
part 'visit_state.dart';

class VisitBloc extends Bloc<VisitEvent, VisitState> {
  VisitBloc() : super(VisitInitial()) {
    on<VisitEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
