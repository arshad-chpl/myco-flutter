part of 'camera_bloc.dart';

abstract class CameraState {}

class OpeningCamera extends CameraState {}

class LoadingCamera extends CameraState {}

class OpenCamera extends CameraState {
  final CameraController controller;

  OpenCamera({required this.controller});
}

class CameraErrorState extends CameraState {
  final String message;

  CameraErrorState({required this.message});
}
