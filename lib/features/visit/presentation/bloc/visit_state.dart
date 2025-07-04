abstract class VisitState {}

class VisitTabState extends VisitState {
  final int selectedIndex;
  VisitTabState({required this.selectedIndex});
}
