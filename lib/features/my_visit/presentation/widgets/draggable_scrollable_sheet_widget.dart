import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/responsive.dart';

class DraggableScrollableSheetWidget extends StatefulWidget {
  final Widget showBottomSheet;

  const DraggableScrollableSheetWidget({
    required this.showBottomSheet,
    super.key,
  });

  @override
  State<DraggableScrollableSheetWidget> createState() =>
      _DraggableScrollableSheetWidgetState();
}

class _DraggableScrollableSheetWidgetState
    extends State<DraggableScrollableSheetWidget> {
  @override
  Widget build(BuildContext context) => DraggableScrollableSheet(
    expand: false,
    initialChildSize: 0.9,
    maxChildSize: 0.95,
    minChildSize: 0.6,
    builder: (context, scrollController) => Stack(
      children: [
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
          child: ClipRRect(
            borderRadius: BorderRadiusGeometry.vertical(
              top: Radius.circular(13 * Responsive.getResponsive(context)),
            ),
            child: Container(color: AppTheme.getColor(context).surface),
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Material(
            color: Colors.transparent,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(13 * Responsive.getResponsive(context)),
                ),
              ),
              child: widget.showBottomSheet,
            ),
          ),
        ),
      ],
    ),
  );
}
