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
    on<SelectWorkCategoryEvent>(_onSelectWorkCategory);
    on<FetchWorkCategoryList>(_onFetchWorkCategoryList);
    on<AddWorkAllocationEvent>(_onAddWorkAllocation);
    on<FilterEmployeesEvent>(_onFilterEmployees);
    on<SelectEmployeeEvent>(_onSelectEmployee);
    on<RemoveSelectedEmployeeEvent>(_onRemoveSelectedEmployee);
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

  void _onSelectWorkCategory(
    SelectWorkCategoryEvent event,
    Emitter<WorkAllocationState> emit,
  ) {
    _selectedCategory = event.selectedCategory;
    emit(WorkCategorySelected(event.selectedCategory));
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
}
