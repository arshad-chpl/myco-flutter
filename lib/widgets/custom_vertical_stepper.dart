import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myco_flutter/constants/app_assets.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/lost_and_found/presentation/widgets/custom_inner_shadow.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

enum StepStatus { pending, approved, completed, denied, authorized, inActive }

class StepDetail {
  final String title, description;
  final double? titleFontSize, descriptionFontSize, separatorFontSize;
  final FontWeight? titleFontWeight, descriptionFontWeight, separatorFontWeight;
  final Color? titleTextColor, descriptionTextColor, separatorColor;

  StepDetail({
    required this.title,
    required this.description,
    this.titleFontSize,
    this.descriptionFontSize,
    this.separatorFontSize,
    this.titleFontWeight,
    this.descriptionFontWeight,
    this.separatorFontWeight,
    this.titleTextColor,
    this.descriptionTextColor,
    this.separatorColor,
  });
}

class SubStepData {
  final String? subStepTitle, subStepSubTitle, subStepTrailingTitle;
  final StepStatus? subStepStatus;
  final bool isSubStepIconShow;
  final Color? subStepStatusColor,
      subStepTitleColor,
      subStepSubTitleColor,
      subStepTrailingTitleColor;
  final Widget? subStepCustomStatusIcon;
  final double? subStepTitleFontSize,
      subStepSubTitleFontSize,
      subStepTrailingFontSize;
  final FontWeight? subStepTitleFontWeight, subStepSubTitleFontWeight;

  SubStepData({
    this.subStepTitle,
    this.subStepSubTitle,
    this.subStepTrailingTitle,
    this.subStepStatus,
    this.subStepStatusColor,
    this.subStepTitleColor,
    this.subStepSubTitleColor,
    this.subStepTrailingTitleColor,
    this.subStepCustomStatusIcon,
    this.subStepTitleFontSize,
    this.subStepSubTitleFontSize,
    this.subStepTrailingFontSize,
    this.subStepTitleFontWeight,
    this.subStepSubTitleFontWeight,
    this.isSubStepIconShow = true,
  });
}

class StepData {
  final String title;
  final String? subTitle, trillingTitle;
  final StepStatus status;
  final List<StepDetail>? details;
  final List<SubStepData>? subSteps;
  final Color? statusColor, titleColor, subTitleColor, trailingTitleColor;
  final bool isStepIconShow;
  final Widget? customStatusIcon;
  final double? titleFontSize, subTitleFontSize, trillingTitleFontSize;
  final FontWeight? titleFontWeight,
      subTitleFontWeight,
      trillingTitleFontWeight;

  StepData({
    required this.title,
    required this.status,
    this.subTitle,
    this.trillingTitle,
    this.details,
    this.subSteps,
    this.statusColor,
    this.titleColor,
    this.subTitleColor,
    this.trailingTitleColor,
    this.isStepIconShow = true,
    this.customStatusIcon,
    this.titleFontSize,
    this.trillingTitleFontSize,
    this.subTitleFontSize,
    this.titleFontWeight,
    this.trillingTitleFontWeight,
    this.subTitleFontWeight,
  });
}

class CustomVerticalStepper extends StatelessWidget {
  final List<StepData> steps;

  const CustomVerticalStepper({required this.steps, super.key});

  List<StepStatus> getEffectiveStatuses() {
    final List<StepStatus> originalStatuses = List.from(
      steps.map((e) => e.status),
    );
    final List<StepStatus> effectiveStatuses = List.of(originalStatuses);

    final int firstInActiveIndex = originalStatuses.indexWhere(
      (status) => status == StepStatus.inActive,
    );

    if (firstInActiveIndex == -1) {
      // No inActive
      StepStatus? lastStatus;
      for (int i = originalStatuses.length - 1; i >= 0; i--) {
        if (originalStatuses[i] != StepStatus.inActive) {
          lastStatus = originalStatuses[i];
          break;
        }
      }
      if (lastStatus != null) {
        for (int i = 0; i < originalStatuses.length - 1; i++) {
          effectiveStatuses[i] = lastStatus;
        }
      }
      return effectiveStatuses;
    }

    // Found inActive
    StepStatus? lastActiveStatus;
    for (int i = firstInActiveIndex - 1; i >= 0; i--) {
      if (originalStatuses[i] != StepStatus.inActive) {
        lastActiveStatus = originalStatuses[i];
        break;
      }
    }

    if (lastActiveStatus != null) {
      for (int i = 0; i < firstInActiveIndex; i++) {
        effectiveStatuses[i] = lastActiveStatus;
      }
    }

    for (int i = firstInActiveIndex; i < effectiveStatuses.length; i++) {
      effectiveStatuses[i] = StepStatus.inActive;
    }

    return effectiveStatuses;
  }

