import 'package:bloc/bloc.dart';
import 'package:myco_flutter/features/work_allocation/data/models/request/get_work_category_request.dart';
import 'package:myco_flutter/features/work_allocation/domain/usecases/work_allocation_use_case.dart';
import 'package:myco_flutter/features/work_allocation/presentation/bloc/assign_work_event.dart';
import 'package:myco_flutter/features/work_allocation/presentation/bloc/assign_work_state.dart';
import 'package:myco_flutter/features/work_allocation/presentation/widgets/employee_details.dart';

class AssignWorkBloc extends Bloc<AssignWorkEvent, AssignWorkState> {
  final WorkAllocationUseCase useCase;

  String? _selectedCategory;
  Employee? _selectedEmployee;
  List<Employee> _filteredEmployees = [];
  bool _showEmployeeList = false;

  String? get selectedCategory => _selectedCategory;

  Employee? get selectedEmployee => _selectedEmployee;

  List<Employee> get filteredEmployees => _filteredEmployees;

  bool get showEmployeeList => _showEmployeeList;

  AssignWorkBloc({required this.useCase}) : super(AssignWorkInitial()) {
    on<FetchWorkCategoryList>(_onFetchWorkCategoryList);
    on<SelectDynamicWorkCategoryEvent>(_onSelectDynamicCategory);
    on<AddWorkAllocationEvent>(_onAddWorkAllocation);
    on<FilterEmployeesEvent>(_onFilterEmployees);
    on<SelectEmployeeEvent>(_onSelectEmployee);
    on<RemoveSelectedEmployeeEvent>(_onRemoveSelectedEmployee);
    // on<FetchWorkAllocationListEvent>(_onFetchWorkAllocationList);
  }

  Future<void> _onFetchWorkCategoryList(
    FetchWorkCategoryList event,
    Emitter<AssignWorkState> emit,
  ) async {
    emit(AssignWorkLoading());

    final request = GetWorkCategoryRequest(
      getWorkCategory: 'getWorkCategory',
      companyId: event.companyId,
      languageId: event.languageId,
    );

    final result = await useCase.getWorkCategoryList(request);

    result.fold((failure) => emit(AssignWorkError(failure.message)), (
      response,
    ) {
      final categories = response.workCategory ?? [];
      emit(
        AssignWorkListLoaded(categories, selectedCategory: _selectedCategory),
      );
    });
  }

  void _onSelectDynamicCategory(
    SelectDynamicWorkCategoryEvent event,
    Emitter<AssignWorkState> emit,
  ) {
    _selectedCategory = event.selectedCategory;

    // Re-emit the previous category list with updated selection
    final currentState = state;
    if (currentState is AssignWorkListLoaded) {
      emit(
        AssignWorkListLoaded(
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
    Emitter<AssignWorkState> emit,
  ) async {
    emit(AssignWorkLoading());

    final result = await useCase.addWorkAllocation(event.request);

    result.fold(
      (failure) => emit(AssignWorkError(failure.message)),
      (response) => emit(
        AssignWorkSuccess(response.message ?? 'Work Assigned Successfully'),
      ),
    );
  }

  void _onFilterEmployees(
    FilterEmployeesEvent event,
    Emitter<AssignWorkState> emit,
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
    Emitter<AssignWorkState> emit,
  ) {
    _selectedEmployee = event.employee;
    _showEmployeeList = false;
    emit(EmployeeSelected(event.employee));
  }

  void _onRemoveSelectedEmployee(
    RemoveSelectedEmployeeEvent event,
    Emitter<AssignWorkState> emit,
  ) {
    _selectedEmployee = null;
    emit(EmployeeDeselected());
  }

  /*Future<void> _onFetchWorkAllocationList(
    FetchWorkAllocationListEvent event,
    Emitter<AssignWorkState> emit,
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
  }*/
}
