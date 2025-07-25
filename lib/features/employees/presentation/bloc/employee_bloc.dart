import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:myco_flutter/core/error/failure.dart';
import 'package:myco_flutter/core/services/preference_manager.dart';
import 'package:myco_flutter/features/employees/domain/usecases/get_employees_usecase.dart';
import 'package:myco_flutter/features/employees/domain/usecases/get_user_data_usecase.dart';
import 'package:myco_flutter/features/employees/presentation/bloc/employee_event.dart';
import 'package:myco_flutter/features/employees/presentation/bloc/employee_state.dart';

class EmployeeBloc extends Bloc<EmployeeEvent, EmployeeState> {
  final GetUserDataUseCase getUserData;
  final GetEmployeesUseCase getEmployees;

  final PreferenceManager preferenceManager = GetIt.I<PreferenceManager>();

  bool _hasLoadedOnce = false;

  EmployeeBloc({required this.getUserData, required this.getEmployees})
    : super(EmployeeInitial()) {
    on<LoadUserData>(_onLoadUserData);
    on<ChangeBranch>(_onChangeBranch);
    on<ChangeDepartment>(_onChangeDepartment);
    on<SearchEmployees>(_onSearch);
    on<ToggleEmployeeSelection>(_onToggleEmployeeSelection);
    on<RefreshEmployeeData>(_onRefreshEmployeeData);
  }

  Future<void> _onLoadUserData(
    LoadUserData evt,
    Emitter<EmployeeState> emit,
  ) async {
    emit(EmployeeLoading());

    final userId = await preferenceManager.getUserId() ?? '';
    final societyId = await preferenceManager.getCompanyId() ?? '';

    final result = await getUserData(userId: userId, societyId: societyId);

    result.fold(
      (failure) => emit(EmployeeError(_mapFailureToMessage(failure))),
      (data) {
        _hasLoadedOnce = true;

        final branches = data.value1;
        final departments = data.value2;
        final allEmployees = data.value3;

        final currentUser = allEmployees.firstWhere(
          (e) => e.userId == userId,
          orElse: () => allEmployees.first,
        );

        final userDept = departments.firstWhere(
          (d) => d.floorId == currentUser.floorId,
          orElse: () => departments.first,
        );

        final userBranch = branches.firstWhere(
          (b) => b.blockId == userDept.blockId,
          orElse: () => branches.first,
        );

        final employeesFiltered = allEmployees
            .where(
              (e) =>
                  e.blockId == userDept.blockId &&
                  e.floorId == userDept.floorId,
            )
            .toList();

        emit(
          EmployeeLoaded(
            branches: branches,
            departments: departments,
            employees: employeesFiltered,
            allEmployees: employeesFiltered,
            selectedBranch: userBranch,
            selectedDepartment: userDept,
            selectedEmployeeIds: <String>{},
            searchQuery: '',
          ),
        );
      },
    );
  }

  Future<void> _onChangeBranch(
    ChangeBranch evt,
    Emitter<EmployeeState> emit,
  ) async {
    if (state is EmployeeLoaded) {
      final st = state as EmployeeLoaded;
      emit(EmployeeLoading());

      final userId = await preferenceManager.getUserId() ?? '';
      final societyId = await preferenceManager.getCompanyId() ?? '';

      final newBranch = evt.branch;
      final possibleDepts = st.departments
          .where((d) => d.blockId == newBranch.branchId)
          .toList();

      final newDept = possibleDepts.isNotEmpty ? possibleDepts.first : null;

      final result = await getEmployees.call(
        GetEmployeesParams(
          userId: userId,
          societyId: societyId,
          blockId: newBranch.branchId,
          floorId: newDept?.floorId,
        ),
      );

      result.fold(
        (failure) => emit(EmployeeError(_mapFailureToMessage(failure))),
        (employees) {
          emit(
            EmployeeLoaded(
              branches: st.branches,
              departments: st.departments,
              employees: employees,
              allEmployees: employees,
              selectedBranch: newBranch,
              selectedDepartment: newDept,
              searchQuery: '',
              selectedEmployeeIds: <String>{},
            ),
          );
        },
      );
    }
  }

  Future<void> _onChangeDepartment(
    ChangeDepartment evt,
    Emitter<EmployeeState> emit,
  ) async {
    if (state is EmployeeLoaded) {
      final st = state as EmployeeLoaded;
      emit(EmployeeLoading());

      final userId = await preferenceManager.getUserId() ?? '';
      final societyId = await preferenceManager.getCompanyId() ?? '';

      final newDept = evt.department;

      final result = await getEmployees.call(
        GetEmployeesParams(
          userId: userId,
          societyId: societyId,
          blockId: newDept.branchId,
          floorId: newDept.departmentId,
        ),
      );

      result.fold(
        (failure) => emit(EmployeeError(_mapFailureToMessage(failure))),
        (employees) {
          emit(
            EmployeeLoaded(
              branches: st.branches,
              departments: st.departments,
              employees: employees,
              allEmployees: employees,
              selectedBranch: st.selectedBranch,
              selectedDepartment: newDept,
              searchQuery: '',
              selectedEmployeeIds: <String>{},
            ),
          );
        },
      );
    }
  }

