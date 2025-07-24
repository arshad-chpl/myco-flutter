import 'package:equatable/equatable.dart';
import 'package:photo_manager/photo_manager.dart';
import 'dart:io';

abstract class GalleryPickerState extends Equatable {
  const GalleryPickerState();

  @override
  List<Object> get props => [];
}

class GalleryPickerInitial extends GalleryPickerState {}

class GalleryPickerLoading extends GalleryPickerState {
  const GalleryPickerLoading();
}

class GalleryPickerLoaded extends GalleryPickerState {
  final List<AssetEntity> mediaList;
  final List<AssetEntity> selectedAssets;
  final bool isFetchingMore;
  final int maxSelection;
  final bool hasPermission; // Added to indicate permission status

  const GalleryPickerLoaded({
    required this.mediaList,
    required this.selectedAssets,
    this.isFetchingMore = false,
    required this.maxSelection,
    this.hasPermission = true, // Default to true if loaded
  });

  GalleryPickerLoaded copyWith({
    List<AssetEntity>? mediaList,
    List<AssetEntity>? selectedAssets,
    bool? isFetchingMore,
    int? maxSelection,
    bool? hasPermission,
  }) => GalleryPickerLoaded(
      mediaList: mediaList ?? this.mediaList,
      selectedAssets: selectedAssets ?? this.selectedAssets,
      isFetchingMore: isFetchingMore ?? this.isFetchingMore,
      maxSelection: maxSelection ?? this.maxSelection,
      hasPermission: hasPermission ?? this.hasPermission,
    );

  @override
  List<Object> get props => [mediaList, selectedAssets, isFetchingMore, maxSelection, hasPermission];
}

class GalleryPickerError extends GalleryPickerState {
  final String message;
  const GalleryPickerError(this.message);

  @override
  List<Object> get props => [message];
}

class GalleryPickerSelectionValidated extends GalleryPickerState {
  final List<File> validFiles;
  final List<Map<String, dynamic>> invalidFiles;
  final List<AssetEntity> validAssets;

  const GalleryPickerSelectionValidated({
    required this.validFiles,
    required this.invalidFiles,
    required this.validAssets,
  });

  @override
  List<Object> get props => [validFiles, invalidFiles, validAssets];
}

class GalleryPickerSelectionDone extends GalleryPickerState {
  final List<dynamic> result;
  const GalleryPickerSelectionDone(this.result);

  @override
  List<Object> get props => [result];
}