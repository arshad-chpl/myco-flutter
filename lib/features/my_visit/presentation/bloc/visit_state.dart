part of 'visit_bloc.dart';

abstract class VisitState {}
class VisitInitial extends VisitState {}
class VisitLoading extends VisitState {}
class VisitLoaded extends VisitState {
  final CameraController? cameracontroller;
  final String dateTime;
  final String scanningState;
  final String remainingTime;
  final double progress;
  final List<String> branchTags;
  final List<String> departmentTags;
  final int selectedIndex;
  final DateTime selectedDate;
  VisitLoaded({
    this.cameracontroller,
    required this.dateTime,
    required this.scanningState,
    required this.remainingTime,
    required this.progress,
    this.branchTags = const [],
    this.departmentTags = const [],
    this.selectedIndex = 0,
    DateTime? selectedDate,
  }): selectedDate = selectedDate ?? DateTime.now();
  VisitLoaded copyWith({
    CameraController? controller,
    String? dateTime,
    String? scanningState,
    String? remainingTime,
    double? progress,
    List<String>? branchTags,
    List<String>? departmentTags,
    int ? selectedIndex,
    DateTime? selectedDate,
  }) => VisitLoaded(
      cameracontroller: controller ?? this.cameracontroller,
      dateTime: dateTime ?? this.dateTime,
      scanningState: scanningState ?? this.scanningState,
      remainingTime: remainingTime ?? this.remainingTime,
      progress: progress ?? this.progress,
      branchTags: branchTags ?? this.branchTags,
      departmentTags: departmentTags ?? this.departmentTags,
    selectedIndex: selectedIndex ?? this.selectedIndex,
    selectedDate: selectedDate ?? this.selectedDate
    );
}
class VisitError extends VisitState {
  final String message;
  VisitError({required this.message});
}
