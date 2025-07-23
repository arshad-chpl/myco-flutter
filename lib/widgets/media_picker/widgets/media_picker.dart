import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:myco_flutter/constants/app_assets.dart';
import 'package:myco_flutter/constants/constants.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/app_permissions.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/widgets/custom_loader.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_text.dart';
import 'package:myco_flutter/widgets/media_picker/bloc/gallery_picker_bloc/gallery_picker_bloc.dart';
import 'package:myco_flutter/widgets/media_picker/screens/gallery_picker_screen.dart';
import 'package:myco_flutter/widgets/media_picker/widgets/custom_shadow_container.dart';
import 'package:photo_manager/photo_manager.dart';

Future<List<File>?> showMediaFilePicker({
  required BuildContext context,
  bool? isDialog,
  bool isCameraShow = false,
  bool isGalleryShow = false,
  bool isDocumentShow = false,
  int maxCount = 5,
  bool isCropImage = false,
}) async {
  bool _isLoading = false;

  return isDialog == true
      ? showDialog<List<File>>(
          context: context,
          builder: (context) => StatefulBuilder(
            builder: (context, setState) => Stack(
              children: [
                AlertDialog(
                  contentPadding: const EdgeInsets.all(0),
                  backgroundColor: AppColors.white,
                  content: _MediaFilePickerWidget(
                    isCameraShow: isCameraShow,
                    isGalleryShow: isGalleryShow,
                    isDocumentShow: isDocumentShow,
                    onLoading: (val) => setState(() => _isLoading = val),
                    maxCount: maxCount,
                    isCropImage: isCropImage,
                  ),
                ),
                if (_isLoading) const Center(child: CustomLoader()),
              ],
            ),
          ),
        )
      : showModalBottomSheet<List<File>>(
          context: context,
          isScrollControlled: true,
          builder: (_) => Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Material(
              color: Colors.transparent,
              child: Container(
                padding: EdgeInsets.only(
                  left:
                      VariableBag.bottomSheetLeftPadding *
                      Responsive.getResponsive(context),
                  right:
                      VariableBag.bottomSheetRightPadding *
                      Responsive.getResponsive(context),
                  top:
                      VariableBag.bottomSheetTopPadding *
                      Responsive.getResponsive(context),
                  bottom:
                      VariableBag.bottomSheetBottomPadding *
                      Responsive.getResponsive(context),
                ),
                constraints: BoxConstraints(
                  maxHeight: Responsive.isTablet
                      ? 0.6 * Responsive.getHeight(context)
                      : 0.4 * Responsive.getHeight(context),
                ),
                decoration: BoxDecoration(
                  color: AppTheme.getColor(context).surface,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(
                      VariableBag.bottomSheetBorderRadius *
                          Responsive.getResponsive(context),
                    ),
                  ),
                ),
                child: _MediaFilePickerWidget(
                  isCameraShow: isCameraShow,
                  isGalleryShow: isGalleryShow,
                  isDocumentShow: isDocumentShow,
                  onLoading: (val) => _isLoading = val,
                  maxCount: maxCount,
                  isCropImage: isCropImage,
                ),
              ),
            ),
          ),
        );
}

class _MediaFilePickerWidget extends StatefulWidget {
  final bool isCameraShow;
  final bool isGalleryShow;
  final bool isDocumentShow;
  final int maxCount;
  final bool isCropImage;
  final void Function(bool)? onLoading;

  const _MediaFilePickerWidget({
    this.isCameraShow = false,
    this.isGalleryShow = false,
    this.isDocumentShow = false,
    this.onLoading,
    this.maxCount = 5,
    this.isCropImage = false,
  });

  @override
  State<_MediaFilePickerWidget> createState() => _MediaFilePickerWidgetState();
}

