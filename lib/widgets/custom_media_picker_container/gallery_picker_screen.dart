import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/app_permissions.dart';
import 'package:myco_flutter/core/utils/language_manager.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/widgets/custom_loader.dart';
import 'package:myco_flutter/widgets/custom_media_picker_container/custom_crop_images/custom_crop_images.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_text.dart';
import 'package:path/path.dart' as path;
import 'package:photo_manager/photo_manager.dart';
import 'package:photo_manager_image_provider/photo_manager_image_provider.dart';

class GalleryPickerScreen extends StatefulWidget {
  final int maxSelection;
  final Function(List<dynamic>) onSelectionDone;
  final bool isCropImage;

  const GalleryPickerScreen({
    required this.maxSelection,
    required this.onSelectionDone,
    super.key,
    this.isCropImage = false,
  });

  @override
  State<GalleryPickerScreen> createState() => _GalleryPickerScreenState();
}

class _GalleryPickerScreenState extends State<GalleryPickerScreen> {
  final ValueNotifier<List<AssetEntity>> selectedAssets = ValueNotifier([]);
  final ValueNotifier<bool> _isLoading = ValueNotifier(true);
  final ScrollController _scrollController = ScrollController();
  final List<AssetEntity> mediaList = [];

  List<AssetPathEntity> albums = [];
  int _currentPage = 0;
  final int _pageSize = 60;
  bool _isFetchingMore = false;
  int _currentMaxSelection = 0;

  @override
  void initState() {
    super.initState();
    _currentMaxSelection = widget.maxSelection;
    _loadGallery(context);

    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
              _scrollController.position.maxScrollExtent - 300 &&
          !_isFetchingMore) {
        _isFetchingMore = true;
        _loadGallery(context, isInitial: false);
      }
    });
  }

  Future<void> _loadGallery(
    BuildContext context, {
    bool isInitial = true,
  }) async {
    if (isInitial) _isLoading.value = true;

    final bool hasPermission = await PermissionUtil.checkPermissionByPickerType(
      'gallery',
      context,
    );
    if (!hasPermission) {
      _isLoading.value = false;
      return;
    }

    try {
      if (albums.isEmpty) {
        albums = await PhotoManager.getAssetPathList(
          onlyAll: true,
          type: RequestType.image,
        );
      }

      final newAssets = await albums.first.getAssetListPaged(
        page: _currentPage,
        size: _pageSize,
      );

      if (newAssets.isNotEmpty) {
        setState(() {
          mediaList.addAll(newAssets);
          _currentPage++;
        });
      }
    } catch (e) {
      debugPrint('Error loading gallery: $e');
    } finally {
      if (isInitial) _isLoading.value = false;
      _isFetchingMore = false;
    }
  }

  void _toggleSelection(AssetEntity asset) {
    final currentList = selectedAssets.value;
    if (currentList.contains(asset)) {
      selectedAssets.value = List.from(currentList)..remove(asset);
    } else {
      if (currentList.length < _currentMaxSelection) {
        selectedAssets.value = List.from(currentList)..add(asset);
      }
    }
  }

  Future<void> _validateAndSubmitSelection(List<AssetEntity> assets) async {
    final List<File> allFiles = [];
    final Map<File, AssetEntity> fileToAsset = {};

    for (final asset in assets) {
      final file = await asset.file;
      if (file != null) {
        allFiles.add(file);
        fileToAsset[file] = asset;
      }
    }

    final validationResult = await validateAndHandleImages(
      context: context,
      files: allFiles,
    );

    final validFiles = validationResult['validFiles'] as List<File>;
    final invalidFiles =
        validationResult['invalidFiles'] as List<Map<String, dynamic>>;

    final validAssets = validFiles
        .map((f) => fileToAsset[f])
        .whereType<AssetEntity>()
        .toList();

    if (invalidFiles.isNotEmpty && validAssets.isNotEmpty) {
      _showInvalidFilesBottomSheet(invalidFiles, validAssets);
    } else if (validAssets.isNotEmpty) {
      _handleValidAssets(validAssets);
    } else {
      _showInvalidFilesBottomSheet(invalidFiles, []);
    }
  }

  void _handleValidAssets(List<AssetEntity> validAssets) async {
    if (widget.isCropImage) {
      final croppedFiles = await Navigator.push<List<File>>(
        context,
        MaterialPageRoute(
          builder: (_) => CustomCropImageScreen(assets: validAssets),
        ),
      );

      if (croppedFiles != null && croppedFiles.isNotEmpty) {
        widget.onSelectionDone(croppedFiles);
      }
    } else {
      widget.onSelectionDone(validAssets);
    }
  }

  void _showInvalidFilesBottomSheet(
    List<Map<String, dynamic>> invalidFiles,
    List<AssetEntity> validAssets,
  ) {
    if (!mounted) return;

    _GalleryPickerBottomSheet.showInvalidFilesBottomSheet(
      context,
      invalidFiles,
      () {
        if (validAssets.isNotEmpty) {
          _handleValidAssets(validAssets);
        }
      },
    );
  }

  Widget _buildImage(AssetEntity asset) => ClipRRect(
    borderRadius: BorderRadius.circular(12),
    child: AssetEntityImage(
      asset,
      isOriginal: false,
      thumbnailSize: const ThumbnailSize(300, 300),
      fit: BoxFit.cover,
      errorBuilder: (_, __, ___) => const Icon(Icons.broken_image),
    ),
  );

  @override
  void dispose() {
    selectedAssets.dispose();
    _isLoading.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: AppTheme.getColor(context).onPrimary,
    appBar: AppBar(
      backgroundColor: AppTheme.getColor(context).primary,
      foregroundColor: AppTheme.getColor(context).onPrimary,
      elevation: 2,
      title: ValueListenableBuilder<List<AssetEntity>>(
        valueListenable: selectedAssets,
        builder: (_, selected, __) => CustomText(
          '${LanguageManager().get('selected')}: ${selected.length}/$_currentMaxSelection',
          fontSize: 18 * Responsive.getResponsiveText(context),
          color: AppTheme.getColor(context).onPrimary,
          fontWeight: FontWeight.w600,
        ),
      ),
      actions: [
        ValueListenableBuilder<List<AssetEntity>>(
          valueListenable: selectedAssets,
          builder: (context, selected, _) => TextButton(
            onPressed: selected.isNotEmpty
                ? () => _validateAndSubmitSelection(selected)
                : null,
            child: CustomText(
              'done',
              isKey: true,
              fontSize: 16 * Responsive.getResponsiveText(context),
              fontWeight: FontWeight.w700,
              color: selected.isNotEmpty
                  ? AppTheme.getColor(context).onPrimary
                  : AppTheme.getColor(context).onPrimary.withValues(alpha: 0.5),
            ),
          ),
        ),
      ],
    ),
    body: ValueListenableBuilder<bool>(
      valueListenable: _isLoading,
      builder: (context, isLoading, _) {
        if (isLoading) return const Center(child: CustomLoader());
        return GridView.builder(
          controller: _scrollController,
          padding: const EdgeInsets.all(10),
          itemCount: mediaList.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 1,
          ),
          itemBuilder: (context, index) {
            final asset = mediaList[index];
            return GestureDetector(
              onTap: () => _toggleSelection(asset),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.grey.shade200,
                    ),
                    child: _buildImage(asset),
                  ),
                  ValueListenableBuilder<List<AssetEntity>>(
                    valueListenable: selectedAssets,
                    builder: (_, selected, __) {
                      final isSelected = selected.contains(asset);
                      return Positioned(
                        top: 6,
                        right: 6,
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? AppTheme.getColor(context).primary
                                : AppTheme.getColor(
                                    context,
                                  ).onPrimary.withValues(alpha: 0.7),
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: AppTheme.getColor(context).primary,
                              width: 1,
                            ),
                          ),
                          child: Icon(
                            isSelected
                                ? Icons.check
                                : Icons.radio_button_unchecked,
                            color: isSelected
                                ? Colors.white
                                : AppTheme.getColor(context).primary,
                            size: 14,
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            );
          },
        );
      },
    ),
  );
}

