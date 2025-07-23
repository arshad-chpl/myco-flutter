import 'package:bloc/bloc.dart';
import 'package:myco_flutter/features/work_allocation/data/models/request/get_work_category_request.dart';
import 'package:myco_flutter/features/work_allocation/domain/usecases/work_allocation_use_case.dart';
import 'package:myco_flutter/features/work_allocation/presentation/bloc/work_allocation_event.dart';
import 'package:myco_flutter/features/work_allocation/presentation/bloc/work_allocation_state.dart';

class WorkAllocationBloc
    extends Bloc<WorkAllocationEvent, WorkAllocationState> {
  final WorkAllocationUseCase useCase;

  WorkAllocationBloc({required this.useCase}) : super(WorkAllocationInitial()) {
    on<FetchWorkCategoryList>(_onFetchWorkCategoryList);
    on<AddWorkAllocationEvent>(_onAddWorkAllocation);
  }

  Future<void> _onFetchWorkCategoryList(
    FetchWorkCategoryList event,
    Emitter<WorkAllocationState> emit,
  ) async {
    emit(WorkAllocationLoading());

    final request = GetWorkCategoryRequest(
      companyId: event.companyId,
      getWorkCategory: event.getWorkCategory,
      languageId: event.languageId,
    );

    final result = await useCase.getWorkCategoryList(request);

    result.fold(
      (failure) => emit(WorkAllocationError(failure.message)),
      (response) => emit(WorkCategoryListLoaded(response.workCategory ?? [])),
    );
  }

  Future<void> _onAddWorkAllocation(
    AddWorkAllocationEvent event,
    Emitter<WorkAllocationState> emit,
  ) async {
    emit(WorkAllocationLoading());

    final result = await useCase.addWorkAllocation(event.request);

    result.fold(
      (failure) => emit(WorkAllocationError(failure.message)),
      (response) => emit(
        WorkAllocationSuccess(response.message ?? 'Work Assigned Successfully'),
      ),
    );
  }
}
