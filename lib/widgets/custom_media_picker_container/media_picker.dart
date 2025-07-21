import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:myco_flutter/constants/constants.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/app_permissions.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/widgets/custom_loader.dart';
import 'package:myco_flutter/widgets/custom_media_picker_container/custom_shadow_container.dart';
import 'package:myco_flutter/widgets/custom_media_picker_container/gallery_picker_screen.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_text.dart';
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
          // barrierColor: Colors.transparent,
          // barrierDismissible: false,
          builder: (context) => _MediaFilePickerWidget(
            isCameraShow: isCameraShow,
            isGalleryShow: isGalleryShow,
            isDocumentShow: isDocumentShow,
            // onLoading: (val) => setState(() => _isLoading = val),
            maxCount: maxCount,
            isCropImage: isCropImage,
          ),
        );
}

class _AnimatedBottomSheet extends StatefulWidget {
  final bool isCameraShow;
  final bool isGalleryShow;
  final bool isDocumentShow;
  final int maxCount;
  final bool isCropImage;

  const _AnimatedBottomSheet({
    required this.isCameraShow,
    required this.isGalleryShow,
    required this.isDocumentShow,
    required this.maxCount,
    required this.isCropImage,
  });

  @override
  State<_AnimatedBottomSheet> createState() => _AnimatedBottomSheetState();
}

class _AnimatedBottomSheetState extends State<_AnimatedBottomSheet>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0.0, 1.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _setLoading(bool value) {
    setState(() => _isLoading = value);
  }

  @override
  Widget build(BuildContext context) => Stack(
    children: [
      GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Container(color: AppColors.black.withValues(alpha: 0.3)),
      ),
      Align(
        alignment: Alignment.bottomCenter,
        child: SlideTransition(
          position: _offsetAnimation,
          child: Material(
            color: Colors.transparent,
            child: Container(
              constraints: const BoxConstraints(maxHeight: 400),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
              ),
              child: _MediaFilePickerWidget(
                isCameraShow: widget.isCameraShow,
                isGalleryShow: widget.isGalleryShow,
                isDocumentShow: widget.isDocumentShow,
                onLoading: _setLoading,
                maxCount: widget.maxCount,
                isCropImage: widget.isCropImage,
              ),
            ),
          ),
        ),
      ),
      if (_isLoading)
        Container(
          color: AppColors.black.withValues(alpha: 0.3),
          child: const Center(child: CustomLoader()),
        ),
    ],
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
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 16.0),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomText(
          'Select option',
          fontSize: 18 * Responsive.getResponsiveText(context),
          fontWeight: FontWeight.w700,
          color: AppTheme.getColor(context).outline,
        ),
        const Divider(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              if (widget.isCameraShow)
                GestureDetector(
                  onTap: () => _pickImage(ImageSource.camera),
                  child: CustomShadowContainer(
                    image: Image.asset('assets/media_picker/camera.png'),
                    title: 'Camera',
                  ),
                ),
              if (widget.isCameraShow) const SizedBox(width: 20),
              if (widget.isGalleryShow)
                GestureDetector(
                  onTap: () => _pickImage(ImageSource.gallery),
                  child: CustomShadowContainer(
                    image: Image.asset('assets/media_picker/gallery-add.png'),
                    title: 'Gallery',
                  ),
                ),
              if (widget.isGalleryShow) const SizedBox(width: 20),
              if (widget.isDocumentShow)
                GestureDetector(
                  onTap: _pickDocument,
                  child: CustomShadowContainer(
                    image: Image.asset(
                      'assets/media_picker/document.png',
                      width: 80,
                      height: 80,
                      fit: BoxFit.contain,
                    ),
                    title: 'Documents',
                  ),
                ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: MyCoButton(
            isShadowBottomLeft: true,
            onTap: () => Navigator.pop(context),
            boarderRadius: 50,
            title: 'Cancel',
          ),
        ),
      ],
    ),
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
        print(
          'widget.isCropImage:----------------------------------${widget.isCropImage}',
        );
        await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => GalleryPickerScreen(
              maxSelection: widget.maxCount,
              isCropImage: widget.isCropImage,
              onSelectionDone: (List<dynamic> assets) async {
                List<File> files = [];

                // If cropping was enabled, assets will already be List<File>
                if (assets.isNotEmpty && assets.first is File) {
                  files = assets.cast<File>();
                }
                // If cropping wasn't enabled, assets will be List<AssetEntity>
                else if (assets.isNotEmpty && assets.first is AssetEntity) {
                  for (final asset in assets.cast<AssetEntity>()) {
                    final file = await asset.file;
                    if (file != null) files.add(file);
                  }
                }

                if (mounted) {
                  Navigator.pop(context); // Close GalleryPickerScreen
                  Navigator.pop(context, files); // Send selected files back
                }
              },
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
          final file = File(pickedFile.path);
          Navigator.pop(context, [file]);
        } else {
          if (mounted) Navigator.pop(context);
        }
      }
    } catch (e) {
      print("Error picking image: $e");
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
      print("Error picking document: $e");
      if (mounted) Navigator.pop(context);
    } finally {
      widget.onLoading?.call(false);
    }
  }
}
