part of 'face_detection_bloc.dart';

abstract class FaceDetectionEvent {}

class LaunchCamera extends FaceDetectionEvent {}

class StartDateTime extends FaceDetectionEvent {}

class UpdateDateTime extends FaceDetectionEvent {
  final String formattedDateAndTime;

  UpdateDateTime({required this.formattedDateAndTime});
}

class UpdateScanningState extends FaceDetectionEvent {
  final String scanningState;

  UpdateScanningState({required this.scanningState});
}

class StartScanningTimer extends FaceDetectionEvent {}

class UpdateProgress extends FaceDetectionEvent {
  final double progress;
  final String remainingTime;

  UpdateProgress({required this.progress, required this.remainingTime});
}