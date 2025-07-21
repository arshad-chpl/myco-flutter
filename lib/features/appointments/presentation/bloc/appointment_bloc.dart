import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myco_flutter/features/appointments/presentation/bloc/appointment_event.dart';
import 'package:myco_flutter/features/appointments/presentation/bloc/appointment_state.dart';

class AppointmentBloc extends Bloc<AppointmentEvent, AppointmentState> {

  AppointmentBloc() : super(AppointmentInitial()) {
    on<AppointmentTabChange>(tabChange);
  }

  void tabChange (AppointmentTabChange event, Emitter<AppointmentState> emit) {
    emit(AppointmentLoaded(selectIndex: event.tabIndex));
  }

}