  @override
  Widget build(BuildContext context) {
    final effectiveStatuses = getEffectiveStatuses();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(
        steps.length,
        (index) => _MainStepWidget(
          step: steps[index],
          index: index,
          isLast: index == steps.length - 1,
          effectiveStatus: effectiveStatuses[index],
        ),
      ),
    );
  }
}

class _MainStepWidget extends StatelessWidget {
  final StepData step;
  final int index;
  final bool isLast;
  final StepStatus effectiveStatus;

  const _MainStepWidget({
    required this.step,
    required this.index,
    required this.isLast,
    required this.effectiveStatus,
  });

  Color getColorForStatus(StepStatus status) {
    switch (status) {
      case StepStatus.completed:
        return AppColors.secondary;
      case StepStatus.approved:
        return AppColors.secondary;
      case StepStatus.pending:
        return AppColors.spanishYellow;
      case StepStatus.denied:
        return AppColors.stepperDenied;
      case StepStatus.authorized:
        return AppColors.secondary;
      case StepStatus.inActive:
        return AppColors.stepperDisabledTitle;
    }
  }

  Widget getIconWidgetForStatus(
    StepStatus status,
    BuildContext context, {
    Widget? customIcon,
  }) {
    final bool isWideScreen = Responsive.screenWidth() > 600;
    final double iconSize = isWideScreen
        ? 0.040 * Responsive.getHeight(context)
        : 0.013 * Responsive.getHeight(context);
    if (customIcon != null) {
      return SizedBox(
        height: iconSize,
        width: iconSize,
        child: FittedBox(fit: BoxFit.scaleDown, child: customIcon),
      );
    }

    switch (status) {
      case StepStatus.approved:
      case StepStatus.completed:
        return SvgPicture.asset(
          AppAssets.stepperCheckIcon,
          height: iconSize,
          width: iconSize,
        );

      case StepStatus.denied:
        return Icon(Icons.close, color: AppColors.white, size: iconSize);

      case StepStatus.authorized:
        return Icon(Icons.lock_outline, color: AppColors.white, size: iconSize);

      case StepStatus.pending:
        return Icon(
          Icons.hourglass_top,
          color: AppColors.white,
          size: iconSize,
        );

      case StepStatus.inActive:
        return const SizedBox();
    }
  }

