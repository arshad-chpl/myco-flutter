import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:myco_flutter/features/work_allocation/data/models/request/get_work_category_request.dart';
import 'package:myco_flutter/features/work_allocation/domain/usecases/work_allocation_use_case.dart';
import 'package:myco_flutter/features/work_allocation/presentation/bloc/work_allocation_event.dart';
import 'package:myco_flutter/features/work_allocation/presentation/bloc/work_allocation_state.dart';
import 'package:myco_flutter/features/work_allocation/presentation/widgets/employee_details.dart';

class WorkAllocationBloc
    extends Bloc<WorkAllocationEvent, WorkAllocationState> {
  final WorkAllocationUseCase useCase;

  String? _selectedCategory;
  Employee? _selectedEmployee;
  List<Employee> _filteredEmployees = [];
  bool _showEmployeeList = false;

  String? get selectedCategory => _selectedCategory;

  Employee? get selectedEmployee => _selectedEmployee;

  List<Employee> get filteredEmployees => _filteredEmployees;

  bool get showEmployeeList => _showEmployeeList;

  WorkAllocationBloc({required this.useCase}) : super(WorkAllocationInitial()) {
    on<FetchWorkCategoryList>(_onFetchWorkCategoryList);
    on<SelectDynamicWorkCategoryEvent>(_onSelectDynamicCategory);
    on<AddWorkAllocationEvent>(_onAddWorkAllocation);
    on<FilterEmployeesEvent>(_onFilterEmployees);
    on<SelectEmployeeEvent>(_onSelectEmployee);
    on<RemoveSelectedEmployeeEvent>(_onRemoveSelectedEmployee);
    on<FetchWorkAllocationListEvent>(_onFetchWorkAllocationList);
  }

  Future<void> _onFetchWorkCategoryList(
    FetchWorkCategoryList event,
    Emitter<WorkAllocationState> emit,
  ) async {
    emit(WorkAllocationLoading());

    final request = GetWorkCategoryRequest(
      getWorkCategory: 'getWorkCategory',
      companyId: event.companyId,
      languageId: event.languageId,
    );

    log(name: 'data', '$request');
    final result = await useCase.getWorkCategoryList(request);

    log(result.toString(), name: 'BLOC_RESULT');

    result.fold((failure) => emit(WorkAllocationError(failure.message)), (
      response,
    ) {
      final categories = response.workCategory ?? [];
      emit(
        WorkCategoryListLoaded(categories, selectedCategory: _selectedCategory),
      );
    });
  }

  void _onSelectDynamicCategory(
    SelectDynamicWorkCategoryEvent event,
    Emitter<WorkAllocationState> emit,
  ) {
    _selectedCategory = event.selectedCategory;

    // Re-emit the previous category list with updated selection
    final currentState = state;
    if (currentState is WorkCategoryListLoaded) {
      emit(
        WorkCategoryListLoaded(
          currentState.categories,
          selectedCategory: _selectedCategory,
        ),
      );
    } else {
      emit(WorkCategorySelected(event.selectedCategory));
    }
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

  void _onFilterEmployees(
    FilterEmployeesEvent event,
    Emitter<WorkAllocationState> emit,
  ) {
    final query = event.query.toLowerCase();
    final allEmployees = event.allEmployees;

    if (query.isEmpty) {
      _filteredEmployees = [];
      _showEmployeeList = false;
    } else {
      _filteredEmployees = allEmployees
          .where((emp) => emp.name.toLowerCase().contains(query))
          .toList();
      _showEmployeeList = true;
    }

    emit(
      EmployeeFiltered(
        employees: _filteredEmployees,
        showList: _showEmployeeList,
      ),
    );
  }

  void _onSelectEmployee(
    SelectEmployeeEvent event,
    Emitter<WorkAllocationState> emit,
  ) {
    _selectedEmployee = event.employee;
    _showEmployeeList = false;
    emit(EmployeeSelected(event.employee));
  }

  void _onRemoveSelectedEmployee(
    RemoveSelectedEmployeeEvent event,
    Emitter<WorkAllocationState> emit,
  ) {
    _selectedEmployee = null;
    emit(EmployeeDeselected());
  }

  Future<void> _onFetchWorkAllocationList(
    FetchWorkAllocationListEvent event,
    Emitter<WorkAllocationState> emit,
  ) async {
    print('fetching work allocation..........');
    emit(WorkAllocationLoading());

    try {
      final result = await useCase.getPendingWorkAllocations(event.params);
      result.fold((failure) => emit(WorkAllocationError(failure.message)), (
        response,
      ) {
        emit(WorkAllocationList(response));
      });
    } catch (e) {
      print(e.toString());
    }
  }
}
