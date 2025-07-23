import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myco_flutter/features/leave/domain/use_case/leave_use_case.dart';
import 'package:myco_flutter/features/leave/presentation/bloc/leave_event.dart';
import 'package:myco_flutter/features/leave/presentation/bloc/leave_state.dart';

class LeaveBloc extends Bloc<LeaveEvent, LeaveState> {
  final LeaveUseCase leaveUseCase;

  LeaveBloc(this.leaveUseCase) : super(LeaveInitial()) {
    on<FetchNewLeaveListType>((event, emit) async {
      emit(LeaveLoading());

      try {
        final results = await leaveUseCase.getNewListType(event.query);
        results.fold(
          (failure) => emit(LeaveError(failure.message)),
          (leaveType) => emit(LeaveListTypeFetched(leaveType)),
        );
      } catch (e) {
        emit(const LeaveError('Failed to load getNewListType'));
      }
    });

    on<FetchMyTeamLeaveList>((event, emit) async {
      emit(LeaveLoading());
      try {
        final results = await leaveUseCase.getMyTeamLeaves();
        results.fold(
          (failure) => emit(LeaveError(failure.message)),
          (leaveType) => emit(TeamLeaveListFetched(leaveType)),
        );
      } catch (e) {
        emit(const LeaveError('Failed to load getMyTeamLeaves'));
      }
    });

    on<InitialView>((event, emit) async {
      emit(LeaveInitial());
    });

    on<FetchLeaveHistoryNew>((event, emit) async {
      emit(LeaveLoading());
      try {
        final results = await leaveUseCase.getLeaveHistoryNew(
          event.monthName,
          event.year,
        );
        results.fold(
          (failure) => emit(LeaveError(failure.message)),
          (model) => emit(LeaveHistoryNewFetched(model)),
        );
      } catch (e) {
        emit(LeaveError('Failed to load leave history: $e'));
      }
    });

    on<AddShortLeave>((event, emit) async {
      emit(LeaveLoading());
      try {
        final results = await leaveUseCase.addShortLeave(
          event.date,
          event.time,
          event.reason,
        );
        results.fold(
          (failure) => emit(LeaveError(failure.message)),
          (model) => emit(ShortLeaveAdded(model)),
        );
      } catch (e) {
        emit(LeaveError('Failed to add short leave: $e'));
      }
    });

    on<DeleteShortLeave>((event, emit) async {
      emit(LeaveLoading());
      try {
        final results = await leaveUseCase.deleteShortLeave(
          event.shortLeaveId,
          event.shortLeaveDate,
          event.otherUserId,
          event.otherUserName,
        );
        results.fold(
          (failure) => emit(LeaveError(failure.message)),
          (model) => emit(ShortLeaveDeleted(model)),
        );
      } catch (e) {
        emit(LeaveError('Failed to delete short leave: $e'));
      }
    });

    on<LeaveTypesWithData>((event, emit) async {
      emit(LeaveLoading());
      try {
        final results = await leaveUseCase.getLeaveTypesWithData(
          event.unitId,
          event.useId,
          event.userName,
          event.currentYear,
          event.appliedLeaveDate,
        );
        results.fold(
          (failure) => emit(LeaveError(failure.message)),
          (model) => emit(LeaveTypeWithDataFetched(model)),
        );
      } catch (e) {
        emit(LeaveError('Failed to fetch leave types: $e'));
      }
    });
    on<CheckAutoLeaveBalance>((event, emit) async {
      emit(LeaveLoading());
      try {
        final results = await leaveUseCase.getLeaveBalanceForAutoLeave(
          event.userId,
          event.leaveDate,
          event.leaveId,
        );
        results.fold(
          (failure) => emit(LeaveError(failure.message)),
          (model) => emit(CheckAutoLeaveBalanceFetched(model)),
        );
      } catch (e) {
        emit(LeaveError('Failed to fetch leave balance: $e'));
      }
    });

    on<DeleteLeaveRequest>((event, emit) async {
      emit(LeaveLoading());
      try {
        final results = await leaveUseCase.deleteLeaveRequest(event.leaveId);
        results.fold(
          (failure) => emit(LeaveError(failure.message)),
          (model) => emit(LeaveRequestDeleted(model)),
        );
      } catch (e) {
        emit(LeaveError('Failed to delete leave request: $e'));
      }
    });

    on<ChangeAutoLeave>((event, emit) async {
      emit(LeaveLoading());
      try {
        final results = await leaveUseCase.changeAutoLeave(
          event.userId,
          event.paid,
          event.leaveTypeId,
          event.leaveDate,
          event.leaveDay,
          event.extraDay,
          event.isSpecialDay,
          event.attendanceId,
          event.leaveId,
          event.leavePercentage,
        );
        results.fold(
          (failure) => emit(LeaveError(failure.message)),
          (model) => emit(AutoLeaveChanged(model)),
        );
      } catch (e) {
        emit(LeaveError('Failed to change auto leave: $e'));
      }
    });

    on<ChangeSandwichLeave>((event, emit) async {
      emit(LeaveLoading());
      try {
        final results = await leaveUseCase.changeSandwichLeave(
          event.userId,
          event.paid,
          event.leaveId,
          event.leaveName,
          event.sandwichId,
          event.unitId,
          event.userFullName,
          event.leavePercentage,
        );
        results.fold(
          (failure) => emit(LeaveError(failure.message)),
          (model) => emit(SandwichLeaveChanged(model)),
        );
      } catch (e) {
        emit(LeaveError('Failed to change sandwich leave: $e'));
      }
    });
    on<FetchCompOffLeaves>((event, emit) async {
      emit(LeaveLoading());
      try {
        final results = await leaveUseCase.getCompOffLeaves(
          event.starDate,
          event.endDate,
        );
        results.fold(
          (failure) => emit(LeaveError(failure.message)),
          (model) => emit(CompOffLeavesFetched(model)),
        );
      } catch (e) {
        emit(LeaveError('Failed to fetch comp off leaves: $e'));
      }
    });
  }
}