  void _onSearch(SearchEmployees evt, Emitter<EmployeeState> emit) {
    if (state is EmployeeLoaded) {
      final st = state as EmployeeLoaded;
      final query = evt.query.trim().toLowerCase();

      final filteredEmployees = query.isNotEmpty
          ? st.allEmployees.where((e) {
              final name = e.userFullName?.toLowerCase() ?? '';
              final dept = e.designation?.toLowerCase() ?? '';
              return name.contains(query) || dept.contains(query);
            }).toList()
          : st.allEmployees;

      emit(
        EmployeeLoaded(
          branches: st.branches,
          departments: st.departments,
          employees: filteredEmployees,
          allEmployees: st.allEmployees,
          selectedBranch: st.selectedBranch,
          selectedDepartment: st.selectedDepartment,
          searchQuery: evt.query,
          selectedEmployeeIds: st.selectedEmployeeIds,
        ),
      );
    }
  }

  void _onToggleEmployeeSelection(
    ToggleEmployeeSelection evt,
    Emitter<EmployeeState> emit,
  ) {
    if (state is EmployeeLoaded) {
      final st = state as EmployeeLoaded;
      final updatedSelection = Set<String>.from(st.selectedEmployeeIds);

      if (updatedSelection.contains(evt.employeeId)) {
        updatedSelection.remove(evt.employeeId);
      } else {
        updatedSelection.add(evt.employeeId);
      }

      emit(
        EmployeeLoaded(
          branches: st.branches,
          departments: st.departments,
          employees: st.employees,
          allEmployees: st.allEmployees,
          selectedBranch: st.selectedBranch,
          selectedDepartment: st.selectedDepartment,
          searchQuery: st.searchQuery,
          selectedEmployeeIds: updatedSelection,
        ),
      );
    }
  }

  Future<void> _onRefreshEmployeeData(
    RefreshEmployeeData event,
    Emitter<EmployeeState> emit,
  ) async {
    if (state is! EmployeeLoaded) return;

    final st = state as EmployeeLoaded;
    final selectedDept = st.selectedDepartment;
    final selectedBranch = st.selectedBranch;
    final existingQuery = st.searchQuery.trim();

    if (selectedDept == null || selectedBranch == null) {
      emit(EmployeeError('No selected branch or department to refresh.'));
      return;
    }

    emit(EmployeeLoading());

    final userId = await preferenceManager.getUserId() ?? '';
    final societyId = await preferenceManager.getCompanyId() ?? '';

    final result = await getEmployees.call(
      GetEmployeesParams(
        userId: userId,
        societyId: societyId,
        blockId: selectedDept.blockId,
        floorId: selectedDept.floorId,
      ),
    );

    result.fold(
      (failure) => emit(EmployeeError(_mapFailureToMessage(failure))),
      (employees) {
        final filteredEmployees = existingQuery.isNotEmpty
            ? employees.where((e) {
                final name = e.userFullName?.toLowerCase() ?? '';
                final dept = e.designation?.toLowerCase() ?? '';
                return name.contains(existingQuery) ||
                    dept.contains(existingQuery);
              }).toList()
            : employees;

        emit(
          EmployeeLoaded(
            branches: st.branches,
            departments: st.departments,
            employees: filteredEmployees,
            allEmployees: employees,
            selectedBranch: selectedBranch,
            selectedDepartment: selectedDept,
            searchQuery: existingQuery,
            selectedEmployeeIds: <String>{},
          ),
        );
      },
    );
  }

  // Future<void> _onRefreshEmployeeData(
  //   RefreshEmployeeData event,
  //   Emitter<EmployeeState> emit,
  // ) async {
  //   if (state is! EmployeeLoaded) return;
  //
  //   final st = state as EmployeeLoaded;
  //   final selectedDept = st.selectedDepartment;
  //   final selectedBranch = st.selectedBranch;
  //
  //   if (selectedDept == null || selectedBranch == null) {
  //     emit(EmployeeError('No selected branch or department to refresh.'));
  //     return;
  //   }
  //
  //   emit(EmployeeLoading());
  //
  //   final userId = await preferenceManager.getUserId();
  //   final societyId = await preferenceManager.getCompanyId() ?? '';
  //
  //   final result = await getEmployees.call(
  //     GetEmployeesParams(
  //       userId: userId,
  //       societyId: societyId,
  //       blockId: selectedDept.blockId,
  //       floorId: selectedDept.floorId,
  //     ),
  //   );
  //
  //   result.fold(
  //     (failure) => emit(EmployeeError(_mapFailureToMessage(failure))),
  //     (employees) {
  //       emit(
  //         EmployeeLoaded(
  //           branches: st.branches,
  //           departments: st.departments,
  //           employees: employees,
  //           selectedBranch: selectedBranch,
  //           selectedDepartment: selectedDept,
  //           searchQuery: '',
  //           selectedEmployeeIds: <String>{},
  //         ),
  //       );
  //     },
  //   );
  // }

  String _mapFailureToMessage(Failure failure) {
    if (failure is ServerFailure) return 'Server error: ${failure.message}';
    if (failure is NetworkFailure) return 'No internet connection.';
    if (failure is CacheFailure) return 'No cached data available.';
    return 'Unexpected error occurred.';
  }
}
