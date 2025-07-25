import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';

part 'custom_crop_images_event.dart';

part 'custom_crop_images_state.dart';

// Extensions from original file
extension ColorExtension on Color {
  Color withValues({int? red, int? green, int? blue, double? alpha}) =>
      Color.fromARGB(
        (alpha == null ? this.alpha : (255 * alpha).round()).clamp(0, 255),
        red ?? this.red,
        green ?? this.green,
        blue ?? this.blue,
      );
}

extension RectExtension on Rect {
  Rect normalize() => Rect.fromLTRB(
    min(left, right),
    min(top, bottom),
    max(left, right),
    max(top, bottom),
  );
}

enum CropShape { rectangle, circle }

class CropAspectRatio extends Equatable {
  final String label;
  final double? value;
  final IconData icon;

  const CropAspectRatio({required this.label, required this.icon, this.value});

  @override
  List<Object?> get props => [label, value, icon];
}

class CustomCropImagesBloc
    extends Bloc<CustomCropImagesEvent, CustomCropImagesState> {
  final List<AssetEntity> assets;
  final GlobalKey imageContainerKey;
  static const double minCropSize = 50.0;
  static const double _fixedAspectRatioScaleFactor = 0.8;
  final Map<int, ValueNotifier<Rect>> cropRectNotifiers = {};


  static const List<CropAspectRatio> _aspectRatios = [
    CropAspectRatio(label: 'Free', icon: Icons.crop_free),
    CropAspectRatio(label: '1:1', icon: Icons.crop_square, value: 1.0),
    CropAspectRatio(label: '4:3', icon: Icons.crop_landscape, value: 4.0 / 3.0),
    CropAspectRatio(label: '3:4', icon: Icons.crop_portrait, value: 3.0 / 4.0),
    CropAspectRatio(label: '16:9', icon: Icons.crop_16_9, value: 16.0 / 9.0),
    CropAspectRatio(label: '9:16', icon: Icons.crop_7_5, value: 9.0 / 16.0),
  ];

  CustomCropImagesBloc({required this.assets, required this.imageContainerKey})
    : super(
        CustomCropImagesState(
          assets: assets,
          currentIndex: 0,
          pendingCropRects: {},
          croppedRects: {},
          cropShapes: {},
          cropAspectRatios: {},
          aspectRatios: _aspectRatios,
          selectedAspectRatio: _aspectRatios.first,
          selectedShape: CropShape.rectangle,
          isGlobalAspectRatioActive: false,
          globalFixedAspectRatio: null,
          imageDisplaySize: null,
          isLoading: false,
        ),
      ) {
    on<InitializeCropScreen>(_onInitializeCropScreen);
    on<UpdateCurrentIndex>(_onUpdateCurrentIndex);
    on<UpdatePendingCropRect>(_onUpdatePendingCropRect);
    on<ConfirmCrop>(_onConfirmCrop);
    on<ResetCrop>(_onResetCrop);
    on<ProcessAndSaveChanges>(_onProcessAndSaveChanges);
    on<ApplyAndReturnOriginals>(_onApplyAndReturnOriginals);
    on<UpdateCropShape>(_onUpdateCropShape);
    on<UpdateAspectRatio>(_onUpdateAspectRatio);
    on<SetImageDisplaySize>(_onSetImageDisplaySize);
    on<ApplyAspectRatio>(_onApplyAspectRatio);
  }

  Size? get _imageDisplaySize {
    final RenderBox? renderBox =
        imageContainerKey.currentContext?.findRenderObject() as RenderBox?;
    return renderBox?.size;
  }

  void _onInitializeCropScreen(
      InitializeCropScreen event,
      Emitter<CustomCropImagesState> emit,
      ) {
    final size = _imageDisplaySize;
    if (size == null || size.width == 0 || size.height == 0) {
      debugPrint('Warning: _imageDisplaySize is null or empty.');
      return;
    }

    final cropShapes = Map<int, CropShape>.from(state.cropShapes);
    cropShapes.putIfAbsent(state.currentIndex, () => CropShape.rectangle);

    final cropAspectRatios = Map<int, CropAspectRatio>.from(state.cropAspectRatios);
    CropAspectRatio selectedAspectRatio;

    if (state.isGlobalAspectRatioActive && state.globalFixedAspectRatio != null) {
      cropAspectRatios[state.currentIndex] = state.globalFixedAspectRatio!;
      selectedAspectRatio = state.globalFixedAspectRatio!;
    } else {
      cropAspectRatios[state.currentIndex] = _aspectRatios.first;
      selectedAspectRatio = _aspectRatios.first;
    }

    final centerRect = Rect.fromCenter(
      center: size.center(Offset.zero),
      width: size.width * 0.8,
      height: size.height * 0.8,
    );

    final pendingCropRects = Map<int, Rect>.from(state.pendingCropRects);
    pendingCropRects.putIfAbsent(state.currentIndex, () => centerRect);

    // Init ValueNotifier
    cropRectNotifiers[state.currentIndex] =
        ValueNotifier<Rect>(pendingCropRects[state.currentIndex]!);

    emit(
      state.copyWith(
        cropShapes: cropShapes,
        selectedShape: cropShapes[state.currentIndex],
        cropAspectRatios: cropAspectRatios,
        selectedAspectRatio: selectedAspectRatio,
        pendingCropRects: pendingCropRects,
        imageDisplaySize: size,
      ),
    );
    add(ApplyAspectRatio());
  }


  void _onUpdateCurrentIndex(
    UpdateCurrentIndex event,
    Emitter<CustomCropImagesState> emit,
  ) {
    final newIndex = event.index;

    CropAspectRatio selectedAspectRatio;
    if (state.isGlobalAspectRatioActive &&
        state.globalFixedAspectRatio != null) {
      selectedAspectRatio = state.globalFixedAspectRatio!;
      final cropAspectRatios = Map<int, CropAspectRatio>.from(
        state.cropAspectRatios,
      );
      cropAspectRatios[newIndex] = state.globalFixedAspectRatio!;
      emit(state.copyWith(cropAspectRatios: cropAspectRatios));
    } else {
      selectedAspectRatio =
          state.cropAspectRatios[newIndex] ?? _aspectRatios.first;
    }

    final selectedShape = state.cropShapes[newIndex] ?? CropShape.rectangle;

    emit(
      state.copyWith(
        currentIndex: newIndex,
        selectedAspectRatio: selectedAspectRatio,
        selectedShape: selectedShape,
      ),
    );
    add(InitializeCropScreen());
  }

  void _onUpdatePendingCropRect(
    UpdatePendingCropRect event,
    Emitter<CustomCropImagesState> emit,
  ) {
    final updatedRects = Map<int, Rect>.from(state.pendingCropRects);
    updatedRects[state.currentIndex] = event.newRect;
    emit(state.copyWith(pendingCropRects: updatedRects));
  }

  void _onConfirmCrop(ConfirmCrop event, Emitter<CustomCropImagesState> emit) {
    final croppedRects = Map<int, Rect>.from(state.croppedRects);
    if (state.pendingCropRects.containsKey(state.currentIndex)) {
      croppedRects[state.currentIndex] =
          state.pendingCropRects[state.currentIndex]!;
    }
    final cropShapes = Map<int, CropShape>.from(state.cropShapes);
    cropShapes[state.currentIndex] = state.selectedShape;
    final cropAspectRatios = Map<int, CropAspectRatio>.from(
      state.cropAspectRatios,
    );
    cropAspectRatios[state.currentIndex] = state.selectedAspectRatio;

    emit(
      state.copyWith(
        croppedRects: croppedRects,
        cropShapes: cropShapes,
        cropAspectRatios: cropAspectRatios,
      ),
    );
  }

  void _onResetCrop(ResetCrop event, Emitter<CustomCropImagesState> emit) {
    final pendingCropRects = Map<int, Rect>.from(state.pendingCropRects)
      ..remove(state.currentIndex);
    final croppedRects = Map<int, Rect>.from(state.croppedRects)
      ..remove(state.currentIndex);
    final cropShapes = Map<int, CropShape>.from(state.cropShapes)
      ..remove(state.currentIndex);
    final cropAspectRatios = Map<int, CropAspectRatio>.from(
      state.cropAspectRatios,
    )..remove(state.currentIndex);

    CropShape selectedShape = CropShape.rectangle;
    CropAspectRatio selectedAspectRatio;
    bool isGlobalAspectRatioActive = state.isGlobalAspectRatioActive;
    CropAspectRatio? globalFixedAspectRatio = state.globalFixedAspectRatio;

    if (isGlobalAspectRatioActive && globalFixedAspectRatio != null) {
      selectedAspectRatio = globalFixedAspectRatio;
      cropAspectRatios[state.currentIndex] = globalFixedAspectRatio;
    } else {
      selectedAspectRatio = _aspectRatios.first;
      cropAspectRatios[state.currentIndex] = _aspectRatios.first;
      isGlobalAspectRatioActive = false;
      globalFixedAspectRatio = null;
    }

    emit(
      state.copyWith(
        pendingCropRects: pendingCropRects,
        croppedRects: croppedRects,
        cropShapes: cropShapes,
        cropAspectRatios: cropAspectRatios,
        selectedShape: selectedShape,
        selectedAspectRatio: selectedAspectRatio,
        isGlobalAspectRatioActive: isGlobalAspectRatioActive,
        globalFixedAspectRatio: globalFixedAspectRatio,
      ),
    );
    add(InitializeCropScreen());
  }

  Future<void> _onProcessAndSaveChanges(
    ProcessAndSaveChanges event,
    Emitter<CustomCropImagesState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));

    final List<File> finalFiles = [];

    for (int i = 0; i < state.assets.length; i++) {
      final originalAsset = state.assets[i];
      final File? originalFile = await originalAsset.file;
      if (originalFile == null) continue;

      final Rect? cropRectFromUI = state.croppedRects[i];
      final CropShape cropShape = state.cropShapes[i] ?? CropShape.rectangle;

      if (cropRectFromUI == null) {
        finalFiles.add(originalFile);
        continue;
      }

      try {
        final bytes = await originalFile.readAsBytes();
        final codec = await ui.instantiateImageCodec(bytes);
        final ui.Image originalImage = (await codec.getNextFrame()).image;

        final Size originalImageNaturalSize = Size(
          originalImage.width.toDouble(),
          originalImage.height.toDouble(),
        );
        final ui.Image imageToCropFrom = originalImage;

        final Size imageToCropFromSize = Size(
          imageToCropFrom.width.toDouble(),
          imageToCropFrom.height.toDouble(),
        );

        Rect finalCropSourceRect;

        final displayAreaSize = state.imageDisplaySize!;
        final fittedBoxResult = applyBoxFit(
          BoxFit.contain,
          originalImageNaturalSize,
          displayAreaSize,
        );
        final Rect displayedImageRectInUI = Alignment.center.inscribe(
          fittedBoxResult.destination,
          Rect.fromLTWH(0, 0, displayAreaSize.width, displayAreaSize.height),
        );

        final double scaleX =
            imageToCropFromSize.width / displayedImageRectInUI.width;
        final double scaleY =
            imageToCropFromSize.height / displayedImageRectInUI.height;

        final double translatedCropLeft =
            (cropRectFromUI.left - displayedImageRectInUI.left);
        final double translatedCropTop =
            (cropRectFromUI.top - displayedImageRectInUI.top);

        finalCropSourceRect = Rect.fromLTWH(
          translatedCropLeft * scaleX,
          translatedCropTop * scaleY,
          cropRectFromUI.width * scaleX,
          cropRectFromUI.height * scaleY,
        );

        finalCropSourceRect = finalCropSourceRect.intersect(
          Rect.fromLTWH(
            0,
            0,
            imageToCropFromSize.width,
            imageToCropFromSize.height,
          ),
        );

        final ui.PictureRecorder finalRecorder = ui.PictureRecorder();
        final Canvas finalCanvas = Canvas(finalRecorder);
        final Paint paint = Paint()..isAntiAlias = true;

        final outputRect = Rect.fromLTWH(
          0,
          0,
          finalCropSourceRect.width,
          finalCropSourceRect.height,
        );

        if (cropShape == CropShape.circle) {
          finalCanvas.clipPath(Path()..addOval(outputRect));
        }

        finalCanvas.drawImageRect(
          imageToCropFrom,
          finalCropSourceRect,
          outputRect,
          paint,
        );

        final ui.Picture finalPicture = finalRecorder.endRecording();
        final ui.Image croppedImage = await finalPicture.toImage(
          outputRect.width.toInt(),
          outputRect.height.toInt(),
        );
        final ByteData? byteData = await croppedImage.toByteData(
          format: ui.ImageByteFormat.png,
        );

        imageToCropFrom.dispose();

        if (byteData == null) {
          finalFiles.add(originalFile);
          continue;
        }

        final tempDir = Directory.systemTemp;
        final file = File(
          '${tempDir.path}/cropped_${DateTime.now().millisecondsSinceEpoch}.png',
        );
        await file.writeAsBytes(byteData.buffer.asUint8List());
        finalFiles.add(file);
      } catch (e) {
        debugPrint('Error processing image at index $i: $e');
        finalFiles.add(originalFile);
      }
    }

    emit(state.copyWith(isLoading: false, processedFiles: finalFiles));
  }

  Future<void> _onApplyAndReturnOriginals(
    ApplyAndReturnOriginals event,
    Emitter<CustomCropImagesState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    final originalFiles = await Future.wait(state.assets.map((e) => e.file));
    emit(
      state.copyWith(
        isLoading: false,
        processedFiles: originalFiles.whereType<File>().toList(),
      ),
    );
  }

  void _onUpdateCropShape(
    UpdateCropShape event,
    Emitter<CustomCropImagesState> emit,
  ) {
    final CropShape newShape = event.shape;
    final cropShapes = Map<int, CropShape>.from(state.cropShapes);
    cropShapes[state.currentIndex] = newShape;

    bool isGlobalAspectRatioActive = state.isGlobalAspectRatioActive;
    CropAspectRatio? globalFixedAspectRatio = state.globalFixedAspectRatio;
    CropAspectRatio selectedAspectRatio = state.selectedAspectRatio;
    final cropAspectRatios = Map<int, CropAspectRatio>.from(
      state.cropAspectRatios,
    );

    if (newShape == CropShape.circle) {
      final oneToOneRatio = _aspectRatios.firstWhere(
        (ratio) => ratio.label == '1:1',
        orElse: () => _aspectRatios.first,
      );
      isGlobalAspectRatioActive = true;
      globalFixedAspectRatio = oneToOneRatio;

      for (int i = 0; i < state.assets.length; i++) {
        cropAspectRatios[i] = oneToOneRatio;
      }
      selectedAspectRatio = oneToOneRatio;
    } else {
      if (globalFixedAspectRatio != null) {
        isGlobalAspectRatioActive = true;
      } else {
        isGlobalAspectRatioActive = false;
        globalFixedAspectRatio = null;
        cropAspectRatios.putIfAbsent(
          state.currentIndex,
          () => _aspectRatios.first,
        );
        selectedAspectRatio = _aspectRatios.first;
      }
    }

    emit(
      state.copyWith(
        selectedShape: newShape,
        cropShapes: cropShapes,
        isGlobalAspectRatioActive: isGlobalAspectRatioActive,
        globalFixedAspectRatio: globalFixedAspectRatio,
        cropAspectRatios: cropAspectRatios,
        selectedAspectRatio: selectedAspectRatio,
      ),
    );
    add(ApplyAspectRatio());
  }

  void _onUpdateAspectRatio(
    UpdateAspectRatio event,
    Emitter<CustomCropImagesState> emit,
  ) {
    final CropAspectRatio ratio = event.aspectRatio;

    bool isGlobalAspectRatioActive = state.isGlobalAspectRatioActive;
    CropAspectRatio? globalFixedAspectRatio = state.globalFixedAspectRatio;
    final cropAspectRatios = Map<int, CropAspectRatio>.from(
      state.cropAspectRatios,
    );
    CropAspectRatio selectedAspectRatio = state.selectedAspectRatio;

    if (ratio.value == null) {
      isGlobalAspectRatioActive = false;
      globalFixedAspectRatio = null;
      cropAspectRatios[state.currentIndex] = ratio;
    } else {
      isGlobalAspectRatioActive = true;
      globalFixedAspectRatio = ratio;
      for (int i = 0; i < state.assets.length; i++) {
        cropAspectRatios[i] = ratio;
      }
    }
    selectedAspectRatio = ratio;

    emit(
      state.copyWith(
        isGlobalAspectRatioActive: isGlobalAspectRatioActive,
        globalFixedAspectRatio: globalFixedAspectRatio,
        selectedAspectRatio: selectedAspectRatio,
        cropAspectRatios: cropAspectRatios,
      ),
    );
    add(ApplyAspectRatio());
  }

  void _onApplyAspectRatio(
    ApplyAspectRatio event,
    Emitter<CustomCropImagesState> emit,
  ) {
    CropAspectRatio effectiveAspectRatio;
    if (state.isGlobalAspectRatioActive &&
        state.globalFixedAspectRatio != null) {
      effectiveAspectRatio = state.globalFixedAspectRatio!;
    } else {
      effectiveAspectRatio =
          state.cropAspectRatios[state.currentIndex] ?? _aspectRatios.first;
    }

    if (state.imageDisplaySize == null || state.imageDisplaySize!.isEmpty) {
      debugPrint(
        'Warning: _imageDisplaySize is null or empty, cannot apply aspect ratio.',
      );
      return;
    }

    final pendingCropRects = Map<int, Rect>.from(state.pendingCropRects);
    final size = state.imageDisplaySize!;

    final ratio = effectiveAspectRatio.value;
    if (ratio == null) {
      final Rect? currentRect = pendingCropRects[state.currentIndex];
      if (currentRect != null) {
        final double clampedLeft = currentRect.left.clamp(
          0.0,
          size.width - currentRect.width,
        );
        final double clampedTop = currentRect.top.clamp(
          0.0,
          size.height - currentRect.height,
        );
        pendingCropRects[state.currentIndex] = Rect.fromLTWH(
          clampedLeft,
          clampedTop,
          currentRect.width,
          currentRect.height,
        );
      } else {
        pendingCropRects[state.currentIndex] = Rect.fromCenter(
          center: size.center(Offset.zero),
          width: size.width * 0.8,
          height: size.height * 0.8,
        );
      }
    } else {
      double calculatedWidth = size.width;
      double calculatedHeight = calculatedWidth / ratio;

      if (calculatedHeight > size.height) {
        calculatedHeight = size.height;
        calculatedWidth = calculatedHeight * ratio;
      }

      double finalWidth = calculatedWidth * _fixedAspectRatioScaleFactor;
      double finalHeight = calculatedHeight * _fixedAspectRatioScaleFactor;

      finalWidth = max(CustomCropImagesBloc.minCropSize, finalWidth);
      finalHeight = max(CustomCropImagesBloc.minCropSize, finalHeight);

      pendingCropRects[state.currentIndex] = Rect.fromCenter(
        center: size.center(Offset.zero),
        width: finalWidth,
        height: finalHeight,
      );
    }
    emit(
      state.copyWith(
        pendingCropRects: pendingCropRects,
        selectedAspectRatio: effectiveAspectRatio,
      ),
    );
  }

  Future<Uint8List?> getImagePreview(int index) async => state.assets[index]
      .thumbnailDataWithSize(const ThumbnailSize(1080, 1080));

  void _onSetImageDisplaySize(
    SetImageDisplaySize event,
    Emitter<CustomCropImagesState> emit,
  ) {
    if (state.imageDisplaySize == null) {
      emit(state.copyWith(imageDisplaySize: event.size));
      add(InitializeCropScreen());
    }
  }
}
