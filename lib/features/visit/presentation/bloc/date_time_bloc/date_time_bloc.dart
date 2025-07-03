import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

part 'date_time_event.dart';
part 'date_time_state.dart';

class DateTimeBLoc extends Bloc<DateTimeEvent, DateTimeState> {
  Timer? timer;

  DateTimeBLoc() : super(DateTimeInitial()) {
    on<StartDateTime>(onStartDateTime);
    on<UpdateDateTime>(onUpdateDateTime);
  }

  void onStartDateTime(StartDateTime event, Emitter<DateTimeState> emit) {
    timer?.cancel();

    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      final now = DateTime.now();
      final formattedDateAndTime = DateFormat('d-MM-yyyy h:mm:ss a').format(now);
      add(UpdateDateTime(formattedDateAndTime: formattedDateAndTime));
    },);
  }

  void onUpdateDateTime(UpdateDateTime event, Emitter<DateTimeState> emit) {
    emit(DateTimeUpdated(dateTime: event.formattedDateAndTime));
  }

}