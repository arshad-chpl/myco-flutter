import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';



class ExpandableFabAction {
  final String label;
  final String? iconPath;
  final IconData? icon;
  final VoidCallback onTap;

  ExpandableFabAction({
    required this.label,
    this.iconPath,
    this.icon,
    required this.onTap,
  }) : assert(
         iconPath != null || icon != null,
         'Provide either iconPath or icon.',
       );
}

class ExpandableFab extends StatefulWidget {
  final List<ExpandableFabAction> actions;
  final double imageSize;
  final IconData openIcon;
  final IconData closeIcon;
  final VoidCallback? onTap;
  final double? innericonsize;
  final double? innerimageheight;
  final double? innerimagewidth;
  final double? circleavataradius;
  final Color? innericonbgr;
  final EdgeInsetsGeometry ? margin;
  final EdgeInsetsGeometry ? padding;
  final Decoration ? decoration;

  const ExpandableFab({
    super.key,
    required this.actions,
    required this.openIcon,
    required this.closeIcon,
    this.onTap,
    this.imageSize = 60,
    this.innericonsize,
    this.innerimageheight,
    this.innerimagewidth,
    this.innericonbgr,
    this.circleavataradius,
    this.margin,
    this.padding,
    this.decoration,
  });

  @override
  State<ExpandableFab> createState() => _ExpandableFabState();
}

class _ExpandableFabState extends State<ExpandableFab>
    with SingleTickerProviderStateMixin {
  bool _isExpanded = false;
  late final AnimationController _controller;
  late final Animation<double> _fadeAnimation;
  late final Animation<double> _textAnimation;
  final String _closeText = "CLOSE";

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );

    // ✅ Initialize _textAnimation AFTER _controller is ready
    _textAnimation = Tween<double>(
      begin: 0,
      end: _closeText.length.toDouble(),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.3, 1.0, curve: Curves.easeInOut),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggle() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) => Column(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      ...widget.actions.asMap().entries.map((entry) {
        final index = entry.key;
        final action = entry.value;
        return FadeTransition(
          opacity: _fadeAnimation,
          child: SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0, 0.3),
              end: Offset.zero,
            ).animate(
              CurvedAnimation(
                parent: _controller,
                curve: Interval(0.0, 1.0 - index * 0.1, curve: Curves.easeOut),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: _buildOption(
                action,
                widget.innericonsize,
                widget.innerimageheight,
                widget.innerimagewidth,
                widget.circleavataradius,
                widget.innericonbgr,
                widget.margin,
                widget.padding,
                widget.decoration,
              ),
            ),
          ),
        );
      }),
      GestureDetector(
        onTap: widget.onTap ?? _toggle,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          height: widget.imageSize,
          width: _isExpanded ? 130 : widget.imageSize,
          padding:
              _isExpanded
                  ? const EdgeInsets.symmetric(horizontal: 5)
                  : EdgeInsets.zero,
          decoration:BoxDecoration(
            color: AppTheme.getColor(context).primary,
            borderRadius: BorderRadius.circular(_isExpanded ? 30 : 100),
            boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 4)],
          ),
          child: Center(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              transitionBuilder:
                  (child, animation) =>
                      FadeTransition(opacity: animation, child: child),
              child:
                  _isExpanded
                      ? Row(
                        key: const ValueKey('close'),
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(widget.closeIcon, size: 35, color: Colors.white),
                          const SizedBox(width: 8),
                          AnimatedBuilder(
                            animation: _textAnimation,
                            builder: (context, child) {
                              final visibleCharCount = _textAnimation.value
                                  .ceil()
                                  .clamp(0, _closeText.length);
                              final visibleText = _closeText.substring(
                                0,
                                visibleCharCount,
                              );
                              return Text(
                                visibleText,
                                maxLines: 1,
                                overflow: TextOverflow.clip,
                                softWrap: false,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.1,
                                ),
                              );
                            },
                          ),
                        ],
                      )
                      : FittedBox(
                        key: const ValueKey('open'),
                        fit: BoxFit.cover,
                        child: Icon(
                          widget.openIcon,
                          color: Colors.white,
                          size: widget.imageSize * 0.9,
                        ),
                      ),
            ),
          ),
        ),
      ),
    ],
  );

  Widget _buildOption(
    ExpandableFabAction action,
    double? innericonsize,
    double? innerimageheight,
    double? innerimagewidth,
    double? circleavataradius,
    Color? innericonbgr,
    EdgeInsetsGeometry?margin,
    EdgeInsetsGeometry?padding,
    Decoration? decoration,
  ) => Row(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      GestureDetector(
        onTap: action.onTap,
        child: Container(
          margin: margin ?? const EdgeInsets.only(right: 10),
          padding: padding ??const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
          decoration:decoration?? BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 5)],
          ),
          child: Text(
            action.label,
            style: const TextStyle(
              color: AppColors.primary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
      CircleAvatar(
        backgroundColor:innericonbgr?? Colors.white,
        radius: circleavataradius ?? 23,
        child:
            action.iconPath != null
                ? Image.asset(
                  action.iconPath!,
                  fit: BoxFit.cover,
                  width: innerimagewidth ?? 30,
                  height: innerimageheight ?? 30,
                )
                : Icon(
                  action.icon,
                  size: innericonsize ?? 25,
                  color: AppColors.primary,
                ),
      ),
    ],
  );
}