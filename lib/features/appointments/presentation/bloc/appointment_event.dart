abstract class AppointmentEvent {}

class AppointmentTabChange extends AppointmentEvent {
  final int tabIndex;

  AppointmentTabChange({required this.tabIndex});
}