  Widget _buildMainCircle(BuildContext context) {
    final color = getColorForStatus(effectiveStatus);

    return Stack(
      alignment: Alignment.center,
      children: [
        InnerShadowContainer(
          height: Responsive.screenWidth() > 600
              ? 0.042 * Responsive.getWidth(context)
              : 0.028 * Responsive.getHeight(context),
          width: Responsive.screenWidth() > 600
              ? 0.042 * Responsive.getWidth(context)
              : 0.028 * Responsive.getHeight(context),
          borderRadius: 20,
          backgroundColor: AppColors.white,
          isShadowTopLeft: true,
        ),
        InnerShadowContainer(
          height: Responsive.screenWidth() > 600
              ? 0.070 * Responsive.getHeight(context)
              : 0.020 * Responsive.getHeight(context),
          width: Responsive.screenWidth() > 600
              ? 0.032 * Responsive.getWidth(context)
              : 0.020 * Responsive.getHeight(context),
          borderRadius: 15,
          backgroundColor: color,
          isShadowBottomLeft: true,
          child: step.isStepIconShow
              ? Center(
                  child: getIconWidgetForStatus(
                    step.status,
                    context,
                    customIcon: step.customStatusIcon,
                  ),
                )
              : const SizedBox.shrink(),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final color = getColorForStatus(effectiveStatus);
    final titleColor = step.titleColor ?? color;
    final subTitleColor = step.subTitleColor;
    final trailingColor = step.trailingTitleColor;

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              _buildMainCircle(context),
              if (!isLast)
                Flexible(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: 0.040 * Responsive.getHeight(context),
                    ),
                    child: InnerShadowContainer(
                      width: 2,
                      isShadowBottomLeft: true,
                      borderRadius: 0,
                      backgroundColor: color,
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CustomText(
                        step.title,
                        fontSize:
                            step.titleFontSize ??
                            14 * Responsive.getResponsiveText(context),
                        fontWeight: step.titleFontWeight ?? FontWeight.w600,
                        color: titleColor,
                      ),
                      const Spacer(),
                      if (step.trillingTitle != null)
                        CustomText(
                          step.trillingTitle!,
                          fontSize:
                              step.trillingTitleFontSize ??
                              12 * Responsive.getResponsiveText(context),
                          fontWeight:
                              step.trillingTitleFontWeight ?? FontWeight.w400,
                          color: trailingColor,
                          overflow: TextOverflow.ellipsis,
                        ),
                    ],
                  ),
                  if (step.subTitle != null)
                    CustomText(
                      step.subTitle!,
                      fontSize:
                          step.subTitleFontSize ??
                          12 * Responsive.getResponsiveText(context),
                      fontWeight: step.subTitleFontWeight ?? FontWeight.w400,
                      color: subTitleColor,
                    ),
                  if (step.details != null && step.details!.isNotEmpty)
                    _StepDetails(details: step.details!),
                  if (step.subSteps != null && step.subSteps!.isNotEmpty)
                    _SubStepper(subSteps: step.subSteps!),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _StepDetails extends StatelessWidget {
  final List<StepDetail> details;

  const _StepDetails({required this.details});

  // Calculate the text length and return the width
  double _calculateMaxTitleWidth(BuildContext context) {
    double maxWidth = 0;

    for (final item in details) {
      final textStyle = TextStyle(
        fontSize: item.titleFontSize ?? 12 * Responsive.getResponsiveText(context),
        fontWeight: item.titleFontWeight ?? FontWeight.w600,
      );

      final textPainter = TextPainter(
        text: TextSpan(text: item.title, style: textStyle),
        textDirection: TextDirection.ltr,
        maxLines: 1,
      )..layout();

      if (textPainter.width > maxWidth) {
        maxWidth = textPainter.width;
      }
    }

    return maxWidth + 15; // +4 for a little buffer/padding
  }

  @override
  Widget build(BuildContext context) {
    final double maxTitleWidth = _calculateMaxTitleWidth(context);
    return Container(
    margin: const EdgeInsets.only(top: 6),
    padding: const EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: const Color(0xffFAFAFF),
      border: Border.all(color: AppColors.borderColor),
      borderRadius: BorderRadius.circular(10),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: details
          .map(
            (item) => Padding(
              padding: const EdgeInsets.only(bottom: 6),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: maxTitleWidth,
                    child: CustomText(
                      item.title,
                      fontSize: item.titleFontSize ??
                          12 * Responsive.getResponsiveText(context),
                      fontWeight: item.titleFontWeight ?? FontWeight.w600,
                      color: item.titleTextColor ?? AppColors.black,
                    ),
                  ),
                  CustomText(
                    ' : ',
                    fontSize: item.separatorFontSize ??
                        12 * Responsive.getResponsiveText(context),
                    fontWeight: item.separatorFontWeight ?? FontWeight.w600,
                    color: item.separatorColor ?? AppColors.black,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: CustomText(
                        item.description,
                        fontSize: item.descriptionFontSize ??
                            12 * Responsive.getResponsiveText(context),
                        fontWeight: item.descriptionFontWeight ?? FontWeight.w500,
                        color: item.separatorColor ?? AppColors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
          .toList(),
    ),
  );
  }
}

class _SubStepper extends StatelessWidget {
  final List<SubStepData> subSteps;

  const _SubStepper({required this.subSteps});

  Color getColorForStatus(StepStatus status) {
    switch (status) {
      case StepStatus.completed:
        return AppColors.secondary;
      case StepStatus.approved:
        return AppColors.secondary;
      case StepStatus.pending:
        return AppColors.spanishYellow;
      case StepStatus.denied:
        return AppColors.stepperDenied;
      case StepStatus.authorized:
        return AppColors.secondary;
      case StepStatus.inActive:
        return AppColors.stepperDisabled;
    }
  }

  Widget getIconWidgetForSubStatus(
    StepStatus status,
    BuildContext context, {
    Widget? customIcon,
  }) {
    if (customIcon != null) {
      return SizedBox(
        height: 0.030 * Responsive.getHeight(context),
        width: 0.030 * Responsive.getWidth(context),
        child: FittedBox(fit: BoxFit.scaleDown, child: customIcon),
      );
    }

    switch (status) {
      case StepStatus.approved:
      case StepStatus.completed:
        return SvgPicture.asset(
          AppAssets.stepperCheckIcon,
          height: Responsive.screenWidth() > 600
              ? 0.020 * Responsive.getHeight(context)
              : 0.011 * Responsive.getHeight(context),
          width: 0.011 * Responsive.getWidth(context),
        );
      case StepStatus.denied:
        return const Icon(Icons.close, color: AppColors.white, size: 12);
      case StepStatus.authorized:
        return const Icon(Icons.lock_outline, color: AppColors.white, size: 12);
      case StepStatus.pending:
        return const Icon(
          Icons.hourglass_top,
          color: AppColors.white,
          size: 12,
        );
      case StepStatus.inActive:
        return const SizedBox();
    }
  }

  StepStatus getLastEffectiveStatus() {
    for (int i = subSteps.length - 1; i >= 0; i--) {
      final sub = subSteps[i];
      if (sub.subStepStatus != null &&
          sub.subStepStatus != StepStatus.inActive) {
        return sub.subStepStatus!;
      }
    }
    return StepStatus.pending;
  }

  @override
  Widget build(BuildContext context) {
    final globalColor = getColorForStatus(getLastEffectiveStatus());

    return Container(
      margin: const EdgeInsets.only(top: 6),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0xffFAFAFF),
        border: Border.all(color: AppColors.borderColor),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: List.generate(subSteps.length, (index) {
          final sub = subSteps[index];
          final isLast = index == subSteps.length - 1;
          final isDisabled = sub.subStepStatus == StepStatus.inActive;
          final color = isDisabled
              ? AppColors.stepperDisabled
              : sub.subStepStatusColor ?? globalColor;

          return IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        InnerShadowContainer(
                          height: Responsive.screenWidth() > 600
                              ? 0.025 * Responsive.getWidth(context)
                              : 0.025 * Responsive.getHeight(context),
                          width: Responsive.screenWidth() > 600
                              ? 0.025 * Responsive.getWidth(context)
                              : 0.025 * Responsive.getHeight(context),
                          borderRadius: 15,
                          backgroundColor: AppColors.white,
                          isShadowTopLeft: true,
                        ),
                        InnerShadowContainer(
                          height: Responsive.screenWidth() > 600
                              ? 0.018 * Responsive.getWidth(context)
                              : 0.018 * Responsive.getHeight(context),
                          width: Responsive.screenWidth() > 600
                              ? 0.018 * Responsive.getWidth(context)
                              : 0.018 * Responsive.getHeight(context),
                          borderRadius: 10,
                          backgroundColor: color,
                          isShadowBottomLeft: true,
                          child: sub.isSubStepIconShow
                              ? Center(
                                  child: getIconWidgetForSubStatus(
                                    sub.subStepStatus ?? StepStatus.pending,
                                    customIcon: sub.subStepCustomStatusIcon,
                                    context,
                                  ),
                                )
                              : const SizedBox.shrink(),
                        ),
                      ],
                    ),
                    if (!isLast)
                      Expanded(
                        child: InnerShadowContainer(
                          width: 0.0055 * Responsive.getWidth(context),
                          isShadowBottomLeft: true,
                          borderRadius: 0,
                          backgroundColor: color,
                        ),
                      ),
                  ],
                ),
                SizedBox(width: 0.020 * Responsive.getWidth(context)),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            CustomText(
                              sub.subStepTitle ?? 'No title',
                              fontSize:
                                  sub.subStepTitleFontSize ??
                                  12 * Responsive.getResponsiveText(context),
                              fontWeight:
                                  sub.subStepTitleFontWeight ?? FontWeight.w600,
                              color: isDisabled
                                  ? AppColors.stepperDisabled
                                  : sub.subStepTitleColor ?? Colors.black,
                            ),
                            const Spacer(),
                            if (sub.subStepTrailingTitle != null)
                              CustomText(
                                sub.subStepTrailingTitle!,
                                fontSize:
                                    sub.subStepTrailingFontSize ??
                                    12 * Responsive.getResponsiveText(context),
                                fontWeight: FontWeight.w500,
                                color:
                                    sub.subStepTrailingTitleColor ??
                                    AppColors.textSecondary,
                              ),
                          ],
                        ),
                        if (sub.subStepTitle != null)
                          CustomText(
                            sub.subStepSubTitle!,
                            fontSize:
                                11 * Responsive.getResponsiveText(context),
                            fontWeight: FontWeight.w400,
                            color:
                                sub.subStepSubTitleColor ??
                                AppColors.textSecondary,
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