class _MediaFilePickerWidgetState extends State<_MediaFilePickerWidget> {
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) => Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      CustomText(
        'select_option',
        isKey: true,
        fontSize: 18 * Responsive.getResponsiveText(context),
        fontWeight: FontWeight.w700,
        color: AppTheme.getColor(context).onSurfaceVariant,
      ),
      Divider(height: 0.020 * Responsive.getHeight(context)),
      Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 0.030 * Responsive.getWidth(context),
          vertical: Responsive.isTablet
              ? 0.010 * 2 * Responsive.getHeight(context)
              : 0.010 * Responsive.getHeight(context),
        ),
        child: Row(
          children: [
            if (widget.isCameraShow)
              GestureDetector(
                onTap: () => _pickImage(ImageSource.camera),
                child: CustomShadowContainer(
                  image: SvgPicture.asset(
                    AppAssets.mediaPickerCamera,
                    height: 0.21 * Responsive.getHeight(context),
                  ),
                  title: 'camera',
                ),
              ),
            if (widget.isCameraShow)
              SizedBox(width: 0.05 * Responsive.getWidth(context)),
            if (widget.isGalleryShow)
              GestureDetector(
                onTap: () => _pickImage(ImageSource.gallery),
                child: CustomShadowContainer(
                  image: SvgPicture.asset(
                    AppAssets.mediaPickerGallery,
                    height: 0.21 * Responsive.getHeight(context),
                  ),
                  title: 'gallery',
                ),
              ),
            if (widget.isGalleryShow)
              SizedBox(width: 0.05 * Responsive.getWidth(context)),
            if (widget.isDocumentShow)
              GestureDetector(
                onTap: _pickDocument,
                child: CustomShadowContainer(
                  image: SvgPicture.asset(
                    AppAssets.mediaPickerDocument,
                    height: 0.21 * Responsive.getHeight(context),
                  ),
                  title: 'documents',
                ),
              ),
          ],
        ),
      ),
      MyCoButton(
        isShadowBottomLeft: true,
        onTap: () => Navigator.pop(context),
        boarderRadius: 50 * Responsive.getResponsive(context),
        title: 'cancel',
        height: Responsive.isTablet
            ? 0.048 * 2 * Responsive.getHeight(context)
            : 0.048 * Responsive.getHeight(context),
      ),
    ],
  );

  Future<void> _pickImage(ImageSource source) async {
    try {
      final hasPermission = await PermissionUtil.checkPermissionByPickerType(
        source == ImageSource.camera ? 'camera' : 'gallery',
        context,
      );

      if (!hasPermission) return;

      widget.onLoading?.call(true);

      if (source == ImageSource.gallery) {
        await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BlocProvider(
              create: (providerContext) => GalleryPickerBloc(
                maxSelection: widget.maxCount,
                isCropImage: widget.isCropImage,
              ),
              child: GalleryPickerScreen(
                maxSelection: widget.maxCount,
                isCropImage: widget.isCropImage,
                onSelectionDone: (List<dynamic> assets) async {
                  List<File> files = [];

                  if (assets.isNotEmpty && assets.first is File) {
                    files = assets.cast<File>();
                  } else if (assets.isNotEmpty && assets.first is AssetEntity) {
                    for (final asset in assets.cast<AssetEntity>()) {
                      final file = await asset.file;
                      if (file != null) files.add(file);
                    }
                  }

                  if (mounted) {
                    Navigator.pop(context); // Gallery screen
                    Navigator.pop(context, files); // Bottom sheet/dialog
                  }
                },
              ),
            ),
          ),
        );
      } else {
        final XFile? pickedFile = await _picker.pickImage(
          source: source,
          maxWidth: 800,
          maxHeight: 800,
          imageQuality: 80,
        );

        if (pickedFile != null && mounted) {
          Navigator.pop(context, [File(pickedFile.path)]);
        } else {
          if (mounted) Navigator.pop(context);
        }
      }
    } catch (e) {
      debugPrint('Error picking image: $e');
      if (mounted) Navigator.pop(context);
    } finally {
      widget.onLoading?.call(false);
    }
  }

  Future<void> _pickDocument() async {
    try {
      final hasPermission = await PermissionUtil.checkPermissionByPickerType(
        'document',
        context,
      );

      if (!hasPermission) return;

      widget.onLoading?.call(true);

      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf', 'doc', 'docx', 'jpg', 'jpeg', 'heic', 'png'],
      );

      if (result != null && result.files.single.path != null) {
        final File file = File(result.files.single.path!);
        if (mounted) Navigator.pop(context, [file]);
      } else {
        Navigator.pop(context);
      }
    } catch (e) {
      debugPrint('Error picking document: $e');
      if (mounted) Navigator.pop(context);
    } finally {
      widget.onLoading?.call(false);
    }
  }
}
