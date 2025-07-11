import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/widgets/custom_media_picker_container/design_border_container.dart';
import 'package:myco_flutter/widgets/custom_media_picker_container/gallery_picker_screen.dart';
import 'package:myco_flutter/widgets/custom_media_picker_container/media_picker.dart';
import 'package:myco_flutter/widgets/custom_text.dart';
import 'package:path/path.dart' as path;

class CustomMediaPickerContainer extends StatefulWidget {
  final double? imageMargin, containerHeight, titleFontSize, imageTitleSize;
  final String title, imageTitle;
  final String imagePath;
  final int multipleImage;
  final Color? titleColor, backgroundColor, imageTitleColor;
  final bool isCameraShow, isGalleryShow, isDocumentShow, isCropImage;
  final Function(List<File> files)? onSelectedMedia;

  const CustomMediaPickerContainer({
    required this.title,
    required this.imageTitle,
    required this.multipleImage,
    required this.imagePath,
    this.onSelectedMedia,
    super.key,
    this.imageMargin,
    this.containerHeight,
    this.backgroundColor,
    this.isCameraShow = false,
    this.isGalleryShow = false,
    this.isDocumentShow = false,
    this.isCropImage = false,
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
  final List<File> _pickedImages = [];
  File? pickedFile;

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      CustomText(
        widget.title,
        fontSize:
        widget.titleFontSize ?? 14 * Responsive.getResponsiveText(context),
        fontWeight: FontWeight.w700,
        color:
        widget.titleColor ?? AppTheme.getColor(context).onSurfaceVariant,
      ),
      const SizedBox(height: 8),
      _buildPickerContent(),
    ],
  );

  Widget _buildPickerContent() {
    if (_pickedImages.isNotEmpty) {
      return DesignBorderContainer(
        borderRadius: 8,
        borderColor: AppTheme.getColor(context).primary,
        backgroundColor: AppTheme.getColor(context).onPrimary,
        padding: const EdgeInsets.all(0),
        child: Padding(
          padding: EdgeInsets.all(widget.imageMargin ?? 10),
          child: GridView.count(
            crossAxisCount: 4,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            childAspectRatio: 0.75,
            children: List.generate(
              _pickedImages.length < widget.multipleImage
                  ? _pickedImages.length + 1
                  : _pickedImages.length,
                  (index) {
                if (_pickedImages.length < widget.multipleImage &&
                    index == _pickedImages.length) {
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
                            _pickedImages[index],
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _pickedImages.removeAt(index);
                          });
                          widget.onSelectedMedia?.call(_pickedImages);
                        },
                        child: Image.asset(
                          'assets/media_picker/trash.png',
                          height: 20,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      );
    } else if (pickedFile != null) {
      return DesignBorderContainer(
        borderRadius: 12,
        borderColor: AppTheme.getColor(context).primary,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
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
                  path.basename(pickedFile!.path),
                  fontSize: 16 * Responsive.getResponsiveText(context),
                  fontWeight: FontWeight.w500,
                  color: AppTheme.getColor(context).onSurfaceVariant,
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() => pickedFile = null);
                  widget.onSelectedMedia?.call([]);
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 2,
                    horizontal: 6,
                  ),
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
        ),
      );
    } else {
      return GestureDetector(
        onTap: () => openMediaPicker(context),
        child: DesignBorderContainer(
          borderRadius: 12,
          borderColor: AppTheme.getColor(context).primary,
          backgroundColor: widget.backgroundColor ?? AppColors.lightTeal,
          padding: const EdgeInsets.all(10),
          child: SizedBox(
            width: double.infinity,
            height: widget.containerHeight ?? 150,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  widget.imagePath.isNotEmpty
                      ? widget.imagePath
                      : 'assets/gallery-export.png',
                  width: 30,
                  height: 30,
                ),
                const SizedBox(height: 5),
                CustomText(
                  widget.imageTitle,
                  fontSize: widget.imageTitleSize ??
                      16 * Responsive.getResponsiveText(context),
                  fontWeight: FontWeight.w600,
                  color: widget.imageTitleColor ??
                      AppTheme.getColor(context).onSurfaceVariant,
                ),
              ],
            ),
          ),
        ),
      );
    }
  }

  void openMediaPicker(BuildContext context) async {
    List<File>? selectedFiles = [];

    final remainingCount = widget.multipleImage - _pickedImages.length;
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
                if (file != null) {
                  files.add(file);
                }
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

    if (selectedFiles != null && selectedFiles.isNotEmpty) {
      final List<File> imageFiles = [];
      File? documentFile;

      for (final file in selectedFiles) {
        final String extension = path.extension(file.path).toLowerCase();

        if (['.png', '.jpg', '.jpeg', '.heic', '.heif'].contains(extension)) {
          imageFiles.add(file);
        } else if (['.pdf', '.doc', '.docx'].contains(extension)) {
          documentFile = file;
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Unsupported file type')),
          );
          return;
        }
      }

      if (imageFiles.isNotEmpty) {
        if (_pickedImages.length + imageFiles.length <= widget.multipleImage) {
          setState(() {
            _pickedImages.addAll(imageFiles);
            pickedFile = null;
          });
          widget.onSelectedMedia?.call(_pickedImages);
        } else {
          final remaining = widget.multipleImage - _pickedImages.length;
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

      if (documentFile != null) {
        setState(() {
          pickedFile = documentFile;
          _pickedImages.clear();
        });
        widget.onSelectedMedia?.call([pickedFile!]);
      }
    } else {
      log('User cancelled or error occurred.');
    }
  }
}
