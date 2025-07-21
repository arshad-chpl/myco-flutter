import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myco_flutter/features/work_allocation/domain/usecases/work_allocation_use_case.dart';

import 'work_allocation_event.dart';
import 'work_allocation_state.dart';

class WorkAllocationBloc
    extends Bloc<WorkAllocationEvent, WorkAllocationState> {
  final WorkAllocationUseCase workAllocationUseCase;
  List<String> _dummyData = [];

  WorkAllocationBloc({required this.workAllocationUseCase})
    : super(WorkAllocationInitial()) {
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
