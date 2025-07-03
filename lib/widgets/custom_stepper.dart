import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/colors.dart';

enum StepStatus { pending, approved, completed, denied, authorized }

class StepDetail {
  final String title;
  final String description;

  StepDetail({required this.title, required this.description});
}

class StepData {
  final String title;
  final StepStatus status;
  final List<StepDetail>? details;
  final Color? statusColor;
  final Color? titleColor;
  final bool isStepDisabled;
  final bool isStepIconShow;

  StepData({
    required this.title,
    required this.status,
    this.details,
    this.statusColor,
    this.titleColor,
    this.isStepDisabled = false,
    this.isStepIconShow = true,
  });
}

class CustomStepper extends StatelessWidget {
  final List<StepData> steps;
  final bool isHorizontal;
  final StepStatus? globalStatus;

  const CustomStepper({
    super.key,
    required this.steps,
    this.isHorizontal = false,
    this.globalStatus,
  });

  /// Returns icon based on StepStatus (always based on individual step.status)
  IconData getIconForStatus(StepStatus status) {
    switch (status) {
      case StepStatus.approved:
      case StepStatus.completed:
        return Icons.check;
      case StepStatus.denied:
        return Icons.close;
      case StepStatus.authorized:
        return Icons.lock_outline;
      case StepStatus.pending:
        return Icons.hourglass_top;
    }
  }

  /// Returns default color based on status
  Color getColorForStatus(StepStatus status) {
    switch (status) {
      case StepStatus.completed:
      case StepStatus.approved:
        return const Color(0xff2FBBA4); // Green
      case StepStatus.pending:
        return const Color(0xffFDB913); // Yellow
      case StepStatus.denied:
        return const Color(0xffFF2121); // Red
      case StepStatus.authorized:
        return Colors.grey; // Gray
    }
  }

  /// Builds the circle with icon
  Widget _buildCircle(StepData step) {
    final icon = getIconForStatus(
      step.status,
    ); // Always use step.status for icon
    final baseColor = globalStatus != null
        ? getColorForStatus(globalStatus!)
        : step.statusColor ?? getColorForStatus(step.status);

    final color = step.isStepDisabled ? Colors.grey : baseColor;

    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.grey.shade300, width: 0.5),
            boxShadow: const [
              BoxShadow(color: Colors.black26),
              BoxShadow(
                color: Colors.white,
                blurRadius: 5,
                offset: Offset(3, 3),
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.center,
          // top: 6,
          // left: 6,
          child: Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(shape: BoxShape.circle, color: color),
            child: step.isStepIconShow
                ? Center(child: Icon(icon, color: AppColors.white, size: 20))
                : null,
          ),
        ),
      ],
    );
  }

  /// Builds the connector line
  Widget _buildLine() {
    final color = globalStatus != null
        ? getColorForStatus(globalStatus!)
        : const Color(0xffA9A3A3);

    return Container(width: isHorizontal ? 60 : 3, height: 30, color: color);
  }

  /// Builds each step
  Widget _buildStep(BuildContext context, StepData step, int index) {
    final isLast = index == steps.length - 1;
    final titleColor = step.isStepDisabled
        ? Colors.grey
        : globalStatus != null
        ? getColorForStatus(globalStatus!)
        : step.titleColor ?? getColorForStatus(step.status);

    if (isHorizontal) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [_buildCircle(step), if (!isLast) _buildLine()],
      );
    }

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              _buildCircle(step),
              if (!isLast) Expanded(child: _buildLine()),
            ],
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                  if (step.details != null && step.details!.isNotEmpty)
                    Container(
                      margin: const EdgeInsets.only(top: 6),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: const Color(0xffFAFAFF),
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: step.details!.map((item) {
                          final title = item.title;
                          final description = item.description;
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 6),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 140,
                                  child: Text(
                                    title,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontFamily: 'Gilroy-SemiBold',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                const Text(
                                  ' : ',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'Gilroy-Medium',
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    description,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontFamily: 'Gilroy-Medium',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Builds the full stepper layout
  @override
  Widget build(BuildContext context) {
    return isHorizontal
        ? SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                steps.length,
                (index) => _buildStep(context, steps[index], index),
              ),
            ),
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(
              steps.length,
              (index) => _buildStep(context, steps[index], index),
            ),
          );
  }
}
