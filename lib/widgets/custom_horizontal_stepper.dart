import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

class TimelineStep {
  final String label;
  final String? imagePath; // Use image instead of IconData
  final Color color;
  final bool isActive;

  const TimelineStep({
    required this.label,
    this.imagePath,
    required this.color,
    this.isActive = false,
  });
}

class StatusTimeline extends StatelessWidget {
  final List<TimelineStep> steps;
  final double circleSize;
  final double linewidth;

  const StatusTimeline({
    super.key,
    required this.steps,
    this.circleSize = 30,
    this.linewidth = 30,
  });

  @override
  Widget build(BuildContext context) {
    final lastActiveIndex = steps.lastIndexWhere((step) => step.isActive);
    final activeColor = lastActiveIndex >= 0
        ? steps[lastActiveIndex].color
        : Colors.grey;

    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 0.05 * Responsive.getWidth(context)),
          child: Column(
            children: [
              // Circles + Lines
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: List.generate(steps.length * 2 - 1, (index) {
                  if (index.isOdd) {
                    final stepIndex = (index - 1) ~/ 2;
                    final isLineActive = stepIndex < lastActiveIndex;

                    return Container(
                      width: linewidth,
                      height: circleSize,
                      alignment: Alignment.center,
                      child: Container(
                        height: 0.003 * Responsive.getHeight(context),
                        color: isLineActive ? activeColor : AppTheme.getColor(context).outline,
                      ),
                    );
                  } else {
                    final stepIndex = index ~/ 2;
                    final isStepActive = steps[stepIndex].isActive;
                    final displayColor = isStepActive ? activeColor : AppTheme.getColor(context).outline;

                    return Column(
                      children: [
                        Container(
                          width: circleSize * 1.4,
                          height: circleSize * 1.4,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            boxShadow: [
                              const BoxShadow(color: Colors.black26),
                              BoxShadow(
                                color: AppTheme.getColor(context).surface,
                                blurRadius: 5,
                                offset: const Offset(3, 3),
                              ),
                            ],
                            shape: BoxShape.circle,
                          ),
                          child: Container(
                            width: circleSize,
                            height: circleSize,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: displayColor.withOpacity(0.9),
                              border: Border.all(color: displayColor, width: 2),
                            ),
                            child: Center(
                              child: steps[stepIndex].imagePath != null
                                  ? Image.asset(
                                steps[stepIndex].imagePath!,
                                width: circleSize * 0.5,
                                height: circleSize * 0.4,
                                fit: BoxFit.contain,
                              )
                                  : const SizedBox(),
                            ),
                          ),
                        ),
                      ],
                    );
                  }
                }),
              ),

              SizedBox(height: 0.01 * Responsive.getHeight(context)),

              // Text below each circle
              Row(
                children: List.generate(steps.length * 2 - 1, (index) {
                  if (index.isOdd) {
                    return SizedBox(width: linewidth);
                  } else {
                    final stepIndex = index ~/ 2;
                    final isLabelActive = stepIndex <= lastActiveIndex;
                    final displayColor = isLabelActive ? activeColor : const Color(0xff929292);

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