import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myco_flutter/constants/app_assets.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/widgets/custom_media_picker_container/design_border_container.dart';
import 'package:myco_flutter/widgets/custom_media_picker_container/gallery_picker_screen.dart';
import 'package:myco_flutter/widgets/custom_media_picker_container/media_picker.dart';
import 'package:myco_flutter/widgets/custom_text.dart';
import 'package:path/path.dart' as path;

class CustomMediaPickerContainer extends StatefulWidget {
  final double? imageMargin,
      containerHeight,
      titleFontSize,
      imageTitleSize,
      imageHeight,
      imageWidth;
  final String title, imageTitle;
  final String imagePath;
  final int multipleImage;
  final Color? titleColor, backgroundColor, imageTitleColor;
  final bool isCameraShow,
      isGalleryShow,
      isDocumentShow,
      isCropImage,
      titleIsKey,
      imageTitleIsKey;
  final Function(List<File> files)? onSelectedMedia;

  const CustomMediaPickerContainer({
    required this.title,
    required this.imageTitle,
    required this.multipleImage,
    required this.imagePath,
    this.imageHeight,
    this.imageWidth,
    this.onSelectedMedia,
    super.key,
    this.imageMargin,
    this.containerHeight,
    this.backgroundColor,
    this.isCameraShow = false,
    this.isGalleryShow = false,
    this.isDocumentShow = false,
    this.isCropImage = false,
    this.titleIsKey = false,
    this.imageTitleIsKey = false,
    this.titleFontSize,
    this.titleColor,
    this.imageTitleColor,
    this.imageTitleSize,
  });

  @override
  State<CustomMediaPickerContainer> createState() =>
      _CustomMediaPickerContainerState();
}