Future<Map<String, dynamic>> validateAndHandleImages({
  required BuildContext context,
  required List<File> files,
}) async {
  final List<File> validFiles = [];
  final List<Map<String, dynamic>> invalidFiles = [];

  for (File file in files) {
    final String fileName = path.basename(file.path).toLowerCase();
    if (fileName.endsWith('.webp')) {
      invalidFiles.add({'file': file, 'reason': 'format'});
    } else {
      final int size = await file.length();
      if (size > 5 * 1024 * 1024) {
        invalidFiles.add({'file': file, 'reason': 'size'});
      } else {
        validFiles.add(file);
      }
    }
  }

  return {'validFiles': validFiles, 'invalidFiles': invalidFiles};
}

// Helper bottom sheet UI
class _GalleryPickerBottomSheet {
  static void showInvalidFilesBottomSheet(
    BuildContext context,
    List<Map<String, dynamic>> invalidFiles,
    VoidCallback onProceedWithValid,
  ) {
    if (invalidFiles.isEmpty) return;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => AnimatedPadding(
        padding: MediaQuery.of(context).viewInsets,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: DraggableScrollableSheet(
            initialChildSize: 0.5,
            minChildSize: 0.4,
            maxChildSize: 0.85,
            expand: false,
            builder: (context, scrollController) => Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    'File(s) Restriction',
                    fontSize: 18 * Responsive.getResponsiveText(context),
                    fontWeight: FontWeight.w700,
                    color: AppTheme.getColor(context).primary,
                  ),
                  const SizedBox(height: 15),
                  CustomText(
                    'Some files were discarded because they are either WebP format or larger than 5MB.',
                    fontSize: 14 * Responsive.getResponsiveText(context),
                    fontWeight: FontWeight.w500,
                    color: AppTheme.getColor(context).error,
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Wrap(
                        spacing: 12,
                        runSpacing: 12,
                        children: invalidFiles.map((item) {
                          final File file = item['file'];
                          final String reason = item['reason'];
                          return Container(
                            width: 100,
                            padding: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: AppTheme.getColor(context).outline,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.file(
                                    file,
                                    width: 88,
                                    height: 88,
                                    fit: BoxFit.cover,
                                    errorBuilder: (_, __, ___) => const Icon(
                                      Icons.broken_image,
                                      size: 40,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 6),
                                CustomText(
                                  reason == 'format'
                                      ? 'due to .webp'
                                      : 'due to size',
                                  fontSize:
                                      12 *
                                      Responsive.getResponsiveText(context),
                                  fontWeight: FontWeight.w500,
                                  color: Colors.red,
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 45,
                    width: double.infinity,
                    child: MyCoButton(
                      onTap: () {
                        Navigator.pop(context);
                        onProceedWithValid();
                      },
                      title: 'Close',
                      boarderRadius: 20,
                      isShadowBottomLeft: true,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
