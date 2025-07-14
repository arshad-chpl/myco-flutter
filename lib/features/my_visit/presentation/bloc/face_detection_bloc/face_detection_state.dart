part of 'face_detection_bloc.dart';

abstract class FaceDetectionState {}

class FaceDetectionInitial extends FaceDetectionState {}

class FaceDetectionLoading extends FaceDetectionState {}

class FaceDetectionLoaded extends FaceDetectionState {
  final CameraController controller;
  final String dateTime;
  final String scanningState;
  final String remainingTime;
  final double progress;

  FaceDetectionLoaded({
    required this.controller,
    required this.dateTime,
    required this.scanningState,
    required this.remainingTime,
    required this.progress
  });

  FaceDetectionLoaded copyWith({
    CameraController? controller,
    String? scanningState,
    String? dateTime,
    String? remainingTime,
    double? progress,
  }) => FaceDetectionLoaded(
      controller: controller ?? this.controller,
      scanningState: scanningState ?? this.scanningState,
      dateTime: dateTime ?? this.dateTime,
      remainingTime: remainingTime ?? this.remainingTime,
      progress: progress ?? this.progress,
    );
}

class FaceDetectionError extends FaceDetectionState {
  final String message;

  FaceDetectionError({required this.message});
}