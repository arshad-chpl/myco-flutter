import 'dart:math';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/widgets/custom_loader.dart';
import 'package:myco_flutter/widgets/custom_text.dart';
import 'package:myco_flutter/widgets/media_picker/bloc/crop_images_bloc/custom_crop_images_bloc.dart';
import 'package:photo_manager/photo_manager.dart';

class CustomCropImageScreen extends StatefulWidget {
  final List<AssetEntity> assets;

  const CustomCropImageScreen({required this.assets, super.key});

  @override
  State<CustomCropImageScreen> createState() => _CustomCropImageScreenState();
}

class _CustomCropImageScreenState extends State<CustomCropImageScreen> {
  final GlobalKey _imageContainerKey = GlobalKey();
  late CustomCropImagesBloc _cropBloc;
  final ValueNotifier<Rect?> _liveCropRect = ValueNotifier<Rect?>(null);

  @override
  void initState() {
    super.initState();
    _cropBloc = CustomCropImagesBloc(
      assets: widget.assets,
      imageContainerKey: _imageContainerKey,
    );
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _cropBloc.add(
        SetImageDisplaySize(_imageContainerKey.currentContext!.size!),
      );
    });
  }

  @override
  void dispose() {
    _cropBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => BlocProvider<CustomCropImagesBloc>(
    create: (context) => _cropBloc,
    child: Scaffold(
      backgroundColor: AppColors.black.withValues(alpha: 0.2),
      appBar: _buildAppBar(context),
      body: _buildBody(context),
    ),
  );

  PreferredSizeWidget _buildAppBar(BuildContext context) => AppBar(
    backgroundColor: AppTheme.getColor(context).primary,
    foregroundColor: AppTheme.getColor(context).onPrimary,
    elevation: 0,
    title: CustomText(
      'Edit & Crop',
      color: AppTheme.getColor(context).onPrimary,
      fontWeight: FontWeight.w700,
    ),
    centerTitle: true,
    actions: [
      BlocBuilder<CustomCropImagesBloc, CustomCropImagesState>(
        builder: (context, state) => IconButton(
          icon: const Icon(Icons.done_all),
          onPressed: () =>
              _showConfirmDialog(context, state.croppedRects.isNotEmpty),
        ),
      ),
    ],
  );

  Widget _buildBody(BuildContext context) =>
      BlocConsumer<CustomCropImagesBloc, CustomCropImagesState>(
        listener: (context, state) {
          if (state.isLoading) {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (BuildContext context) =>
                  const Center(child: CustomLoader()),
            );
          } else if (!state.isLoading && state.processedFiles != null) {
            Navigator.pop(context); // Pop the loader
            Navigator.pop(
              context,
              state.processedFiles,
            ); // Pop the screen with results
          }
        },
        builder: (context, state) => Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            _buildMainImageViewer(context, state),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  final rect = _liveCropRect.value;
                  if (rect != null) {
                    _cropBloc.add(UpdatePendingCropRect(rect));
                    _cropBloc.add(ConfirmCrop());
                  }
                },
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(
                    AppTheme.getColor(context).primary,
                  ),
                  foregroundColor: WidgetStatePropertyAll(
                    AppTheme.getColor(context).onPrimary,
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.crop,
                      color: AppTheme.getColor(context).onPrimary,
                    ),
                    const SizedBox(width: 5),
                    CustomText(
                      'apply',
                      isKey: true,
                      color: AppTheme.getColor(context).onPrimary,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
              ),
            ),
            _buildEditingToolbar(context, state),
            _buildThumbnailList(context, state),
          ],
        ),
      );

  Widget _buildMainImageViewer(
    BuildContext context,
    CustomCropImagesState state,
  ) => Expanded(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        key: _imageContainerKey,
        alignment: Alignment.center,
        child: FutureBuilder<Uint8List?>(
          future: _cropBloc.getImagePreview(state.currentIndex),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: CustomLoader());
            }
            final imageData = snapshot.data!;

            if (state.imageDisplaySize == null ||
                state.imageDisplaySize!.isEmpty) {
              return Image.memory(imageData, fit: BoxFit.contain);
            }

            return RepaintBoundary(
              key: ValueKey(state.currentIndex),
              child: ResizableCropArea(
                imageData: imageData,
                initialRect:
                    state.pendingCropRects[state.currentIndex] ??
                    Rect.fromCenter(
                      center: state.imageDisplaySize!.center(Offset.zero),
                      width: state.imageDisplaySize!.width * 0.8,
                      height: state.imageDisplaySize!.height * 0.8,
                    ),
                onRectChanged: (newRect) {
                  _liveCropRect.value = newRect;
                },
                aspectRatio: state.selectedAspectRatio,
                shape: state.selectedShape,
                parentSize: state.imageDisplaySize,
                minCropSize: CustomCropImagesBloc.minCropSize,
              ),
            );
          },
        ),
      ),
    ),
  );

  Widget _buildEditingToolbar(
    BuildContext context,
    CustomCropImagesState state,
  ) => ClipRRect(
    borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
    child: BackdropFilter(
      filter: ui.ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
      child: Container(
        decoration: BoxDecoration(
          color: AppTheme.getColor(context).primary.withValues(alpha: 0.7),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildToolbarButton(
                    icon: Icons.refresh,
                    label: 'resetNew',
                    onPressed: () => _cropBloc.add(ResetCrop()),
                  ),
                  _buildShapeButton(
                    context,
                    icon: Icons.rectangle_outlined,
                    shape: CropShape.rectangle,
                    isSelected: state.selectedShape == CropShape.rectangle,
                  ),
                  _buildShapeButton(
                    context,
                    icon: Icons.circle_outlined,
                    shape: CropShape.circle,
                    isSelected: state.selectedShape == CropShape.circle,
                  ),
                ],
              ),
            ),
            Divider(
              height: 1,
              color: AppTheme.getColor(
                context,
              ).onPrimary.withValues(alpha: 0.5),
            ),
            if (state.selectedShape == CropShape.rectangle)
              SizedBox(
                height: 60,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: state.aspectRatios.length,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemBuilder: (context, index) {
                    final ratio = state.aspectRatios[index];
                    final isSelected =
                        (state.isGlobalAspectRatioActive &&
                            state.globalFixedAspectRatio == ratio) ||
                        (!state.isGlobalAspectRatioActive &&
                            state.selectedAspectRatio == ratio);
                    return GestureDetector(
                      onTap: () => _cropBloc.add(UpdateAspectRatio(ratio)),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              ratio.icon,
                              color: isSelected
                                  ? AppTheme.getColor(context).onPrimary
                                  : AppTheme.getColor(
                                      context,
                                    ).onPrimary.withValues(alpha: 0.7),
                            ),
                            const SizedBox(height: 4),
                            CustomText(
                              ratio.label,
                              fontSize:
                                  12 * Responsive.getResponsiveText(context),
                              color: isSelected
                                  ? AppTheme.getColor(context).onPrimary
                                  : AppTheme.getColor(
                                      context,
                                    ).onPrimary.withValues(alpha: 0.7),
                              fontWeight: isSelected
                                  ? FontWeight.w700
                                  : FontWeight.w400,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    ),
  );

  Widget _buildToolbarButton({
    required IconData icon,
    required String label,
    required VoidCallback onPressed,
  }) => InkWell(
    onTap: onPressed,
    borderRadius: BorderRadius.circular(8),
    highlightColor: AppTheme.getColor(context).primary.withValues(alpha: 0.3),
    splashColor: AppTheme.getColor(context).primary.withValues(alpha: 0.5),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: AppColors.secondary, size: 24),
          const SizedBox(height: 4),
          CustomText(
            label,
            isKey: true,
            color: AppColors.secondary,
            fontSize: 12 * Responsive.getResponsiveText(context),
            fontWeight: FontWeight.w500,
          ),
        ],
      ),
    ),
  );

  Widget _buildShapeButton(
    BuildContext context, {
    required IconData icon,
    required CropShape shape,
    required bool isSelected,
  }) => InkWell(
    onTap: () => _cropBloc.add(UpdateCropShape(shape)),
    borderRadius: BorderRadius.circular(8),
    highlightColor: AppTheme.getColor(context).primary.withValues(alpha: 0.3),
    splashColor: AppTheme.getColor(context).primary.withValues(alpha: 0.5),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 24,
            color: isSelected
                ? AppTheme.getColor(context).onPrimary
                : AppTheme.getColor(context).onPrimary.withValues(alpha: 0.3),
          ),
          const SizedBox(height: 4),
          CustomText(
            shape.toString().split('.').last.capitalize(),
            fontSize: 12 * Responsive.getResponsiveText(context),
            fontWeight: FontWeight.w500,
            color: isSelected
                ? AppTheme.getColor(context).onPrimary
                : AppTheme.getColor(context).onPrimary.withValues(alpha: 0.3),
          ),
        ],
      ),
    ),
  );

  Widget _buildThumbnailList(
    BuildContext context,
    CustomCropImagesState state,
  ) => Container(
    height: .09 * Responsive.getHeight(context),
    padding: EdgeInsets.symmetric(
      vertical: 0.020 * Responsive.getWidth(context),
    ),
    color: AppColors.black.withValues(alpha: 0.5),
    child: ListView.separated(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.symmetric(
        horizontal: 0.016 * Responsive.getHeight(context),
      ),
      itemCount: state.assets.length,
      separatorBuilder: (_, __) =>
          SizedBox(width: 0.012 * Responsive.getWidth(context)),
      itemBuilder: (context, index) {
        final isSelected = index == state.currentIndex;
        final isEdited = state.croppedRects.containsKey(index);
        final hasChanges = isEdited;

        return GestureDetector(
          onTap: () => _cropBloc.add(UpdateCurrentIndex(index)),
          child: AspectRatio(
            aspectRatio: 1,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: isSelected
                      ? AppTheme.getColor(context).onPrimary
                      : Colors.transparent,
                  width: 2,
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(9),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    FutureBuilder<Uint8List?>(
                      future: state.assets[index].thumbnailDataWithSize(
                        const ThumbnailSize(200, 200),
                      ),
                      builder: (context, snapshot) => snapshot.hasData
                          ? Image.memory(snapshot.data!, fit: BoxFit.cover)
                          : Container(
                              color: AppTheme.getColor(context).secondary,
                            ),
                    ),
                    if (hasChanges)
                      Positioned(
                        top: 4,
                        right: 4,
                        child: Container(
                          padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            color: AppTheme.getColor(context).primary,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.edit,
                            size: 12,
                            color: AppTheme.getColor(context).onPrimary,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    ),
  );

  void _showConfirmDialog(BuildContext context, bool hasAnyCrop) {
    if (!hasAnyCrop) {
      _cropBloc.add(ApplyAndReturnOriginals());
      return;
    }
    showDialog<bool>(
      context: context,
      builder: (BuildContext dialogContext) => AlertDialog(
        backgroundColor: AppTheme.getColor(context).onPrimary,
        title: CustomText(
          'Apply Changes',
          color: AppTheme.getColor(context).primary,
          fontWeight: FontWeight.w700,
        ),
        content: const CustomText(
          'Do you want to save the changes made to these images?',
          color: AppColors.black,
          fontWeight: FontWeight.w400,
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(false),
            child: const CustomText(
              'Cancel',
              color: AppColors.gray10,
              fontWeight: FontWeight.w700,
            ),
          ),
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(true),
            child: CustomText(
              'Confirm',
              color: AppTheme.getColor(context).primary,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    ).then((confirmed) {
      if (confirmed == true) {
        _cropBloc.add(ProcessAndSaveChanges());
      }
    });
  }
}

extension on String {
  String capitalize() => '${this[0].toUpperCase()}${substring(1)}';
}

enum _DragHandle { none, center, topLeft, topRight, bottomLeft, bottomRight }

class ResizableCropArea extends StatefulWidget {
  final Uint8List imageData;
  final Rect? initialRect;
  final ValueChanged<Rect> onRectChanged;
  final CropAspectRatio aspectRatio;
  final CropShape shape;
  final Size? parentSize;
  final double minCropSize;

  const ResizableCropArea({
    required this.imageData,
    required this.onRectChanged,
    required this.aspectRatio,
    required this.shape,
    required this.minCropSize,
    super.key,
    this.initialRect,
    this.parentSize,
  });

  @override
  State<ResizableCropArea> createState() => _ResizableCropAreaState();
}

class _ResizableCropAreaState extends State<ResizableCropArea> {
  Rect? _rect;
  _DragHandle _activeHandle = _DragHandle.none;

  Rect? _rectOnScaleStart;
  Offset? _focalPointOnScaleStart;

  static const double _handleTouchSize = 32.0;

  @override
  void initState() {
    super.initState();
    _rect = widget.initialRect;
  }

  @override
  void didUpdateWidget(covariant ResizableCropArea oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Only update _rect from widget.initialRect if not currently dragging
    // and if the initialRect has actually changed, and we haven't started a new scale operation.
    if (widget.initialRect != oldWidget.initialRect &&
        _activeHandle == _DragHandle.none &&
        _rectOnScaleStart == null) {
      _rect = widget.initialRect;
    }
  }

  _DragHandle _getHandleForPosition(Offset position) {
    if (_rect == null) return _DragHandle.none;

    final handleRects = {
      _DragHandle.topLeft: Rect.fromCenter(
        center: _rect!.topLeft,
        width: _handleTouchSize,
        height: _handleTouchSize,
      ),
      _DragHandle.topRight: Rect.fromCenter(
        center: _rect!.topRight,
        width: _handleTouchSize,
        height: _handleTouchSize,
      ),
      _DragHandle.bottomLeft: Rect.fromCenter(
        center: _rect!.bottomLeft,
        width: _handleTouchSize,
        height: _handleTouchSize,
      ),
      _DragHandle.bottomRight: Rect.fromCenter(
        center: _rect!.bottomRight,
        width: _handleTouchSize,
        height: _handleTouchSize,
      ),
    };

    for (final entry in handleRects.entries) {
      if (entry.value.contains(position)) return entry.key;
    }

    if (_rect!.contains(position)) return _DragHandle.center;
    return _DragHandle.none;
  }

  void _onScaleStart(ScaleStartDetails details) {
    _rectOnScaleStart = _rect;
    _focalPointOnScaleStart = details.focalPoint;

    if (details.pointerCount == 1) {
      _activeHandle = _getHandleForPosition(details.localFocalPoint);
    } else {
      _activeHandle = _DragHandle.none;
    }
  }

  void _onScaleUpdate(ScaleUpdateDetails details) {
    if (_rectOnScaleStart == null ||
        widget.parentSize == null ||
        widget.parentSize!.isEmpty) {
      debugPrint(
        'Warning: parentSize or initial rect not set or empty during scale update.',
      );
      return;
    }

    // Only allow scaling/resizing if the aspect ratio is free or if it's a two-finger gesture.
    // If aspect ratio is fixed and it's a single finger drag not on center, just return.
    if (widget.aspectRatio.value != null &&
        _activeHandle != _DragHandle.center &&
        details.pointerCount == 1) {
      return;
    }

    Rect newRect = _rectOnScaleStart!;
    final Offset translationDelta =
        details.focalPoint - _focalPointOnScaleStart!;

    if (details.pointerCount == 1 && _activeHandle != _DragHandle.none) {
      if (_activeHandle == _DragHandle.center) {
        newRect = newRect.translate(translationDelta.dx, translationDelta.dy);
      } else {
        Offset newCorner;
        Offset oppositeCorner;

        switch (_activeHandle) {
          case _DragHandle.topLeft:
            newCorner = _rectOnScaleStart!.topLeft + translationDelta;
            oppositeCorner = _rectOnScaleStart!.bottomRight;
            break;
          case _DragHandle.topRight:
            newCorner = _rectOnScaleStart!.topRight + translationDelta;
            oppositeCorner = _rectOnScaleStart!.bottomLeft;
            break;
          case _DragHandle.bottomLeft:
            newCorner = _rectOnScaleStart!.bottomLeft + translationDelta;
            oppositeCorner = _rectOnScaleStart!.topRight;
            break;
          case _DragHandle.bottomRight:
            newCorner = _rectOnScaleStart!.bottomRight + translationDelta;
            oppositeCorner = _rectOnScaleStart!.topLeft;
            break;
          default:
            return;
        }

        newRect = Rect.fromPoints(newCorner, oppositeCorner).normalize();

        final ratio = widget.aspectRatio.value;
        if (ratio != null) {
          final double currentWidth = newRect.width;
          final double currentHeight = newRect.height;

          double targetWidth;
          double targetHeight;

          if (currentWidth / currentHeight > ratio) {
            targetWidth = currentHeight * ratio;
            targetHeight = currentHeight;
          } else {
            targetHeight = currentWidth / ratio;
            targetWidth = currentWidth;
          }

          targetWidth = max(widget.minCropSize, targetWidth);
          targetHeight = max(widget.minCropSize, targetHeight);

          // Adjust newRect to maintain aspect ratio based on active handle
          if (_activeHandle == _DragHandle.topLeft) {
            newRect = Rect.fromLTWH(
              oppositeCorner.dx - targetWidth,
              oppositeCorner.dy - targetHeight,
              targetWidth,
              targetHeight,
            );
          } else if (_activeHandle == _DragHandle.topRight) {
            newRect = Rect.fromLTWH(
              oppositeCorner.dx,
              oppositeCorner.dy - targetHeight,
              targetWidth,
              targetHeight,
            );
          } else if (_activeHandle == _DragHandle.bottomLeft) {
            newRect = Rect.fromLTWH(
              oppositeCorner.dx - targetWidth,
              oppositeCorner.dy,
              targetWidth,
              targetHeight,
            );
          } else {
            // _DragHandle.bottomRight
            newRect = Rect.fromLTWH(
              oppositeCorner.dx,
              oppositeCorner.dy,
              targetWidth,
              targetHeight,
            );
          }
        }
      }
    } else if (details.pointerCount > 1) {
      final Offset translation = translationDelta;

      double newWidth = _rectOnScaleStart!.width * details.scale;
      double newHeight = _rectOnScaleStart!.height * details.scale;

      if (widget.aspectRatio.value != null) {
        final ratio = widget.aspectRatio.value!;
        if (newWidth / newHeight > ratio) {
          newWidth = newHeight * ratio;
        } else {
          newHeight = newWidth / ratio;
        }
      }

      newWidth = newWidth.clamp(widget.minCropSize, widget.parentSize!.width);
      newHeight = newHeight.clamp(
        widget.minCropSize,
        widget.parentSize!.height,
      );

      final newCenter = _rectOnScaleStart!.center + translation;

      newRect = Rect.fromCenter(
        center: newCenter,
        width: newWidth,
        height: newHeight,
      );
    } else {
      return;
    }

    final double finalWidth = newRect.width.clamp(
      widget.minCropSize,
      widget.parentSize!.width,
    );
    final double finalHeight = newRect.height.clamp(
      widget.minCropSize,
      widget.parentSize!.height,
    );

    final double left = newRect.left.clamp(
      0.0,
      widget.parentSize!.width - finalWidth,
    );
    final double top = newRect.top.clamp(
      0.0,
      widget.parentSize!.height - finalHeight,
    );

    newRect = Rect.fromLTWH(left, top, finalWidth, finalHeight);

    setState(() {
      _rect = newRect;
      // Removed widget.onRectChanged here to prevent excessive BLoC updates
    });
  }

  void _onScaleEnd(ScaleEndDetails details) {
    _activeHandle = _DragHandle.none;
    _rectOnScaleStart = null;
    _focalPointOnScaleStart = null;
    if (_rect != null) {
      widget.onRectChanged(
        _rect!,
      ); // Notify BLoC only when scaling/dragging ends
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.parentSize == null ||
        widget.parentSize!.isEmpty ||
        _rect == null) {
      return Image.memory(widget.imageData, fit: BoxFit.contain);
    }

    return Stack(
      fit: StackFit.expand,
      children: [
        Image.memory(widget.imageData, fit: BoxFit.contain),
        Positioned.fill(
          child: GestureDetector(
            onScaleStart: _onScaleStart,
            onScaleUpdate: _onScaleUpdate,
            onScaleEnd: _onScaleEnd,
            child: CustomPaint(
              painter: _CropRectPainter(
                rect: _rect!,
                shape: widget.shape,
                activeHandle: _activeHandle,
                minCropSize: widget.minCropSize, // Pass minCropSize to painter
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _CropRectPainter extends CustomPainter {
  final Rect rect;
  final CropShape shape;
  final _DragHandle activeHandle;
  final double minCropSize; // Added minCropSize

  _CropRectPainter({
    required this.rect,
    required this.shape,
    this.activeHandle = _DragHandle.none,
    required this.minCropSize, // Required in constructor
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Path path = Path();
    if (shape == CropShape.rectangle) {
      path.addRect(rect);
    } else {
      path.addOval(rect);
    }

    final Paint overlayPaint = Paint()
      ..color = AppColors.black.withValues(alpha: 0.4)
      ..style = PaintingStyle.fill;

    final Path fullPath = Path()..addRect(Offset.zero & size);

    canvas.drawPath(
      Path.combine(PathOperation.difference, fullPath, path),
      overlayPaint,
    );

    final Paint borderPaint = Paint()
      ..color = AppColors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.5;

    canvas.drawPath(path, borderPaint);

    final Paint gridPaint = Paint()
      ..color = AppColors.white.withValues(alpha: 0.5)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;

    if (shape == CropShape.rectangle) {
      canvas.drawLine(
        Offset(rect.left, rect.top + rect.height / 3),
        Offset(rect.right, rect.top + rect.height / 3),
        gridPaint,
      );
      canvas.drawLine(
        Offset(rect.left, rect.top + rect.height * 2 / 3),
        Offset(rect.right, rect.top + rect.height * 2 / 3),
        gridPaint,
      );

      canvas.drawLine(
        Offset(rect.left + rect.width / 3, rect.top),
        Offset(rect.left + rect.width / 3, rect.bottom),
        gridPaint,
      );
      canvas.drawLine(
        Offset(rect.left + rect.width * 2 / 3, rect.top),
        Offset(rect.left + rect.width * 2 / 3, rect.bottom),
        gridPaint,
      );
    }

    final Paint handlePaint = Paint()
      ..color = AppColors.white
      ..style = PaintingStyle.fill;

    final Paint activeHandlePaint = Paint()
      ..color = AppColors.white
      ..style = PaintingStyle.fill;

    void drawHandle(Offset center, _DragHandle handleType) {
      canvas.drawCircle(
        center,
        minCropSize / 8, // Use minCropSize passed to the painter
        activeHandle == handleType ? activeHandlePaint : handlePaint,
      );
    }

    drawHandle(rect.topLeft, _DragHandle.topLeft);
    drawHandle(rect.topRight, _DragHandle.topRight);
    drawHandle(rect.bottomLeft, _DragHandle.bottomLeft);
    drawHandle(rect.bottomRight, _DragHandle.bottomRight);
  }

  @override
  bool shouldRepaint(covariant _CropRectPainter oldDelegate) =>
      oldDelegate.rect != rect ||
      oldDelegate.shape != shape ||
      oldDelegate.activeHandle != activeHandle ||
      oldDelegate.minCropSize != minCropSize;
}
