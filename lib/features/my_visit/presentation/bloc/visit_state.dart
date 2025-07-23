part of 'visit_bloc.dart';

abstract class VisitState {}
class VisitInitial extends VisitState {}
class VisitLoading extends VisitState {}
class VisitLoaded extends VisitState {
  final CameraController? controller;
  final String dateTime;
  final String scanningState;
  final String remainingTime;
  final double progress;
  final List<String> branchTags;
  final List<String> departmentTags;
  VisitLoaded({
    this.controller,
    required this.dateTime,
    required this.scanningState,
    required this.remainingTime,
    required this.progress,
    this.branchTags = const [],
    this.departmentTags = const [],
  });
  VisitLoaded copyWith({
    CameraController? controller,
    String? dateTime,
    String? scanningState,
    String? remainingTime,
    double? progress,
    List<String>? branchTags,
    List<String>? departmentTags,
  }) => VisitLoaded(
      controller: controller ?? this.controller,
      dateTime: dateTime ?? this.dateTime,
      scanningState: scanningState ?? this.scanningState,
      remainingTime: remainingTime ?? this.remainingTime,
      progress: progress ?? this.progress,
      branchTags: branchTags ?? this.branchTags,
      departmentTags: departmentTags ?? this.departmentTags,
    );
}
class VisitError extends VisitState {
  final String message;
  VisitError({required this.message});
}
