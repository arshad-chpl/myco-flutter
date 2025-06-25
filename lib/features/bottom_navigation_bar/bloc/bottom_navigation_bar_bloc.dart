import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'bottom_navigation_bar_event.dart';
part 'bottom_navigation_bar_state.dart';

class BottomNavigationBarBloc
    extends Bloc<BottomNavigationBarEvent, BottomNavigationBarState> {
      
  BottomNavigationBarBloc() : super(BottomNavigationBarInitial()) {
    on<ChangeNavigationIndexEvent>(changeNavigationIndex);
    on<ToggleIconEvent>(toggleIconEvent);
  }

  FutureOr<void> changeNavigationIndex(
    ChangeNavigationIndexEvent event,
    Emitter<BottomNavigationBarState> emit,
  ) {
    emit(
      ChangeNavigationIndexState(
        currentIndex: event.index,
        isMenuSelected: state.isMenuSelected,
      ),
    );
  }

  FutureOr<void> toggleIconEvent(
    ToggleIconEvent event,
    Emitter<BottomNavigationBarState> emit,
  ) {
    emit(
      ToggleIconState(
        currentIndex: state.currentIndex,
        isMenuSelected: !state.isMenuSelected,
      ),
    );
  }
}
