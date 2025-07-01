import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

class MyCoDialog extends StatelessWidget {
  final String title;
  final String? description;
  final Widget? image;
  final List<Widget> actions;
  final bool isBottomSheet;
  final bool? isDescriptionThere;

  const MyCoDialog({
    super.key,
    required this.title,
    this.description,
    this.image,
    required this.actions,
    this.isBottomSheet = false,
    this.isDescriptionThere,
  });

  @override
  Widget build(BuildContext context) {
    final content = _MyCoDialogContent(
      title: title,
      description: description,
      image: image,
      actions: actions,
    );

    if (isBottomSheet) {
      return _MyCoBottomSheetWrapper(child: content);
    } else {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12 * getResponsive(context)),
        ),
        backgroundColor: Theme.of(context).cardColor,
        child: content,
      );
    }
  }
}

class _MyCoBottomSheetWrapper extends StatelessWidget {
  final Widget child;

  const _MyCoBottomSheetWrapper({required this.child});

  @override
  Widget build(BuildContext context) => Padding(
    padding: EdgeInsets.only(
      bottom: MediaQuery.of(context).viewInsets.bottom,
      left: 20 * getResponsive(context),
      right: 20 * getResponsive(context),
      top: 10 * getResponsive(context),
    ),
    child: SingleChildScrollView(child: child),
  );
}

class _MyCoDialogContent extends StatelessWidget {
  final String title;
  final String? description;
  final Widget? image;
  final List<Widget> actions;

  const _MyCoDialogContent({
    required this.title,
    this.description,
    this.image,
    required this.actions,
  });

  @override
  Widget build(BuildContext context) => Padding(
    padding: EdgeInsets.symmetric(
      horizontal: 20 * getResponsive(context),
      vertical: 24 * getResponsive(context),
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (image != null) ...[
          image!,
          SizedBox(height: .016 * getHeight(context)),
        ],
        CustomText(
          title,
          fontSize: 18 * getResponsiveText(context),
          fontWeight: FontWeight.bold,
          color: AppTheme.getColor(context).onSurface,
          textAlign: TextAlign.center,
        ),
        if (description != null && description!.isNotEmpty) ...[
          SizedBox(height: .016 * getHeight(context)),
          CustomText(
            description!,
            fontSize: 16 * getResponsive(context),
            textAlign: TextAlign.center,
          ),
        ],
        SizedBox(height: .035 * getHeight(context)),
        GridView.builder(
          shrinkWrap: true,
          itemCount: actions.length,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: actions.length >= 3 ? 3 : actions.length,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 2.5,
          ),
          itemBuilder: (context, index) => actions[index],
        ),
      ],
    ),
  );
}
