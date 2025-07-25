part of 'custom_crop_images_bloc.dart';

@immutable
class CustomCropImagesState extends Equatable {
  final List<AssetEntity> assets;
  final int currentIndex;
  final Map<int, Rect> pendingCropRects;
  final Map<int, Rect> croppedRects;
  final Map<int, CropShape> cropShapes;
  final Map<int, CropAspectRatio> cropAspectRatios;
  final List<CropAspectRatio> aspectRatios;
  final CropAspectRatio selectedAspectRatio;
  final CropShape selectedShape;
  final bool isGlobalAspectRatioActive;
  final CropAspectRatio? globalFixedAspectRatio;
  final Size? imageDisplaySize;
  final bool isLoading;
  final List<File>? processedFiles;

  const CustomCropImagesState({
    required this.assets,
    required this.currentIndex,
    required this.pendingCropRects,
    required this.croppedRects,
    required this.cropShapes,
    required this.cropAspectRatios,
    required this.aspectRatios,
    required this.selectedAspectRatio,
    required this.selectedShape,
    required this.isGlobalAspectRatioActive,
    this.globalFixedAspectRatio,
    this.imageDisplaySize,
    this.isLoading = false,
    this.processedFiles,
  });

  CustomCropImagesState copyWith({
    List<AssetEntity>? assets,
    int? currentIndex,
    Map<int, Rect>? pendingCropRects,
    Map<int, Rect>? croppedRects,
    Map<int, CropShape>? cropShapes,
    Map<int, CropAspectRatio>? cropAspectRatios,
    List<CropAspectRatio>? aspectRatios,
    CropAspectRatio? selectedAspectRatio,
    CropShape? selectedShape,
    bool? isGlobalAspectRatioActive,
    CropAspectRatio? globalFixedAspectRatio,
    Size? imageDisplaySize,
    bool? isLoading,
    List<File>? processedFiles,
  }) => CustomCropImagesState(
    assets: assets ?? this.assets,
    currentIndex: currentIndex ?? this.currentIndex,
    pendingCropRects: pendingCropRects ?? this.pendingCropRects,
    croppedRects: croppedRects ?? this.croppedRects,
    cropShapes: cropShapes ?? this.cropShapes,
    cropAspectRatios: cropAspectRatios ?? this.cropAspectRatios,
    aspectRatios: aspectRatios ?? this.aspectRatios,
    selectedAspectRatio: selectedAspectRatio ?? this.selectedAspectRatio,
    selectedShape: selectedShape ?? this.selectedShape,
    isGlobalAspectRatioActive:
        isGlobalAspectRatioActive ?? this.isGlobalAspectRatioActive,
    globalFixedAspectRatio:
        globalFixedAspectRatio ?? this.globalFixedAspectRatio,
    imageDisplaySize: imageDisplaySize ?? this.imageDisplaySize,
    isLoading: isLoading ?? this.isLoading,
    processedFiles: processedFiles ?? this.processedFiles,
  );

  @override
  List<Object?> get props => [
    assets,
    currentIndex,
    pendingCropRects,
    croppedRects,
    cropShapes,
    cropAspectRatios,
    aspectRatios,
    selectedAspectRatio,
    selectedShape,
    isGlobalAspectRatioActive,
    globalFixedAspectRatio,
    imageDisplaySize,
    isLoading,
    processedFiles,
  ];
}
