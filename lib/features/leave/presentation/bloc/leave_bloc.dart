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
        emit(const LeaveError('Failed to load leaveType'));
      }
    });

    on<InitialView>((event, emit) async {
      emit(LeaveInitial());
    });
  }



}