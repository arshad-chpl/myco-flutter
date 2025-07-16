import 'package:flutter_bloc/flutter_bloc.dart';

import 'work_allocation_event.dart';
import 'work_allocation_state.dart';

class WorkAllocationBloc
    extends Bloc<WorkAllocationEvent, WorkAllocationState> {
  List<String> _dummyData = [];

  WorkAllocationBloc() : super(WorkAllocationInitial()) {
    on<FetchWorkAllocations>((event, emit) async {
      emit(WorkAllocationLoading());
      await Future.delayed(const Duration(seconds: 1)); // simulate loading
      emit(WorkAllocationLoaded(_dummyData));
    });

    on<AddWorkAllocation>((event, emit) async {
      emit(WorkAllocationLoading());
      await Future.delayed(const Duration(milliseconds: 500)); // simulate post
      _dummyData.add("${event.title} - ${event.description}");
      emit(WorkAllocationLoaded(_dummyData));
    });
  }
}
