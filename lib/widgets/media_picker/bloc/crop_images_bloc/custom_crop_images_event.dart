part of 'custom_crop_images_bloc.dart';

@immutable
sealed class CustomCropImagesEvent extends Equatable {
  const CustomCropImagesEvent();

  @override
  List<Object?> get props => [];
}

class InitializeCropScreen extends CustomCropImagesEvent {}

class UpdateCurrentIndex extends CustomCropImagesEvent {
  final int index;

  const UpdateCurrentIndex(this.index);

  @override
  List<Object?> get props => [index];
}

class UpdatePendingCropRect extends CustomCropImagesEvent {
  final Rect newRect;

  const UpdatePendingCropRect(this.newRect);

  @override
  List<Object?> get props => [newRect];
}

class ConfirmCrop extends CustomCropImagesEvent {}

class ResetCrop extends CustomCropImagesEvent {}

class ProcessAndSaveChanges extends CustomCropImagesEvent {}

class ApplyAndReturnOriginals extends CustomCropImagesEvent {}

class UpdateCropShape extends CustomCropImagesEvent {
  final CropShape shape;

  const UpdateCropShape(this.shape);

  @override
  List<Object?> get props => [shape];
}

class UpdateAspectRatio extends CustomCropImagesEvent {
  final CropAspectRatio aspectRatio;

  const UpdateAspectRatio(this.aspectRatio);

  @override
  List<Object?> get props => [aspectRatio];
}

class ApplyAspectRatio extends CustomCropImagesEvent {}

class SetImageDisplaySize extends CustomCropImagesEvent {
  final Size size;

  const SetImageDisplaySize(this.size);

  @override
  List<Object?> get props => [size];
}