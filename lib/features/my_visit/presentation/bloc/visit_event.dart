abstract class VisitEvent {}

class VisitTabChanged extends VisitEvent {
  final int index;
  VisitTabChanged({required this.index});
}
