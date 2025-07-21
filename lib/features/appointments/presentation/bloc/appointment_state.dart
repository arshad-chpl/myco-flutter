abstract class AppointmentState {}

class AppointmentInitial extends AppointmentState {}

class AppointmentLoaded extends AppointmentState {
  final int selectIndex;

  AppointmentLoaded({required this.selectIndex});
}



