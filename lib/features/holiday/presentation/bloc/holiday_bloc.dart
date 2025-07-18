import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myco_flutter/features/holiday/domain/use_cases/apply_holiday.dart';
import 'package:myco_flutter/features/holiday/domain/use_cases/delete_holiday.dart';
import 'package:myco_flutter/features/holiday/domain/use_cases/get_holiday_list.dart';
import 'package:myco_flutter/features/holiday/presentation/bloc/holiday_event.dart';
import 'package:myco_flutter/features/holiday/presentation/bloc/holiday_state.dart';

class HolidayBloc extends Bloc<HolidayEvent, HolidayState> {
  final GetHolidayList getHolidayList;
  final ApplyHoliday applyHoliday;
  final DeleteHoliday deleteHoliday;

  HolidayBloc({
    required this.getHolidayList,
    required this.applyHoliday,
    required this.deleteHoliday,
  }) : super(HolidayInitial()) {
    on<FetchHolidayList>(_onFetchHolidayList);
    on<ApplyHolidayEvent>(_onApplyHoliday);
    on<DeleteHolidayEvent>(_onDeleteHoliday);
  }

  Future<void> _onFetchHolidayList(
      FetchHolidayList event,
      Emitter<HolidayState> emit,
      ) async {
    emit(HolidayLoading());
    final result = await getHolidayList(event.year);

    result.fold(
          (failure) => emit(HolidayError(failure.message ?? 'Unexpected error')),
          (response) => emit(HolidayListLoaded(response.holiday ?? [])),
    );
  }

  Future<void> _onApplyHoliday(
      ApplyHolidayEvent event,
      Emitter<HolidayState> emit,
      ) async {
    emit(HolidayLoading());
    final result = await applyHoliday(event.holidayId);

    result.fold(
          (failure) => emit(HolidayError(failure.message ?? 'Apply failed')),
          (response) => emit(HolidayApplied()),
    );
  }

  Future<void> _onDeleteHoliday(
      DeleteHolidayEvent event,
      Emitter<HolidayState> emit,
      ) async {
    emit(HolidayLoading());
    final result = await deleteHoliday(event.holidayAssignId);

    result.fold(
          (failure) => emit(HolidayError(failure.message ?? 'Delete failed')),
          (_) => emit(HolidayDeleted()),
    );
  }
}
