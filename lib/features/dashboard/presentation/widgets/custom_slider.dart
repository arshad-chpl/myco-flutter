import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomSlider extends StatefulWidget {
  final List<String> imagePaths;
  final bool isCarousel;
  final bool showBottomShadow;
  final bool showIndicator;
  final bool isPreviewEnabled;
  final bool isButton;
  final double? height;
  final double? width;
  final Duration switchDuration;
  final Duration animationDuration;
  final Color? activeIndicatorColor;
  final Color? inactiveIndicatorColor;

  const CustomSlider({
    super.key,
    required this.imagePaths,
    this.isCarousel = false,
    this.showBottomShadow = false,
    this.showIndicator = true,
    this.height = 200,
    this.width = double.infinity,
    this.switchDuration = const Duration(seconds: 3),
    this.animationDuration = const Duration(milliseconds: 500),
    this.activeIndicatorColor,
    this.inactiveIndicatorColor,
    this.isPreviewEnabled = false,
    this.isButton = true,
  });

  @override
  State<CustomSlider> createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider>
    with WidgetsBindingObserver {
  late final PageController _controller;
  late final List<ImageProvider<Object>> _images;
  Timer? _timer;

  static const int _initialPage = 1000;
  int _currentIndex = _initialPage;

  List<ImageProvider<Object>> get _imageProviders {
    return widget.imagePaths.map<ImageProvider<Object>>((path) {
      if (path.startsWith('http://') || path.startsWith('https://')) {
        return CachedNetworkImageProvider(path);
      } else {
        return AssetImage(path);
      }
    }).toList();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _images = _imageProviders;
    _controller = PageController(initialPage: _initialPage);

    if (_images.isNotEmpty) {
      _startAutoSlide();
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  void _startAutoSlide() {
    _timer?.cancel(); // Cancel any existing timer
    _timer = Timer.periodic(widget.switchDuration, (_) {
      if (_controller.hasClients) {
        _currentIndex++;
        _controller.animateToPage(
          _currentIndex,
          duration: widget.animationDuration,
          curve: Curves.easeInOut,
        );
      }
    });
  }

  void _stopAutoSlide() {
    _timer?.cancel();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused ||
        state == AppLifecycleState.inactive) {
      _stopAutoSlide(); // Stop when app is in background or inactive
    } else if (state == AppLifecycleState.resumed) {
      _startAutoSlide(); // Resume when app comes to foreground
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_images.isEmpty) return const SizedBox();

    return SizedBox(
      height: widget.height ?? 200,
      width: widget.width ?? double.infinity,
      child: Stack(
        children: [
          PageView.builder(
            controller: _controller,
            itemBuilder: (context, index) {
              final realIndex = index % _images.length;
              final image = _images[realIndex];

              return Padding(
                padding: const EdgeInsets.all(5.0),
                child: GestureDetector(
                  onTap: () {
                    if (widget.isPreviewEnabled) {
                      showDialog(
                        context: context,
                        barrierColor: Colors.black.withOpacity(0.8),
                        builder: (_) => AlertDialog(
                          backgroundColor: Colors.transparent,
                          insetPadding: const EdgeInsets.all(10),
                          contentPadding: EdgeInsets.zero,
                          content: _ImagePreviewDialog(
                            isButton: widget.isButton,
                            imagePath:
                                widget.imagePaths[_currentIndex % _images.length],
                          ),
                        ),
                      );
                    }
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Stack(
                      children: [
                        Positioned.fill(
                          child: Image(image: image, fit: BoxFit.cover),
                        ),
                        if (widget.showBottomShadow)
                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            height: 40,
                            child: Container(
                              decoration: const BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 20,
                                    spreadRadius: 5,
                                  ),
                                ],
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              );
            },
            physics: widget.isCarousel
                ? const BouncingScrollPhysics()
                : const NeverScrollableScrollPhysics(),
            onPageChanged: (index) {
              setState(() => _currentIndex = index);
            },
          ),
          if (widget.showIndicator)
            Positioned(
              bottom: 10,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(_images.length, (index) {
                  final isActive = (_currentIndex % _images.length) == index;
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: isActive ? 10 : 6,
                    height: isActive ? 10 : 6,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: isActive
                          ? (widget.activeIndicatorColor ?? Colors.white)
                          : (widget.inactiveIndicatorColor ??
                              Colors.white.withOpacity(0.4)),
                    ),
                  );
                }),
              ),
            ),
        ],
      ),
    );
  }
}

class _ImagePreviewDialog extends StatelessWidget {
  final String imagePath;
  final bool? isButton;

  const _ImagePreviewDialog({required this.imagePath, this.isButton = true});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width * 0.9,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AspectRatio(
              aspectRatio: 16 / 9,
              child: imagePath.startsWith('http')
                  ? CachedNetworkImage(
                      imageUrl: imagePath,
                      fit: BoxFit.contain,
                      placeholder: (context, url) =>
                          const Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    )
                  : Image.asset(imagePath, fit: BoxFit.contain),
            ),
            const SizedBox(height: 10),
            if (isButton == true)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.share, color: Colors.white),
                      onPressed: () {
                        Navigator.pop(context);
                        // Add your share logic
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.download, color: Colors.white),
                      onPressed: () {
                        Navigator.pop(context);
                        // Add your download logic
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.language, color: Colors.white),
                      onPressed: () {
                        Navigator.pop(context);
                        // Add your delete logic
                      },
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}