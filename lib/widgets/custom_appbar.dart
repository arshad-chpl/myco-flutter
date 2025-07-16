import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

class CustomAppbar extends StatefulWidget implements PreferredSizeWidget {
  final double height;
  final Widget? leading;
  final bool automaticallyImplyLeading;
  final List<Widget>? actions;
  final Widget? flexibleSpace;
  final PreferredSizeWidget? bottom;
  final double? elevation;
  final double? scrolledUnderElevation;
  final ScrollNotificationPredicate notificationPredicate;
  final Color? shadowColor;
  final Color? surfaceTintColor;
  final ShapeBorder? shape;
  final Color? foregroundColor;
  final IconThemeData? iconTheme;
  final IconThemeData? actionsIconTheme;
  final bool primary;
  final bool? centerTitle;
  final bool excludeHeaderSemantics;
  final double? titleSpacing;
  final double toolbarOpacity;
  final double bottomOpacity;
  final double? toolbarHeight;
  final double? leadingWidth;
  final TextStyle? toolbarTextStyle;
  final SystemUiOverlayStyle? systemOverlayStyle;
  final bool forceMaterialTransparency;
  final Clip? clipBehavior;
  final Color? appBarBackgoundColor;
  final String title;
  final FontWeight? titleFontWeight;
  final double? titleFontSize;
  final Color? titileColor;
  final EdgeInsetsGeometry? actionsPadding;
  final bool? isKey;
  final Widget? appBarTitleWidget;

  const CustomAppbar({
    super.key,
    this.titileColor,
    this.leading,
    this.automaticallyImplyLeading = true,
    this.actions,
    this.flexibleSpace,
    this.bottom,
    this.elevation,
    this.scrolledUnderElevation,
    this.notificationPredicate = defaultScrollNotificationPredicate,
    this.shadowColor,
    this.surfaceTintColor,
    this.shape,
    this.foregroundColor,
    this.iconTheme,
    this.actionsIconTheme,
    this.primary = true,
    this.centerTitle,
    this.excludeHeaderSemantics = false,
    this.titleSpacing,
    this.toolbarOpacity = 1.0,
    this.bottomOpacity = 1.0,
    this.toolbarHeight,
    this.leadingWidth,
    this.toolbarTextStyle,
    this.systemOverlayStyle,
    this.forceMaterialTransparency = false,
    this.clipBehavior,
    this.height = kToolbarHeight,
    this.appBarBackgoundColor,
    this.title = '',
    this.titleFontWeight,
    this.titleFontSize, this.actionsPadding, this.isKey, this.appBarTitleWidget,
  });

  @override
  State<CustomAppbar> createState() => _CustomAppbarState();

  @override
  Size get preferredSize => Size.fromHeight(height);
}

class _CustomAppbarState extends State<CustomAppbar> {
  @override
  Widget build(BuildContext context) => AppBar(
    title: widget.appBarTitleWidget??
        CustomText(
          widget.title,
          fontSize: widget.titleFontSize ?? 24 * Responsive.getResponsiveText(context),
          fontWeight: widget.titleFontWeight ?? FontWeight.w700,
          color: widget.titileColor ?? AppTheme.getColor(context).onSurface,
          isKey: widget.isKey??false,
        ),
    backgroundColor:
        widget.appBarBackgoundColor ?? AppTheme.getColor(context).surface,
    leading: widget.automaticallyImplyLeading
        ? (widget.leading ??
        Padding(
          padding: EdgeInsets.all(12 * Responsive.getResponsive(context)),
          child: SvgPicture.asset(
            "assets/svgs/back_arrow.svg",
            height: 16,
            width: 16,
          ),
        ))
        : null,

    ///remove padding if leading is null
    surfaceTintColor: widget.surfaceTintColor,
    elevation: widget.elevation,
    shadowColor: widget.shadowColor,
    shape: widget.shape,
    toolbarHeight:
        widget.toolbarHeight ?? 0.045 * Responsive.getHeight(context),
    toolbarOpacity: widget.toolbarOpacity,
    centerTitle: widget.centerTitle ?? false,
    toolbarTextStyle: widget.toolbarTextStyle,
    foregroundColor: widget.foregroundColor,
    clipBehavior: widget.clipBehavior,
    actions: widget.actions ?? [],
    bottom: widget.bottom,
    bottomOpacity: widget.bottomOpacity,
    flexibleSpace: widget.flexibleSpace,
    excludeHeaderSemantics: widget.excludeHeaderSemantics,
    titleSpacing: widget.titleSpacing ?? 0.011 * Responsive.getWidth(context),
    primary: widget.primary,
    systemOverlayStyle:
        widget.systemOverlayStyle ??
        SystemUiOverlayStyle(
          statusBarColor: AppTheme.getColor(context).surface,
        ),
    forceMaterialTransparency: widget.forceMaterialTransparency,
    key: widget.key,
    actionsIconTheme: widget.actionsIconTheme,
    automaticallyImplyLeading: widget.automaticallyImplyLeading,
    iconTheme: widget.iconTheme,
    leadingWidth: widget.leadingWidth,
    scrolledUnderElevation: widget.scrolledUnderElevation,
    actionsPadding: widget.actionsPadding,
    // notificationPredicate: ,
  );
}
