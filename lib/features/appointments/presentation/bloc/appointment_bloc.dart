import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myco_flutter/features/appointments/domain/usecases/appointment_usecase.dart';
import 'package:myco_flutter/features/appointments/presentation/bloc/appointment_event.dart';
import 'package:myco_flutter/features/appointments/presentation/bloc/appointment_state.dart';

class AppointmentBloc extends Bloc<AppointmentEvent, AppointmentState> {
  final AppointmentUseCase useCase;

  AppointmentBloc(this.useCase) : super(const AppointmentInitial()) {

    on<AppointmentTabChange>((event, emit) {
      emit(state.copyWith(tabIndex: event.tabIndex));
    });

    on<GetAppointmentEvent>((event, emit) async {
      emit(AppointmentLoading(tabIndex: state.tabIndex));
      try {
        final result = await useCase.getAppointment(event.params);
        result.fold(
              (failure) => emit(AppointmentError(failure.message, tabIndex:  state.tabIndex)),
              (getAppointment) => emit(AppointmentLoaded(getAppointment, tabIndex: state.tabIndex)),
        );
      } catch (e) {
        emit(AppointmentError('Failed to load getAppointment', tabIndex: state.tabIndex));
      }
    });


    on<GetMyAppointmentEvent>((event, emit) async {
      emit(AppointmentLoading(tabIndex: state.tabIndex));
      try {
        final result = await useCase.getMyAppointment(event.params);
        result.fold(
              (failure) {
            print('GetMyAppointmentEvent failed in Bloc: ${failure.message}');
            emit(AppointmentError(failure.message,  tabIndex: state.tabIndex));
          },
              (getMyAppointment) {
            print('GetMyAppointmentEvent successful in Bloc. Entity myAppointments count received: ${getMyAppointment.myAppointments?.length ?? 0}'); // <--- CRITICAL PRINT
            emit(AppointmentLoaded(getMyAppointment,  tabIndex: state.tabIndex),);
          },
        );
      } catch (e) {
        emit(AppointmentError('Failed to load getMyAppointment', tabIndex: state.tabIndex));
      }
    });

    on<ApprovedAppointmentEvent>((event, emit) async {
      emit(AppointmentLoading(tabIndex: state.tabIndex));
      try {
        final result = await useCase.approvedAppointment(event.params);
        result.fold(
          (failure) => emit(AppointmentError(failure.message, tabIndex: state.tabIndex)),
          (approvedAppointment) {
            emit(CommonResponseAppointment(approvedAppointment, tabIndex: state.tabIndex));
          },
        );
      } catch (e) {
        emit(AppointmentError('Failed to load approved appointment', tabIndex: state.tabIndex));
      }
    });

    on<RejectAppointmentEvent>((event, emit) async {
      emit(AppointmentLoading(tabIndex: state.tabIndex));
      try {
        final result = await useCase.rejectAppointment(event.params);
        result.fold(
              (failure) => emit(AppointmentError(failure.message, tabIndex: state.tabIndex)),
              (approvedAppointment) {
                emit(CommonResponseAppointment(approvedAppointment, tabIndex: state.tabIndex));
              }
        );
      } catch (e) {
        emit(AppointmentError('Failed to load approved appointment', tabIndex: state.tabIndex));
      }
    });
  }
}
