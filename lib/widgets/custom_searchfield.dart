import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myco_flutter/constants/app_assets.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/language_manager.dart';
import 'package:myco_flutter/core/utils/responsive.dart';

class CustomSearchField extends StatefulWidget {
  final String? hintText;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final VoidCallback? onClear;
  final TextEditingController? controller;
  final bool autofocus;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final Color? backgroundColor;
  final Color? borderColor;
  final double? borderRadius;
  final double? height;
  final TextInputAction? textInputAction;
  final bool enabled;
  final double? cursorHeight;
  final bool isSuffixIconOn;
  final Widget? suffixIcon;

  const CustomSearchField({
    super.key,
    this.hintText,
    this.onChanged,
    this.onSubmitted,
    this.onClear,
    this.controller,
    this.autofocus = false,
    this.margin,
    this.padding,
    this.backgroundColor,
    this.borderColor,
    this.borderRadius,
    this.height,
    this.textInputAction = TextInputAction.search,
    this.enabled = true,
    this.cursorHeight,
    this.isSuffixIconOn = false,
    this.suffixIcon,
  });

  @override
  State<CustomSearchField> createState() => _CustomSearchFieldState();
}

class _CustomSearchFieldState extends State<CustomSearchField> {
  late TextEditingController _controller;
  bool _showClearButton = false;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
    _controller.addListener(_onTextChanged);
    _showClearButton = _controller.text.isNotEmpty;
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _controller.dispose();
    } else {
      _controller.removeListener(_onTextChanged);
    }
    super.dispose();
  }

  void _onTextChanged() {
    setState(() {
      _showClearButton = _controller.text.isNotEmpty;
    });
    if (widget.onChanged != null) {
      widget.onChanged!(_controller.text);
    }
  }

  void _clearText() {
    _controller.clear();
    if (widget.onClear != null) {
      widget.onClear!();
    }
    if (widget.onChanged != null) {
      widget.onChanged!('');
    }
  }

  @override
  Widget build(BuildContext context) => Container(
    margin: widget.margin,
    height: widget.height ?? 0.055 * Responsive.getHeight(context),
    decoration: BoxDecoration(
      color: widget.backgroundColor ?? AppTheme.getColor(context).onPrimary,
      borderRadius: BorderRadius.circular(
        widget.borderRadius ?? 12 * Responsive.getResponsive(context),
      ),
      border: Border.all(
        color: widget.borderColor ?? AppTheme.getColor(context).outline,
      ),
    ),
    child: TextField(
      controller: _controller,
      autofocus: widget.autofocus,
      cursorHeight:
          widget.cursorHeight ?? 16 * Responsive.getResponsiveText(context),
      enabled: widget.enabled,
      textInputAction: widget.textInputAction,
      onSubmitted: widget.onSubmitted,
      decoration: InputDecoration(
        hintText: LanguageManager().get(widget.hintText ?? ''),
        hintStyle: TextStyle(
          color: AppTheme.getColor(context).outline,
          fontSize: 16 * Responsive.getResponsiveText(context),
        ),
        prefixIcon: SvgPicture.asset(AppAssets.searchIcon),

        prefixIconConstraints: BoxConstraints(
          minWidth: 0.1 * Responsive.getWidth(context),
          maxWidth: 0.2 * Responsive.getWidth(context),
          minHeight: 0.02 * Responsive.getHeight(context),
          maxHeight: 0.2 * Responsive.getHeight(context),
        ),
        suffixIcon: widget.isSuffixIconOn
            ? widget.suffixIcon
            : _showClearButton
            ? IconButton(
                icon: Icon(
                  Icons.close,
                  color: AppTheme.getColor(context).outline,
                  size: 20 * Responsive.getResponsive(context),
                ),
                onPressed: _clearText,
                splashRadius: 20,
              )
            : null,
        border: InputBorder.none,
        contentPadding: EdgeInsets.symmetric(
          horizontal:
              widget.padding?.horizontal ??
              16 * Responsive.getResponsive(context),
          vertical:
              widget.padding?.vertical ??
              12 * Responsive.getResponsive(context),
        ),
      ),
      style: TextStyle(
        fontSize: 16 * Responsive.getResponsiveText(context),
        color: AppTheme.getColor(context).onSurface,
      ),
    ),
  );
}
