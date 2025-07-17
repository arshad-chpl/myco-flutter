import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

// Timeline step model
class TimelineStep {
  final String label;        // Status label like "Pending", "Approved", etc.
  final Color color;         // Step circle color
  final bool isActive;       // Whether the step is completed/active

  const TimelineStep({
    required this.label,
    required this.color,
    this.isActive = false,
  });
}

// Status timeline widget
class StatusTimeline extends StatelessWidget {
  final List<TimelineStep> steps;    // All the steps to show
  final double circleSize;           // Circle size
  final double linewidth;            // Line width between steps

  const StatusTimeline({
    super.key,
    required this.steps,
    this.circleSize = 30,
    this.linewidth = 30,
  });

  // Color helper based on status string
  Color getStatusColor(BuildContext context, String status, bool isActive) {
    if (!isActive) return AppTheme.getColor(context).outline;

    switch (status.toLowerCase()) {
      case 'pending':
        return AppColors.spanishYellow;
      case 'approved':
      case 'authorized':
      case 'completed':
        return AppTheme.getColor(context).secondary;
      case 'denied':
        return AppTheme.getColor(context).error;
      default:
        return AppTheme.getColor(context).outline;
    }
  }

  @override
  Widget build(BuildContext context) {
    // Find last active index to highlight path
    final lastActiveIndex = steps.lastIndexWhere((step) => step.isActive);

    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 0.05 * Responsive.getWidth(context)),
          child: Column(
            children: [
              // Timeline bar and status circles
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: List.generate(steps.length * 2 - 1, (index) {
                  if (index.isOdd) {
                    // Line between steps
                    final stepIndex = (index - 1) ~/ 2;
                    final isLineActive = stepIndex < lastActiveIndex;

                    return Container(
                      width: linewidth,
                      height: circleSize,
                      alignment: Alignment.center,
                      child: Container(
                        height: 0.003 * Responsive.getHeight(context),
                        color: isLineActive
                            ? steps[stepIndex].color
                            : AppTheme.getColor(context).outline,
                      ),
                    );
                  } else {
                    // Step circle itself
                    final stepIndex = index ~/ 2;
                    final step = steps[stepIndex];
                    final isStepActive = stepIndex <= lastActiveIndex;
                    final bgColor = getStatusColor(context, step.label, isStepActive);

                    return Column(
                      children: [
                        Container(
                          width: circleSize * 1.4,
                          height: circleSize * 1.4,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            boxShadow: [
                              const BoxShadow(color: Colors.black26),
                              BoxShadow(
                                color: AppTheme.getColor(context).surface,
                                blurRadius: 5,
                                offset: const Offset(3, 3),
                              ),
                            ],
                          ),
                          child: Container(
                            width: circleSize,
                            height: circleSize,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: bgColor.withOpacity(0.9),
                              border: Border.all(color: bgColor, width: 2),
                            ),
                            child: step.isActive
                                ? const Icon(Icons.check, color: Colors.white, size: 18)
                                : const SizedBox(),
                          ),
                        ),
                      ],
                    );
                  }
                }),
              ),

              SizedBox(height: 0.01 * Responsive.getHeight(context)),

              // Labels under steps
              Row(
                children: List.generate(steps.length * 2 - 1, (index) {
                  if (index.isOdd) {
                    return SizedBox(width: linewidth);
                  } else {
                    final stepIndex = index ~/ 2;
                    final isLabelActive = stepIndex <= lastActiveIndex;
                    final displayColor = isLabelActive
                        ? getStatusColor(context, steps[stepIndex].label, true)
                        : const Color(0xff929292);

                    return SizedBox(
                      width: 0.12 * Responsive.getWidth(context),
                      child: CustomText(
                        steps[stepIndex].label,
                        textAlign: TextAlign.center,
                        fontSize: 9.10 * Responsive.getResponsive(context),
                        color: displayColor,
                        fontWeight: FontWeight.w600,
                      ),
                    );
                  }
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
