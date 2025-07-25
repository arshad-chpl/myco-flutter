import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/app_permissions.dart';
import 'package:myco_flutter/core/utils/language_manager.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/widgets/custom_appbar.dart';
import 'package:myco_flutter/widgets/custom_loader.dart';
import 'package:myco_flutter/widgets/custom_text.dart';
import 'package:myco_flutter/widgets/media_picker/bloc/gallery_picker_bloc/gallery_picker_bloc.dart';
import 'package:myco_flutter/widgets/media_picker/bloc/gallery_picker_bloc/gallery_picker_event.dart';
import 'package:myco_flutter/widgets/media_picker/bloc/gallery_picker_bloc/gallery_picker_state.dart';
import 'package:myco_flutter/widgets/media_picker/screens/custom_crop_images.dart';
import 'package:myco_flutter/widgets/media_picker/widgets/gallery_picker_bottom_sheet.dart';
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
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 300) {
        BlocProvider.of<GalleryPickerBloc>(
          context,
        ).add(const LoadGallery(isInitial: false));
      }
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _checkPermissionsAndLoadGallery();
    });
  }

  Future<void> _checkPermissionsAndLoadGallery() async {
    final bool hasPermission = await PermissionUtil.checkPermissionByPickerType(
      'gallery',
      context,
    );

    if (hasPermission) {
      BlocProvider.of<GalleryPickerBloc>(context).add(const LoadGallery());
    } else {
      BlocProvider.of<GalleryPickerBloc>(
        context,
      ).add(const GalleryPermissionDenied('gallery_permission_denied'));
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _handleValidAssets(List<AssetEntity> validAssets) async {
    if (widget.isCropImage) {
      // Push the CustomCropImageScreen
      final croppedFiles = await Navigator.push<List<File>>(
        context,
        MaterialPageRoute(
          builder: (_) => CustomCropImageScreen(assets: validAssets),
        ),
      );

      if (mounted) {
        if (croppedFiles != null && croppedFiles.isNotEmpty) {
          widget.onSelectionDone(croppedFiles);
        }
      }
    } else {
      final List<File> files = [];
      for (final asset in validAssets) {
        final file = await asset.file;
        if (file != null) {
          files.add(file);
        }
      }
      widget.onSelectionDone(files);
    }
  }

  void _showInvalidFilesBottomSheet(
    List<Map<String, dynamic>> invalidFiles,
    List<AssetEntity> validAssets,
  ) {
    if (!mounted) return;

    GalleryPickerBottomSheet.showInvalidFilesBottomSheet(
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
  Widget build(BuildContext context) => Scaffold(
    appBar: CustomAppbar(
      appBarTitleWidget: BlocBuilder<GalleryPickerBloc, GalleryPickerState>(
        builder: (context, state) {
          int selectedCount = 0;
          int maxSelection = widget.maxSelection;
          if (state is GalleryPickerLoaded) {
            selectedCount = state.selectedAssets.length;
            maxSelection = state.maxSelection;
          }
          return CustomText(
            '${LanguageManager().get('selected')}: $selectedCount/$maxSelection',
            fontSize: 18 * Responsive.getResponsiveText(context),
            fontWeight: FontWeight.w600,
          );
        },
      ),
      actions: [
        BlocBuilder<GalleryPickerBloc, GalleryPickerState>(
          builder: (context, state) {
            bool isSelected = false;
            if (state is GalleryPickerLoaded) {
              isSelected = state.selectedAssets.isNotEmpty;
            }
            return TextButton(
              onPressed: isSelected
                  ? () => BlocProvider.of<GalleryPickerBloc>(
                      context,
                    ).add(const ValidateAndSubmitSelection())
                  : null,
              child: CustomText(
                'done',
                isKey: true,
                fontSize: 16 * Responsive.getResponsiveText(context),
                fontWeight: FontWeight.w700,
                color: isSelected
                    ? AppTheme.getColor(context).onSurface
                    : AppTheme.getColor(
                        context,
                      ).onSurface.withValues(alpha: 0.5),
              ),
            );
          },
        ),
      ],
    ),
    body: BlocListener<GalleryPickerBloc, GalleryPickerState>(
      listener: (context, state) {
        if (state is GalleryPickerError) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        } else if (state is GalleryPickerSelectionValidated) {
          if (state.invalidFiles.isNotEmpty) {
            _showInvalidFilesBottomSheet(state.invalidFiles, state.validAssets);
          } else if (state.validAssets.isNotEmpty) {
            _handleValidAssets(state.validAssets);
          }
        }
      },
      child: BlocBuilder<GalleryPickerBloc, GalleryPickerState>(
        builder: (context, state) {
          if (state is GalleryPickerLoading) {
            return const Center(child: CustomLoader());
          } else if (state is GalleryPickerLoaded) {
            if (!state.hasPermission) {
              return Center(
                child: CustomText(
                  'gallery_permission_denied_message',
                  textAlign: TextAlign.center,
                  fontSize: 16 * Responsive.getResponsiveText(context),
                  color: AppTheme.getColor(context).onSurfaceVariant,
                ),
              );
            } else if (state.mediaList.isEmpty && !state.isFetchingMore) {
              return Center(
                child: CustomText(
                  'no_images_found',
                  textAlign: TextAlign.center,
                  fontSize: 16 * Responsive.getResponsiveText(context),
                  color: AppTheme.getColor(context).onSurfaceVariant,
                ),
              );
            }
            return GridView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.all(10),
              itemCount: state.mediaList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                childAspectRatio: 1,
              ),
              itemBuilder: (context, index) {
                final asset = state.mediaList[index];
                final isSelected = state.selectedAssets.contains(asset);
                return GestureDetector(
                  onTap: () => BlocProvider.of<GalleryPickerBloc>(
                    context,
                  ).add(ToggleAssetSelection(asset)),
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
                      Positioned(
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
                      ),
                    ],
                  ),
                );
              },
            );
          } else if (state is GalleryPickerError) {
            return Center(child: Text('Error: ${state.message}'));
          }
          return const SizedBox.shrink();
        },
      ),
    ),
  );
}
