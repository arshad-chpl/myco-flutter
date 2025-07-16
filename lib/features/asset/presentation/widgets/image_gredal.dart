import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/widgets/cached_image_holder.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

class ImageGridPreviewWidget extends StatelessWidget {
  final List<String> imageList;
  final int containersLength;
  final double? boxHeight;
  final double? boxWidth;
  final bool showIndicators;
  final double borderRadius;
  final Color? selectIndicatorColor;
  final Color? unselectIndicatorColor;

  const ImageGridPreviewWidget({
    super.key,
    required this.imageList,
    this.boxHeight,
    this.boxWidth,
    this.showIndicators = true,
    this.containersLength = 3,
    this.borderRadius = 16.0,
    this.selectIndicatorColor,
    this.unselectIndicatorColor,
  });

  @override
  Widget build(BuildContext context) =>
      _buildStyledImageRow(context, imageList);

  Widget _buildStyledImageRow(BuildContext context, List<String> images) {
    final int totalImages = images.length;
    final int maxVisibleContainers = containersLength.clamp(1, totalImages);
    final List<Widget> imageBoxes = [];

    for (int i = 0; i < maxVisibleContainers; i++) {
      if (i != 0 && i != maxVisibleContainers) {
        imageBoxes.add(const SizedBox(width: 10));
      }

      final bool isLastContainer = i == maxVisibleContainers - 1;
      final bool shouldShowExtra =
          totalImages > containersLength && isLastContainer;
      final int displayIndex = shouldShowExtra ? containersLength - 1 : i;

      imageBoxes.add(
        _imageBox(
          context,
          images,
          displayIndex,
          isExtraBox: shouldShowExtra,
          extraCount: totalImages - (containersLength - 1),
        ),
      );
    }

    return Row(mainAxisSize: MainAxisSize.min, children: imageBoxes);
  }

  Widget _imageBox(
    BuildContext context,
    List<String> images,
    int index, {
    bool isExtraBox = false,
    int extraCount = 0,
  }) {
    final height = boxHeight ?? MediaQuery.of(context).size.width * 0.20;
    final width = boxWidth ?? MediaQuery.of(context).size.width * 0.20;
    final String imageUrl = images[index];

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => _ImagePreview(
              containersLength: containersLength,
              images: images,
              startIndex: index,
              showIndicators: showIndicators,
              selectColor: selectIndicatorColor,
              unselectColor: unselectIndicatorColor,
            ),
          ),
        );
      },
      child: SizedBox(
        width: width,
        height: height,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(borderRadius),
          child: Stack(
            fit: StackFit.expand,
            children: [
              imageUrl.startsWith('http')
                  ? CachedImage(imageUrl: imageUrl)
                  : Image.asset(imageUrl, fit: BoxFit.cover),
              if (isExtraBox)
                Container(
                  width: width,
                  height: height,
                  color: AppColors.gray10,
                  child: Center(
                    child: CustomText(
                      '+$extraCount',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ImagePreview extends StatefulWidget {
  final List<String> images;
  final int? containersLength;
  final int startIndex;
  final bool showIndicators;
  final Color? selectColor;
  final Color? unselectColor;

  const _ImagePreview({
    required this.images,
    required this.startIndex,
    required this.containersLength,
    this.showIndicators = true,
    this.selectColor,
    this.unselectColor,
  });

  @override
  State<_ImagePreview> createState() => _ImagePreviewState();
}

class _ImagePreviewState extends State<_ImagePreview> {
  late final PageController _controller;
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.startIndex;
    _controller = PageController(initialPage: _currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          'Assets',
          fontSize: 20 * Responsive.getResponsiveText(context),
          fontWeight: FontWeight.w700,
        ),
        titleSpacing: 0,
        leading: const BackButton(),
        backgroundColor: AppTheme.getColor(context).surface,
      ),
      body: Center(
        child: Stack(
          children: [
            PageView.builder(
              controller: _controller,
              itemCount: widget.images.length,
              onPageChanged: (index) {
                setState(() => _currentIndex = index);
              },
              itemBuilder: (context, index) => Center(
                child: InteractiveViewer(
                  child: _buildImage(
                    widget.images[index],
                    screenSize.width,
                    screenSize.height,
                  ),
                  // Image(
                  //   image: _getImageProvider(widget.images[index]),
                  //   fit: BoxFit.contain,
                  //   width: screenSize.width,
                  //   height: screenSize.height,
                  // ),
                ),
              ),
            ),

            if (widget.showIndicators)
              Positioned(
                bottom: 0.03 * Responsive.getHeight(context),
                left: 0,
                right: 0,
                child: Visibility(
                  visible: widget.images.length <= 20,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: _buildIndicators(
                      widget.images.length,
                      _currentIndex,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildIndicators(int total, int current) =>
      List.generate(total, (index) {
        final bool isActive = index == current;
        return _dot(isActive);
      });

  Widget _dot(bool isActive) => AnimatedContainer(
    duration: const Duration(milliseconds: 300),
    margin: const EdgeInsets.symmetric(horizontal: 4),
    width: isActive ? 12 : 8,
    height: isActive ? 12 : 8,
    decoration: BoxDecoration(
      color: isActive
          ? widget.selectColor ?? Colors.black
          : widget.unselectColor ?? Colors.grey,
      shape: BoxShape.circle,
    ),
  );

  // ImageProvider _getImageProvider(String path) {
  //   if (path.startsWith('http://') || path.startsWith('https://')) {
  //     return NetworkImage(path);
  //   } else {
  //     return AssetImage(path);
  //   }
  // }
  Widget _buildImage(String path, double width, double height) {
    if (path.startsWith('http://') || path.startsWith('https://')) {
      return CachedImage(
        imageUrl: path,
        fit: BoxFit.contain,
        width: width,
        height: height,
      );
    } else {
      return Image.asset(
        path,
        fit: BoxFit.contain,
        width: width,
        height: height,
      );
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