class _CustomMediaPickerContainerState
    extends State<CustomMediaPickerContainer> {
  final List<File> _selectedImages = [];
  File? _pickedDocumentFile;

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      CustomText(
        widget.title,
        isKey: widget.titleIsKey,
        fontSize:
            widget.titleFontSize ?? 14 * Responsive.getResponsiveText(context),
        fontWeight: FontWeight.w700,
        color: widget.titleColor ?? AppTheme.getColor(context).onSurfaceVariant,
      ),
      const SizedBox(height: 8),
      _buildPickerContent(),
    ],
  );

  Widget _buildPickerContent() {
    if (_selectedImages.isNotEmpty) return _buildImageGrid();
    if (_pickedDocumentFile != null) return _buildDocumentPreview();
    return _buildInitialPicker();
  }

  // Image grid preview when images are selected
  Widget _buildImageGrid() => DesignBorderContainer(
    borderRadius: 8,
    borderColor: AppTheme.getColor(context).primary,
    backgroundColor: AppTheme.getColor(context).onPrimary,
    padding: const EdgeInsets.all(0),
    child: Padding(
      padding: EdgeInsets.all(widget.imageMargin ?? 10),
      child: GridView.count(
        padding: const EdgeInsets.all(0),
        crossAxisCount: 4,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        childAspectRatio: 0.75,
        children: List.generate(
          _selectedImages.length < widget.multipleImage
              ? _selectedImages.length + 1
              : _selectedImages.length,
          (index) {
            if (_selectedImages.length < widget.multipleImage &&
                index == _selectedImages.length) {
              return GestureDetector(
                onTap: () => openMediaPicker(context),
                child: Container(
                  decoration: BoxDecoration(
                    color: AppTheme.getColor(context).surfaceContainer,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: AppTheme.getColor(context).primary,
                    ),
                  ),
                  child: Icon(
                    Icons.add,
                    size: 30,
                    color: AppTheme.getColor(context).primary,
                  ),
                ),
              );
            }

            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: AppTheme.getColor(context).primary,
                  width: 1,
                ),
              ),
              padding: const EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.file(
                        _selectedImages[index],
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedImages.removeAt(index);
                      });
                      widget.onSelectedMedia?.call(_selectedImages);
                    },
                    child: SvgPicture.asset(
                      AppAssets.trash,
                      height: 0.020 * Responsive.getHeight(context),
                    ),
                    // child: Image.asset(
                    //   'assets/media_picker/trash.png',
                    //   height: 20,
                    // ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    ),
  );

  // Document preview when a document is selected
  Widget _buildDocumentPreview() => DesignBorderContainer(
    borderRadius: 12,
    borderColor: AppTheme.getColor(context).primary,
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
    child: Row(
      children: [
        Icon(
          Icons.insert_drive_file,
          color: AppTheme.getColor(context).primary,
          size: 40,
        ),
        const SizedBox(width: 10),
        Expanded(
          child: CustomText(
            path.basename(_pickedDocumentFile!.path),
            fontSize: 16 * Responsive.getResponsiveText(context),
            fontWeight: FontWeight.w500,
            color: AppTheme.getColor(context).onSurfaceVariant,
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() => _pickedDocumentFile = null);
            widget.onSelectedMedia?.call([]);
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 6),
            decoration: BoxDecoration(
              color: AppColors.removeBackground,
              border: Border.all(color: AppTheme.getColor(context).error),
              borderRadius: BorderRadius.circular(4),
            ),
            child: CustomText(
              'Remove',
              fontSize: 14 * Responsive.getResponsiveText(context),
              fontWeight: FontWeight.w700,
              color: AppColors.error,
            ),
          ),
        ),
      ],
    ),
  );

  // Initial upload box before any selection
  Widget _buildInitialPicker() => GestureDetector(
    onTap: () => openMediaPicker(context),
    child: DesignBorderContainer(
      borderRadius: 12,
      borderColor: AppTheme.getColor(context).primary,
      backgroundColor: widget.backgroundColor ?? AppColors.lightTeal,
      padding: const EdgeInsets.all(10),
      child: SizedBox(
        width: double.infinity,
        height: widget.containerHeight ?? 0.10 * Responsive.getHeight(context),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              widget.imagePath.isNotEmpty
                  ? widget.imagePath
                  : AppAssets.assetGalleryExport,
              width: widget.imageWidth ?? 0.030 * Responsive.getWidth(context),
              height:
                  widget.imageHeight ?? 0.030 * Responsive.getHeight(context),
            ),
            SizedBox(height: 0.006 * Responsive.getHeight(context)),
            CustomText(
              widget.imageTitle,
              isKey: widget.imageTitleIsKey,
              fontSize:
                  widget.imageTitleSize ??
                  16 * Responsive.getResponsiveText(context),
              fontWeight: FontWeight.w600,
              color:
                  widget.imageTitleColor ??
                  AppTheme.getColor(context).onSurfaceVariant,
            ),
          ],
        ),
      ),
    ),
  );

  // Opens the media picker and handles the selected files
  void openMediaPicker(BuildContext context) async {
    final remainingCount = widget.multipleImage - _selectedImages.length;
    if (remainingCount <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: CustomText(
            'You have already selected the maximum number of images.',
            fontWeight: FontWeight.w600,
          ),
        ),
      );
      return;
    }

    List<File>? selectedFiles = [];

    // Show only gallery screen if others are disabled
    if (widget.isGalleryShow &&
        !widget.isCameraShow &&
        !widget.isDocumentShow) {
      selectedFiles = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => GalleryPickerScreen(
            maxSelection: remainingCount,
            onSelectionDone: (List<dynamic> assets) async {
              final List<File> files = [];
              for (final asset in assets) {
                final file = await asset.file;
                if (file != null) files.add(file);
              }
              Navigator.pop(context, files);
            },
          ),
        ),
      );
    } else {
      selectedFiles = await showMediaFilePicker(
        context: context,
        maxCount: remainingCount,
        isCameraShow: widget.isCameraShow,
        isGalleryShow: widget.isGalleryShow,
        isDocumentShow: widget.isDocumentShow,
        isCropImage: widget.isCropImage,
      );
    }

    if (selectedFiles == null || selectedFiles.isEmpty) {
      log('User cancelled or error occurred.');
      return;
    }

    final Map<String, List<File>> validFiles = _filterFiles(selectedFiles);

    // Add images
    if (validFiles['images']!.isNotEmpty) {
      if (_selectedImages.length + validFiles['images']!.length <=
          widget.multipleImage) {
        setState(() {
          _selectedImages.addAll(validFiles['images']!);
          _pickedDocumentFile = null;
        });
        widget.onSelectedMedia?.call(_selectedImages);
      } else {
        final remaining = widget.multipleImage - _selectedImages.length;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: CustomText(
              'You can only select $remaining more image${remaining > 1 ? "s" : ""}.',
              fontWeight: FontWeight.w600,
            ),
          ),
        );
      }
    }

    // Add document
    if (validFiles['document']!.isNotEmpty) {
      setState(() {
        _pickedDocumentFile = validFiles['document']!.first;
        _selectedImages.clear();
      });
      widget.onSelectedMedia?.call([_pickedDocumentFile!]);
    }
  }

  // Helper to separate images and document files
  Map<String, List<File>> _filterFiles(List<File> files) {
    final List<File> images = [];
    final List<File> document = [];

    for (final file in files) {
      final ext = path.extension(file.path).toLowerCase();
      if (['.png', '.jpg', '.jpeg', '.heic', '.heif'].contains(ext)) {
        images.add(file);
      } else if (['.pdf', '.doc', '.docx'].contains(ext)) {
        document.add(file);
      }
    }

    return {'images': images, 'document': document};
  }
}
