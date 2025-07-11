import 'package:flutter/material.dart';
import 'package:myco_flutter/constants/app_assets.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/lost_and_found/presentation/widgets/custom_inner_shadow.dart';

enum StepStatus { pending, approved, completed, denied, authorized, inActive }

class StepDetail {
  final String title, description;

  StepDetail({required this.title, required this.description});
}

class SubStepData {
  final String? title, subTitle, trailingTitle;
  final StepStatus? status;
  final bool isSubStepIconShow;
  final Color? statusColor, titleColor, subTitleColor, trailingTitleColor;
  final Widget? customStatusIcon;

  SubStepData({
    this.title,
    this.subTitle,
    this.trailingTitle,
    this.status,
    this.statusColor,
    this.subTitleColor,
    this.trailingTitleColor,
    this.titleColor,
    this.isSubStepIconShow = true,
    this.customStatusIcon,
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
    if (customIcon != null) {
      return SizedBox(
        height: 0.045 * Responsive.getHeight(context),
        width: 0.045 * Responsive.getWidth(context),
        child: FittedBox(fit: BoxFit.scaleDown, child: customIcon),
      );
    }

    switch (status) {
      case StepStatus.approved:
      case StepStatus.completed:
        return Image.asset(
          AppAssets.rightIcon,
          height: 17,
          width: 17,
          color: AppColors.white,
        );
      case StepStatus.denied:
        return Icon(Icons.close, color: AppColors.white, size: 17);
      case StepStatus.authorized:
        return Icon(Icons.lock_outline, color: AppColors.white, size: 17);
      case StepStatus.pending:
        return Icon(Icons.hourglass_top, color: AppColors.white, size: 17);
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
              : 0.042 * Responsive.getHeight(context),
          width: Responsive.screenWidth() > 600
              ? 0.042 * Responsive.getWidth(context)
              : 0.042 * Responsive.getHeight(context),
          borderRadius: 20,
          backgroundColor: AppColors.white,
          isShadowTopLeft: true,
        ),
        InnerShadowContainer(
          height: Responsive.screenWidth() > 600
              ? 0.070 * Responsive.getHeight(context)
              : 0.032 * Responsive.getHeight(context),
          width: Responsive.screenWidth() > 600
              ? 0.032 * Responsive.getWidth(context)
              : 0.070 * Responsive.getWidth(context),
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
                      width: 3,
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
                      Text(
                        step.title,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Gilroy-SemiBold',
                          color: titleColor,
                        ),
                      ),
                      const Spacer(),
                      if (step.trillingTitle != null)
                        Text(
                          step.trillingTitle!,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Gilroy-Regular',
                            color: trailingColor,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                    ],
                  ),
                  if (step.subTitle != null)
                    Text(
                      step.subTitle!,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Gilroy-Regular',
                        color: subTitleColor,
                      ),
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

  @override
  Widget build(BuildContext context) => Container(
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
                    width: 140,
                    child: Text(
                      item.title,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Gilroy-SemiBold',
                        color: AppColors.black,
                      ),
                    ),
                  ),
                  const Text(
                    ' : ',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Gilroy-SemiBold',
                      color: AppColors.black,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Text(
                        item.description,
                        style: const TextStyle(
                          fontSize: 12,
                          fontFamily: 'Gilroy-Medium',
                          fontWeight: FontWeight.w500,
                          color: AppColors.black,
                        ),
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

  Widget getIconWidgetForSubStatus(StepStatus status, {Widget? customIcon}) {
    if (customIcon != null) {
      return SizedBox(
        height: 10,
        width: 10,
        child: FittedBox(fit: BoxFit.scaleDown, child: customIcon),
      );
    }

    switch (status) {
      case StepStatus.approved:
      case StepStatus.completed:
        return Image.asset(
          'assets/stepper_icon/check.png',
          height: 10,
          width: 10,
          color: AppColors.white,
        );
      case StepStatus.denied:
        return const Icon(Icons.close, color: AppColors.white, size: 12);
      case StepStatus.authorized:
        return const Icon(Icons.lock_outline, color: AppColors.white, size: 12);
      case StepStatus.pending:
        return const Icon(
          Icons.hourglass_top,
          color: AppColors.white,
          size: 10,
        );
      case StepStatus.inActive:
        return const SizedBox();
    }
  }

  StepStatus getLastEffectiveStatus() {
    for (int i = subSteps.length - 1; i >= 0; i--) {
      final sub = subSteps[i];
      if (sub.status != null && sub.status != StepStatus.inActive) {
        return sub.status!;
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
          final isDisabled = sub.status == StepStatus.inActive;
          final color = isDisabled
              ? AppColors.stepperDisabled
              : sub.statusColor ?? globalColor;

          return IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        const InnerShadowContainer(
                          height: 25,
                          width: 25,
                          borderRadius: 15,
                          backgroundColor: AppColors.white,
                          isShadowTopLeft: true,
                        ),
                        InnerShadowContainer(
                          height: 18,
                          width: 18,
                          borderRadius: 10,
                          backgroundColor: color,
                          isShadowBottomLeft: true,
                          child: sub.isSubStepIconShow
                              ? Center(
                                  child: getIconWidgetForSubStatus(
                                    sub.status ?? StepStatus.pending,
                                    customIcon: sub.customStatusIcon,
                                  ),
                                )
                              : const SizedBox.shrink(),
                        ),
                      ],
                    ),
                    if (!isLast)
                      Expanded(
                        child: InnerShadowContainer(
                          width: 2.5,
                          isShadowBottomLeft: true,
                          borderRadius: 0,
                          backgroundColor: color,
                        ),
                      ),
                  ],
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              sub.title ?? 'No title',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Gilroy-SemiBold',
                                color: isDisabled
                                    ? AppColors.stepperDisabled
                                    : sub.titleColor ?? Colors.black,
                              ),
                            ),
                            const Spacer(),
                            if (sub.trailingTitle != null)
                              Text(
                                sub.trailingTitle!,
                                style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'Gilroy-Medium',
                                  color:
                                      sub.trailingTitleColor ??
                                      AppColors.textSecondary,
                                ),
                              ),
                          ],
                        ),
                        if (sub.subTitle != null)
                          Text(
                            sub.subTitle!,
                            style: TextStyle(
                              fontSize: 11,
                              fontFamily: 'Gilroy-Regular',
                              fontWeight: FontWeight.w400,
                              color:
                                  sub.subTitleColor ?? AppColors.textSecondary,
                            ),
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
