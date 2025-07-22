import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:myco_flutter/constants/app_assets.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/app_permissions.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/widgets/custom_media_picker_container/custom_shadow_container.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_text.dart';
import 'package:path/path.dart' as path;

Future<File?> showImageFilePicker({
  required BuildContext context,
  bool? isDialog,
  bool? selectDocument,
  bool? isCameraShow,
  bool? isGallaryShow,
  bool? isDocumentShow,
}) async => isDialog == true
    ? showDialog<File>(
        context: context,
        builder: (context) => AlertDialog(
          contentPadding: const EdgeInsets.all(0),
          backgroundColor: AppTheme.getColor(context).onSurface,
          content: _ImageFilePickerWidget(
            selectDocument: selectDocument,
            isGallaryShow: isGallaryShow,
            isCameraShow: isCameraShow,
            isDocumentShow: isDocumentShow,
          ),
        ),
      )
    : showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        builder: (context) => _ImageFilePickerWidget(
          selectDocument: selectDocument,
          isGallaryShow: isGallaryShow,
          isCameraShow: isCameraShow,
          isDocumentShow: isDocumentShow,
        ),
      );

class _ImageFilePickerWidget extends StatefulWidget {
  final bool? selectDocument;
  final bool? isCameraShow;
  final bool? isGallaryShow;
  final bool? isDocumentShow;

  const _ImageFilePickerWidget({
    this.selectDocument,
    this.isCameraShow,
    this.isGallaryShow,
    this.isDocumentShow,
  });

  @override
  State<_ImageFilePickerWidget> createState() => _ImageFilePickerWidgetState();
}

class _ImageFilePickerWidgetState extends State<_ImageFilePickerWidget> {
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) => Container(
    decoration: BoxDecoration(
      color: AppTheme.getColor(context).onPrimary,
      borderRadius: const BorderRadius.all(Radius.circular(10)),
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomText(
            'select_option',
            isKey: true,
            fontSize: 16 * Responsive.getResponsive(context),
            color: AppTheme.getColor(context).outline,
            fontWeight: FontWeight.w600,
          ),
        ),
        Divider(height: .002 * Responsive.getHeight(context)),
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: .016 * Responsive.getHeight(context),
            horizontal:
                // 20,
                .020 * Responsive.getWidth(context),
          ),
          child: Row(
            children: [
              if (widget.isCameraShow == true)
                _pickerButton(
                  icon: AppAssets.camera,
                  title: 'camera',
                  onTap: () async {
                    final hasPermission =
                        await PermissionUtil.checkPermissionByPickerType(
                          'camera',
                          context,
                        );
                    if (hasPermission) {
                      _pickImage(ImageSource.camera);
                    }
                  },
                ),
              SizedBox(width: .020 * Responsive.getWidth(context)),
              if (widget.isGallaryShow == true)
                _pickerButton(
                  icon: AppAssets.gallary,
                  title: 'gallery',
                  onTap: () async {
                    final hasPermission =
                        await PermissionUtil.checkPermissionByPickerType(
                          'gallery',
                          context,
                        );
                    if (hasPermission) {
                      _pickImage(ImageSource.gallery);
                    }
                  },
                ),
              SizedBox(width: .020 * Responsive.getWidth(context)),
              if (widget.isDocumentShow == true)
                _pickerButton(
                  icon: AppAssets.document,
                  title: 'documents',
                  onTap: () async {
                    final hasPermission =
                        await PermissionUtil.checkPermissionByPickerType(
                          'document',
                          context,
                        );
                    if (hasPermission) {
                      _pickDocument();
                    }
                  },
                ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20.0 * Responsive.getResponsive(context),
          ),
          child: MyCoButton(
            isShadowBottomLeft: true,
            onTap: () => Navigator.pop(context),
            boarderRadius: 50,
            title: 'cancel',
          ),
        ),
        SizedBox(height: .016 * Responsive.getHeight(context)),
      ],
    ),
  );

  Widget _pickerButton({
    required String icon,
    required String title,
    required VoidCallback onTap,
  }) => GestureDetector(
    onTap: onTap,
    child: CustomShadowContainer(
      image: SvgPicture.asset(
        icon,
        height: .32 * Responsive.getHeight(context),
      ),
      title: title,
    ),
  );

  Future<void> _pickImage(ImageSource source) async {
    try {
      final XFile? pickedFile = await _picker.pickImage(
        source: source,
        maxWidth: 800,
        maxHeight: 800,
        imageQuality: 80,
      );

      if (pickedFile != null) {
        final extension = path.extension(pickedFile.path).toLowerCase();
        if (['.png', '.jpg', '.jpeg', '.heic'].contains(extension)) {
          final file = File(pickedFile.path);
          if (mounted) Navigator.pop(context, file);
        } else {
          _showError('Invalid file type. Use PNG, JPG, or JPEG.');
        }
      } else {
        Navigator.pop(context);
      }
    } catch (e) {
      _showError('Error picking image: $e');
    }
  }

  Future<void> _pickDocument() async {
    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf', 'doc', 'docx', 'jpg', 'jpeg', 'png'],
      );

      if (result != null && result.files.single.path != null) {
        final file = File(result.files.single.path!);
        if (mounted) Navigator.pop(context, file);
      } else {
        Navigator.pop(context);
      }
    } catch (e) {
      _showError('Error picking document: $e');
    }
  }

  void _showError(String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
    if (mounted) Navigator.pop(context);
  }
}
