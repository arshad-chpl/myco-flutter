import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myco_flutter/features/my_visit/presentation/bloc/visit_event.dart';
import 'package:myco_flutter/features/my_visit/presentation/bloc/visit_state.dart';

class VisitBloc extends Bloc<VisitEvent, VisitState> {
  VisitBloc() : super(VisitTabState(selectedIndex: 0)) {
    on<VisitTabChanged>((event, emit) {
      emit(VisitTabState(selectedIndex: event.index));
    });
  }
}
