import 'package:equatable/equatable.dart';
import 'package:photo_manager/photo_manager.dart';

abstract class GalleryPickerEvent extends Equatable {
  const GalleryPickerEvent();

  @override
  List<Object> get props => [];
}

class LoadGallery extends GalleryPickerEvent {
  final bool isInitial;
  const LoadGallery({this.isInitial = true});

  @override
  List<Object> get props => [isInitial];
}

class ToggleAssetSelection extends GalleryPickerEvent {
  final AssetEntity asset;
  const ToggleAssetSelection(this.asset);

  @override
  List<Object> get props => [asset];
}

class ValidateAndSubmitSelection extends GalleryPickerEvent {
  const ValidateAndSubmitSelection();

  @override
  List<Object> get props => [];
}

// New event for when permissions are denied
class GalleryPermissionDenied extends GalleryPickerEvent {
  final String message;
  const GalleryPermissionDenied(this.message);

  @override
  List<Object> get props => [message];
}