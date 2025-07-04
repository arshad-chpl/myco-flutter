import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:path/path.dart' as path;
import 'dashed_border_container.dart';
import 'image_picker.dart';

class CustomImagePickerContainer extends StatefulWidget {
  final double? containerHeight;
  final double? containerWidth;
  final double? borderRadius;
  final double? iconSize;
  final String? title;
  final Color? backgroundColor;
  final Color? borderColor;
  final bool? isTitle;
  final String? imagePath;
  final String? imageTitle;
  final bool? isCameraShow;
  final bool? isGallaryShow;
  final bool? isDocumentShow;
  final Function(File)? onImageSelected;

  const CustomImagePickerContainer({
    super.key,
    this.containerHeight,
    this.title,
    this.backgroundColor,
    this.borderRadius,
    this.isTitle = false,
    this.containerWidth,
    this.imagePath,
    this.isCameraShow,
    this.isGallaryShow,
    this.isDocumentShow,
    this.imageTitle,
    this.borderColor,
    this.onImageSelected,
    this.iconSize,
  });

  @override
  State<CustomImagePickerContainer> createState() =>
      _CustomImagePickerContainerState();
}

class _CustomImagePickerContainerState
    extends State<CustomImagePickerContainer> {
  File? _pickedImage;
  File? pickedFile;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.isTitle == true)
          Text(
            widget.isTitle == true ? widget.title ?? "Title" : "",
            style: TextStyle(
              fontFamily: "Gilroy-Bold",
              fontWeight: FontWeight.w400,
              color: AppTheme.getColor(context).onSurfaceVariant,
              fontSize: 13,
            ),
          ),
        SizedBox(height: 5),

        GestureDetector(
          onTap: () {
            if (_pickedImage == null && pickedFile == null) {
              openImagePicker(
                context,
                widget.isDocumentShow ?? false,
                widget.isCameraShow ?? false,
                widget.isGallaryShow ?? false,
              );
            }
          },

          child: DesignBorderContainer(
            borderRadius: widget.borderRadius ?? 12,
            width: widget.containerWidth ?? double.infinity,
            height: widget.containerHeight ?? double.infinity,
            borderColor:
                widget.borderColor ?? AppTheme.getColor(context).primary,
            backgroundColor:
                widget.backgroundColor ??
                AppTheme.getColor(context).surfaceContainer,
            padding: const EdgeInsets.all(0),
            child: _pickedImage != null
                ? Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(
                          widget.borderRadius ?? 12,
                        ),
                        child: Image.file(
                          _pickedImage!,
                          width: double.infinity,
                          height: widget.containerHeight ?? 160,
                          fit: BoxFit.cover,
                        ),
                      ),

                      Positioned(
                        right: 6,
                        top: 6,
                        child: GestureDetector(
                          onTap: () => setState(() => _pickedImage = null),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 2,
                              horizontal: 6,
                            ),
                            decoration: BoxDecoration(
                              color: AppTheme.getColor(context).onSurface,
                              border: Border.all(
                                color: AppTheme.getColor(context).error,
                              ),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              "Remove",
                              style: TextStyle(
                                fontSize:
                                    Theme.of(
                                      context,
                                    ).textTheme.bodyMedium?.fontSize ??
                                    14,
                                color: AppTheme.getColor(context).error,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                : pickedFile != null
                ? Row(
                    children: [
                      Icon(
                        Icons.insert_drive_file,
                        color: AppTheme.getColor(context).primary,
                        size: 40,
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          path.basename(pickedFile!.path),
                          style: TextStyle(
                            fontSize: 16 * getResponsive(context),
                            fontFamily: "Gilroy-Medium",
                            color: AppTheme.getColor(context).onSurfaceVariant,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => setState(() => pickedFile = null),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 2,
                            horizontal: 6,
                          ),
                          decoration: BoxDecoration(
                            color: AppTheme.getColor(context).onSurface,
                            border: Border.all(
                              color: AppTheme.getColor(context).error,
                            ),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            "Remove",
                            style: TextStyle(
                              fontSize: 14 * getResponsive(context),
                              color: AppTheme.getColor(context).error,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        widget.imagePath ?? 'assets/gallery-export.png',
                        width: widget.iconSize ?? 30,
                        height: widget.iconSize ?? 30,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        widget.imageTitle ?? 'Capture Image',
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: "Gilroy-SemiBold",
                          fontWeight: FontWeight.w400,
                          color: AppTheme.getColor(context).onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      ],
    );
  }

  void openImagePicker(
    BuildContext context,
    bool isDocumentShow,
    bool isCameraShow,
    bool isGallaryShow,
  ) async {
    final File? selectedFile = await showImageFilePicker(
      context: context,
      selectDocument: true,
      isDocumentShow: isDocumentShow,
      isCameraShow: isCameraShow,
      isGallaryShow: isGallaryShow,
    );

    if (selectedFile != null) {
      final String extension = path.extension(selectedFile.path).toLowerCase();

      if (extension == '.png' ||
          extension == '.jpg' ||
          extension == '.heic' ||
          extension == '.jpeg') {
        setState(() {
          _pickedImage = selectedFile;
          pickedFile = null;
        });
        widget.onImageSelected?.call(selectedFile);
      } else if (extension == '.pdf' ||
          extension == '.doc' ||
          extension == '.docx') {
        setState(() {
          pickedFile = selectedFile;
          _pickedImage = null;
        });
      } else {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Unsupported file type')));
      }
    } else {
      log('User cancelled or error occurred.');
    }
  }
}
