import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myco_flutter/features/appointments/domain/usecases/appointment_usecase.dart';
import 'package:myco_flutter/features/appointments/presentation/bloc/appointment_event.dart';
import 'package:myco_flutter/features/appointments/presentation/bloc/appointment_state.dart';

class AppointmentBloc extends Bloc<AppointmentEvent, AppointmentState> {
  final AppointmentUseCase useCase;


  AppointmentBloc(this.useCase) : super(const AppointmentInitial()) {

    on<AppointmentTabChange>((event, emit) {
      emit(AppointmentInitial(tabIndex: event.tabIndex));
    });

    on<GetAppointmentEvent>((event, emit) async {
      emit(const AppointmentLoading());
      try {
        final results = await useCase.getAppointment(event.params);
        results.fold(
          (failure) => emit(AppointmentError(failure.message)),
          (leaveType) => emit(AppointmentLoaded(leaveType)),
        );
      } catch (e) {
        emit(const AppointmentError('Failed to load getMyTeamLeaves'));
      }
    });
  }
}
