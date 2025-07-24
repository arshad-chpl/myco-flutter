import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myco_flutter/constants/app_assets.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/widgets/media_picker/widgets/design_border_container.dart';
import 'package:myco_flutter/widgets/media_picker/screens/gallery_picker_screen.dart';
import 'package:myco_flutter/widgets/media_picker/widgets/media_picker.dart';
import 'package:myco_flutter/widgets/media_picker/bloc/media_picker_bloc/media_picker_bloc.dart';
import 'package:myco_flutter/widgets/media_picker/bloc/media_picker_bloc/media_picker_event.dart';
import 'package:myco_flutter/widgets/media_picker/bloc/media_picker_bloc/media_picker_state.dart';
import 'package:myco_flutter/widgets/custom_text.dart';
import 'package:path/path.dart' as path;

class CustomMediaPickerContainer extends StatelessWidget {
  final double? imageMargin,
      containerHeight,
      titleFontSize,
      imageTitleSize,
      imageHeight,
      imageWidth;
  final String? title;
  final String imageTitle;
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
    this.title,
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
  Widget build(BuildContext context) => BlocProvider(
    create: (_) => CustomMediaPickerBloc(),
    child: BlocListener<CustomMediaPickerBloc, CustomMediaPickerState>(
      listenWhen: (previous, current) => previous != current,
      listener: (context, state) {
        if (onSelectedMedia != null) {
          if (state.document != null) {
            onSelectedMedia!.call([state.document!]);
          } else {
            onSelectedMedia!.call(state.images);
          }
        }
      },
      child: _MediaPickerContent(
        title: title,
        imageTitle: imageTitle,
        imagePath: imagePath,
        imageMargin: imageMargin,
        containerHeight: containerHeight,
        titleFontSize: titleFontSize,
        imageTitleSize: imageTitleSize,
        imageHeight: imageHeight,
        multipleImage: multipleImage,
        titleColor: titleColor,
        backgroundColor: backgroundColor,
        imageTitleColor: imageTitleColor,
        isCameraShow: isCameraShow,
        isGalleryShow: isGalleryShow,
        isDocumentShow: isDocumentShow,
        isCropImage: isCropImage,
        titleIsKey: titleIsKey,
        imageTitleIsKey: imageTitleIsKey,
      ),
    ),
  );
}

class _MediaPickerContent extends StatelessWidget {
  final double? imageMargin,
      containerHeight,
      titleFontSize,
      imageTitleSize,
      imageHeight;
  final String? title;
  final String imageTitle;
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

