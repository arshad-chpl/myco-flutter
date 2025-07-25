import 'dart:async';
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myco_flutter/widgets/media_picker/bloc/gallery_picker_bloc/gallery_picker_event.dart';
import 'package:myco_flutter/widgets/media_picker/bloc/gallery_picker_bloc/gallery_picker_state.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:flutter/material.dart'; // For debugPrint

import 'package:myco_flutter/widgets/media_picker/utils/image_validation_util.dart';

class GalleryPickerBloc extends Bloc<GalleryPickerEvent, GalleryPickerState> {
  List<AssetPathEntity> _albums = [];
  List<AssetEntity> _mediaList = [];
  List<AssetEntity> _selectedAssets = [];
  int _currentPage = 0;
  final int _pageSize = 60;
  bool _isFetchingMore = false;
  int _currentMaxSelection;
  bool _isCropImage;

  GalleryPickerBloc({required int maxSelection, required bool isCropImage})
    : _currentMaxSelection = maxSelection,
      _isCropImage = isCropImage,
      super(GalleryPickerInitial()) {
    on<LoadGallery>(_onLoadGallery);
    on<ToggleAssetSelection>(_onToggleAssetSelection);
    on<ValidateAndSubmitSelection>(_onValidateAndSubmitSelection);
    on<GalleryPermissionDenied>(_onGalleryPermissionDenied);
  }

  Future<void> _onLoadGallery(
    LoadGallery event,
    Emitter<GalleryPickerState> emit,
  ) async {
    if (_isFetchingMore && !event.isInitial) return;

    if (event.isInitial) {
      emit(const GalleryPickerLoading());
      _mediaList.clear();
      _currentPage = 0;
      _selectedAssets.clear();
    } else {
      if (state is GalleryPickerLoaded) {
        emit((state as GalleryPickerLoaded).copyWith(isFetchingMore: true));
      }
    }

    _isFetchingMore = true;

    try {
      if (_albums.isEmpty) {
        _albums = await PhotoManager.getAssetPathList(
          onlyAll: true,
          type: RequestType.image,
        );
      }

      if (_albums.isEmpty) {
        emit(
          GalleryPickerLoaded(
            mediaList: _mediaList,
            selectedAssets: _selectedAssets,
            isFetchingMore: false,
            maxSelection: _currentMaxSelection,
            hasPermission: true,
          ),
        );
        _isFetchingMore = false;
        return;
      }

      final newAssets = await _albums.first.getAssetListPaged(
        page: _currentPage,
        size: _pageSize,
      );

      if (newAssets.isNotEmpty) {
        _mediaList.addAll(newAssets);
        _currentPage++;
      }
    } catch (e) {
      debugPrint('Error loading gallery: $e');
      emit(GalleryPickerError('Failed to load gallery: $e'));
    } finally {
      _isFetchingMore = false;
      emit(
        GalleryPickerLoaded(
          mediaList: List.from(_mediaList),
          selectedAssets: List.from(_selectedAssets),
          isFetchingMore: false,
          maxSelection: _currentMaxSelection,
          hasPermission: true,
        ),
      );
    }
  }

  void _onToggleAssetSelection(
    ToggleAssetSelection event,
    Emitter<GalleryPickerState> emit,
  ) {
    final AssetEntity asset = event.asset;
    final List<AssetEntity> currentSelected = List.from(_selectedAssets);

    if (currentSelected.contains(asset)) {
      currentSelected.remove(asset);
    } else {
      if (currentSelected.length < _currentMaxSelection) {
        currentSelected.add(asset);
      }
    }
    _selectedAssets = currentSelected;

    emit(
      GalleryPickerLoaded(
        mediaList: List.from(_mediaList),
        selectedAssets: List.from(_selectedAssets),
        isFetchingMore: false,
        maxSelection: _currentMaxSelection,
        hasPermission: true,
      ),
    );
  }

  Future<void> _onValidateAndSubmitSelection(
    ValidateAndSubmitSelection event,
    Emitter<GalleryPickerState> emit,
  ) async {
    final List<File> allFiles = [];
    final Map<File, AssetEntity> fileToAsset = {};
    final List<Map<String, dynamic>> nullFileErrors = [];

    for (final asset in _selectedAssets) {
      try {
        final file = await asset.file;
        if (file != null) {
          allFiles.add(file);
          fileToAsset[file] = asset;
        } else {
          nullFileErrors.add({
            'assetId': asset.id,
            'reason': 'File could not be resolved',
          });
        }
      } catch (e) {
        nullFileErrors.add({'assetId': asset.id, 'reason': 'Exception: $e'});
      }
    }

    final validationResult = await ImageValidationUtil.validateAndHandleImages(
      files: allFiles,
    );

    final validFiles = validationResult['validFiles'] as List<File>;
    final invalidFiles =
        validationResult['invalidFiles'] as List<Map<String, dynamic>>;

    invalidFiles.addAll(nullFileErrors);

    final validAssets = validFiles
        .map((f) => fileToAsset[f])
        .whereType<AssetEntity>()
        .toList();

    // Emit validated result (for submission)
    emit(
      GalleryPickerSelectionValidated(
        validFiles: validFiles,
        invalidFiles: invalidFiles,
        validAssets: validAssets,
      ),
    );

    // Re-emit gallery state so the UI still displays images
    emit(
      GalleryPickerLoaded(
        mediaList: List.from(_mediaList),
        selectedAssets: List.from(_selectedAssets),
        isFetchingMore: false,
        maxSelection: _currentMaxSelection,
        hasPermission: true,
      ),
    );
  }

  void _onGalleryPermissionDenied(
    GalleryPermissionDenied event,
    Emitter<GalleryPickerState> emit,
  ) {
    emit(
      GalleryPickerLoaded(
        mediaList: [],
        selectedAssets: [],
        maxSelection: _currentMaxSelection,
        hasPermission: false,
      ),
    );
    emit(GalleryPickerError(event.message));
  }
}