  const _MediaPickerContent({
    required this.imageTitle,
    required this.imagePath,
    required this.multipleImage,
    this.imageMargin,
    this.containerHeight,
    this.titleFontSize,
    this.imageTitleSize,
    this.imageHeight,
    this.title,
    this.titleColor,
    this.backgroundColor,
    this.imageTitleColor,
    this.isCameraShow = false,
    this.isGalleryShow = false,
    this.isDocumentShow = false,
    this.isCropImage = false,
    this.titleIsKey = false,
    this.imageTitleIsKey = false,
    this.onSelectedMedia,
    super.key,
  });

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<CustomMediaPickerBloc, CustomMediaPickerState>(
        builder: (context, state) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (title != null)
              CustomText(
                title!,
                isKey: titleIsKey,
                fontSize:
                    titleFontSize ?? 14 * Responsive.getResponsiveText(context),
                fontWeight: FontWeight.w700,
                color:
                    titleColor ?? AppTheme.getColor(context).onSurfaceVariant,
              ),
            SizedBox(height: 0.008 * Responsive.getHeight(context)),
            if (state.images.isNotEmpty)
              _buildImageGrid(context, state.images)
            else if (state.document != null)
              _buildDocumentPreview(context, state.document!)
            else
              _buildInitialPicker(context),
          ],
        ),
      );

  Widget _buildImageGrid(
    BuildContext context,
    List<File> images,
  ) => DesignBorderContainer(
    borderRadius: 8 * Responsive.getResponsive(context),
    borderColor: AppTheme.getColor(context).primary,
    backgroundColor: AppTheme.getColor(context).surface,
    padding: const EdgeInsets.all(0),
    child: Padding(
      padding: EdgeInsets.all(
        imageMargin ?? 10 * Responsive.getResponsive(context),
      ),
      child: GridView.count(
        crossAxisCount: 4,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        childAspectRatio: 0.75,
        children: List.generate(
          images.length < multipleImage ? images.length + 1 : images.length,
          (index) {
            if (images.length < multipleImage && index == images.length) {
              return GestureDetector(
                onTap: () => openMediaPicker(context, images.length),
                child: Container(
                  decoration: BoxDecoration(
                    color: AppTheme.getColor(context).surface,
                    borderRadius: BorderRadius.circular(
                      10 * Responsive.getResponsive(context),
                    ),
                    border: Border.all(
                      color: AppTheme.getColor(context).primary,
                    ),
                  ),
                  child: Icon(
                    Icons.add,
                    size: 30 * Responsive.getResponsive(context),
                    color: AppTheme.getColor(context).primary,
                  ),
                ),
              );
            }
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  10 * Responsive.getResponsive(context),
                ),
                border: Border.all(color: AppTheme.getColor(context).primary),
              ),
              padding: EdgeInsets.all(8 * Responsive.getResponsive(context)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(
                        8 * Responsive.getResponsive(context),
                      ),
                      child: Image.file(
                        images[index],
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 0.008 * Responsive.getHeight(context)),
                  GestureDetector(
                    onTap: () => context.read<CustomMediaPickerBloc>().add(
                      RemoveMediaFile(index),
                    ),
                    child: SvgPicture.asset(
                      AppAssets.trash,
                      height: 0.020 * Responsive.getHeight(context),
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

  Widget _buildDocumentPreview(BuildContext context, File document) =>
      DesignBorderContainer(
        borderRadius: 10 * Responsive.getResponsive(context),
        borderColor: AppTheme.getColor(context).primary,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              Icons.insert_drive_file,
              color: AppTheme.getColor(context).primary,
              size: 25 * Responsive.getResponsive(context),
            ),
            SizedBox(width: 0.010 * Responsive.getWidth(context)),
            Expanded(
              child: CustomText(
                path.basename(document.path),
                fontSize: 16 * Responsive.getResponsiveText(context),
                fontWeight: FontWeight.w500,
                color: AppTheme.getColor(context).onSurfaceVariant,
              ),
            ),
            GestureDetector(
              onTap: () =>
                  context.read<CustomMediaPickerBloc>().add(RemoveDocument()),
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: 0.002 * Responsive.getHeight(context),
                  horizontal: 0.01 * Responsive.getWidth(context),
                ),
                decoration: BoxDecoration(
                  color: AppColors.removeBackground,
                  border: Border.all(color: AppTheme.getColor(context).error),
                  borderRadius: BorderRadius.circular(
                    4 * Responsive.getResponsive(context),
                  ),
                ),
                child: CustomText(
                  'remove',
                  isKey: true,
                  fontSize: 12 * Responsive.getResponsiveText(context),
                  fontWeight: FontWeight.w700,
                  color: AppColors.error,
                ),
              ),
            ),
          ],
        ),
      );

  Widget _buildInitialPicker(BuildContext context) => GestureDetector(
    onTap: () => openMediaPicker(context, 0),
    child: DesignBorderContainer(
      borderRadius: 12 * Responsive.getResponsive(context),
      borderColor: AppTheme.getColor(context).primary,
      backgroundColor: backgroundColor ?? AppTheme.getColor(context).surface,
      padding: EdgeInsets.all(10 * Responsive.getResponsive(context)),
      child: SizedBox(
        width: double.infinity,
        height:
            containerHeight ??
            (Responsive.isTablet(context)
                ? 0.3 * Responsive.getHeight(context)
                : 0.1  * Responsive.getHeight(context)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              imagePath.isNotEmpty ? imagePath : AppAssets.assetGalleryExport,
              height:
                  imageHeight ??
                  (Responsive.isTablet(context)
                      ? 0.10 * Responsive.getHeight(context)
                      : 0.03 * Responsive.getHeight(context)),
            ),
            SizedBox(height: 0.006 * Responsive.getHeight(context)),
            CustomText(
              imageTitle,
              isKey: imageTitleIsKey,
              fontSize:
                  imageTitleSize ?? 16 * Responsive.getResponsiveText(context),
              fontWeight: FontWeight.w600,
              color:
                  imageTitleColor ??
                  AppTheme.getColor(context).onSurfaceVariant,
            ),
          ],
        ),
      ),
    ),
  );

  void openMediaPicker(BuildContext context, int currentCount) async {
    final remainingCount = multipleImage - currentCount;
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
    if (isGalleryShow && !isCameraShow && !isDocumentShow) {
      selectedFiles = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => GalleryPickerScreen(
            maxSelection: remainingCount,
            onSelectionDone: (assets) async {
              Navigator.pop(context, assets);
            },
          ),
        ),
      );
    } else {
      selectedFiles = await showMediaFilePicker(
        context: context,
        maxCount: remainingCount,
        isCameraShow: isCameraShow,
        isGalleryShow: isGalleryShow,
        isDocumentShow: isDocumentShow,
        isCropImage: isCropImage,
      );
    }

    if (selectedFiles == null || selectedFiles.isEmpty) {
      log('User cancelled or error occurred.');
      return;
    }

    context.read<CustomMediaPickerBloc>().add(AddMediaFiles(selectedFiles));
    final state = context.read<CustomMediaPickerBloc>().state;
    onSelectedMedia?.call(
      state.document != null ? [state.document!] : state.images,
    );
  }
}
