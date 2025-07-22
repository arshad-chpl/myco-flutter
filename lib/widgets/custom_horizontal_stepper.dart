// // import 'package:flutter/material.dart';
// // import 'package:myco_flutter/core/theme/app_theme.dart';
// // import 'package:myco_flutter/core/utils/responsive.dart';
// // import 'package:myco_flutter/widgets/custom_text.dart';
// //
// // class TimelineStep {
// //   final String label;
// //   final String? imagePath; // Use image instead of IconData
// //   final Color color;
// //   final bool isActive;
// //
// //   const TimelineStep({
// //     required this.label,
// //     this.imagePath,
// //     required this.color,
// //     this.isActive = false,
// //   });
// // }
// //
// // class StatusTimeline extends StatelessWidget {
// //   final List<TimelineStep> steps;
// //   final double circleSize;
// //   final double linewidth;
// //
// //   const StatusTimeline({
// //     super.key,
// //     required this.steps,
// //     this.circleSize = 19,
// //     this.linewidth = 72,
// //   });
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     final lastActiveIndex = steps.lastIndexWhere((step) => step.isActive);
// //     final activeColor = lastActiveIndex >= 0
// //         ? steps[lastActiveIndex].color
// //         : Colors.grey;
// //
// //     return SizedBox(
// //       width: double.infinity,
// //       child: Padding(
// //         padding:  EdgeInsets.all(10 * Responsive.getResponsive(context)),
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
// //             // Circles + Lines
// //             Row(
// //               crossAxisAlignment: CrossAxisAlignment.center,
// //               children: List.generate(steps.length * 2 - 1, (index) {
// //                 if (index.isOdd) {
// //                   final stepIndex = (index - 1) ~/ 2;
// //                   final isLineActive = stepIndex < lastActiveIndex;
// //
// //                   return Container(
// //                     width: linewidth,
// //                     height: circleSize,
// //                     alignment: Alignment.center,
// //                     child: Container(
// //                       height: 0.003 * Responsive.getHeight(context),
// //                       color: isLineActive ? activeColor : AppTheme.getColor(context).outline,
// //                     ),
// //                   );
// //                 } else {
// //                   final stepIndex = index ~/ 2;
// //                   final isStepActive = steps[stepIndex].isActive;
// //                   final displayColor = isStepActive ? activeColor : AppTheme.getColor(context).outline;
// //
// //                   return Column(
// //                     crossAxisAlignment: CrossAxisAlignment.center,
// //                     children: [
// //                       Container(
// //                         width: circleSize * 1.4,
// //                         height: circleSize * 1.4,
// //                         alignment: Alignment.center,
// //                         decoration: BoxDecoration(
// //                           boxShadow: [
// //                             const BoxShadow(color: Colors.black26),
// //                             BoxShadow(
// //                               color: AppTheme.getColor(context).surface,
// //                               blurRadius: 5,
// //                               offset: const Offset(3, 3),
// //                             ),
// //                           ],
// //                           shape: BoxShape.circle,
// //                         ),
// //                         child: Container(
// //                           width: circleSize,
// //                           height: circleSize,
// //                           decoration: BoxDecoration(
// //                             shape: BoxShape.circle,
// //                             color: displayColor.withOpacity(0.9),
// //                             border: Border.all(color: displayColor, width: 2),
// //                           ),
// //                           child: Center(
// //                             child: steps[stepIndex].imagePath != null
// //                                 ? Image.asset(
// //                               steps[stepIndex].imagePath!,
// //                               width: circleSize * 0.5,
// //                               height: circleSize * 0.4,
// //                               fit: BoxFit.contain,
// //                             )
// //                                 : const SizedBox(),
// //                           ),
// //                         ),
// //                       ),
// //                     ],
// //                   );
// //                 }
// //               }),
// //             ),
// //
// //             SizedBox(height: 0.01 * Responsive.getHeight(context)),
// //
// //             // Text below each circle
// //             Row(
// //               children: List.generate(steps.length * 2 - 1, (index) {
// //                 if (index.isOdd) {
// //                   return SizedBox(width: linewidth);
// //                 } else {
// //                   final stepIndex = index ~/ 2;
// //                   final isLabelActive = stepIndex <= lastActiveIndex;
// //                   final displayColor = isLabelActive ? activeColor : const Color(0xff929292);
// //
// //                   return SizedBox(
// //                     // width: circleSize * 1.2,
// //                     child: CustomText(
// //                       steps[stepIndex].label,
// //                       // textAlign: TextAlign.center,
// //                       fontSize: 11 * Responsive.getResponsiveText(context),
// //                       color: displayColor,
// //                       fontWeight: FontWeight.w600,
// //                     ),
// //                   );
// //                 }
// //               }),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
// import 'package:flutter/material.dart';
// import 'package:myco_flutter/core/theme/app_theme.dart';
// import 'package:myco_flutter/core/utils/responsive.dart';
// import 'package:myco_flutter/widgets/custom_text.dart';
//
// class TimelineStep {
//   final String label;
//   final String? imagePath; // Use image instead of IconData
//   final Color color;
//   final bool isActive;
//
//   const TimelineStep({
//     required this.label,
//     this.imagePath,
//     required this.color,
//     this.isActive = false,
//   });
// }
//
// class StatusTimeline extends StatelessWidget {
//   final List<TimelineStep> steps;
//   final double circleSize;
//   final double linewidth;
//
//   const StatusTimeline({
//     super.key,
//     required this.steps,
//     this.circleSize = 19,
//     this.linewidth = 72,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     final lastActiveIndex = steps.lastIndexWhere((step) => step.isActive);
//     final activeColor = lastActiveIndex >= 0
//         ? steps[lastActiveIndex].color
//         : Colors.grey;
//
//     // Determine the effective width of the circle display area
//     final double effectiveCircleAreaWidth = circleSize * 1.4;
//
//     return SizedBox(
//       width: double.infinity,
//       child: Padding(
//         padding: EdgeInsets.all(10 * Responsive.getResponsive(context)),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Circles + Lines
//             Row(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: List.generate(steps.length * 2 - 1, (index) {
//                 if (index.isOdd) {
//                   // This is the line segment
//                   return Container(
//                     width: linewidth,
//                     height: circleSize, // Height doesn't matter much for the line itself
//                     alignment: Alignment.center,
//                     child: Container(
//                       height: 0.003 * Responsive.getHeight(context),
//                       color: isLineActive(index, lastActiveIndex) ? activeColor : AppTheme.getColor(context).outline,
//                     ),
//                   );
//                 } else {
//                   // This is a circle
//                   final stepIndex = index ~/ 2;
//                   final isStepActive = steps[stepIndex].isActive;
//                   final displayColor = isStepActive ? activeColor : AppTheme.getColor(context).outline;
//
//                   return SizedBox( // Using SizedBox directly to set the total width for this column
//                     width: effectiveCircleAreaWidth,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.center, // Center the content within this SizedBox
//                       children: [
//                         Container(
//                           width: effectiveCircleAreaWidth, // Match SizedBox width
//                           height: effectiveCircleAreaWidth, // Match SizedBox height for square bounding box
//                           alignment: Alignment.center,
//                           decoration: BoxDecoration(
//                             boxShadow: [
//                               const BoxShadow(color: Colors.black26),
//                               BoxShadow(
//                                 color: AppTheme.getColor(context).surface,
//                                 blurRadius: 5,
//                                 offset: const Offset(3, 3),
//                               ),
//                             ],
//                             shape: BoxShape.circle,
//                           ),
//                           child: Container(
//                             width: circleSize,
//                             height: circleSize,
//                             decoration: BoxDecoration(
//                               shape: BoxShape.circle,
//                               color: displayColor.withOpacity(0.9),
//                               border: Border.all(color: displayColor, width: 2),
//                             ),
//                             child: Center(
//                               child: steps[stepIndex].imagePath != null
//                                   ? Image.asset(
//                                 steps[stepIndex].imagePath!,
//                                 width: circleSize * 0.5,
//                                 height: circleSize * 0.4,
//                                 fit: BoxFit.contain,
//                               )
//                                   : const SizedBox(),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   );
//                 }
//               }),
//             ),
//
//             SizedBox(height: 0.01 * Responsive.getHeight(context)),
//
//             // Text below each circle
//             Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: List.generate(steps.length * 2 - 1, (index) {
//                 if (index.isOdd) {
//                   // This is the "line" space, should match linewidth
//                   return SizedBox(width: linewidth);
//                 } else {
//                   // This is the "circle" space for the text
//                   final stepIndex = index ~/ 2;
//                   final isLabelActive = stepIndex <= lastActiveIndex;
//                   final displayColor = isLabelActive ? activeColor : const Color(0xff929292);
//
//                   return SizedBox(
//                     width: effectiveCircleAreaWidth, // Match the width of the circle container above
//                     child: CustomText(
//                       steps[stepIndex].label,
//                       textAlign: TextAlign.center, // Center the text within this fixed-width SizedBox
//                       fontSize: 11 * Responsive.getResponsiveText(context),
//                       color: displayColor,
//                       fontWeight: FontWeight.w600,
//                       maxLines: 1, // Crucial: Limit to a single line
//                       overflow: TextOverflow.ellipsis, // Add ellipsis if it overflows
//                     ),
//                   );
//                 }
//               }),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   // Helper to determine if the line is active
//   bool isLineActive(int index, int lastActiveIndex) {
//     final stepIndex = (index - 1) ~/ 2;
//     return stepIndex < lastActiveIndex;
//   }
// }

// line gap

//
// import 'package:flutter/material.dart';
// import 'package:myco_flutter/core/theme/app_theme.dart';
// import 'package:myco_flutter/core/utils/responsive.dart';
// import 'package:myco_flutter/widgets/custom_text.dart';
// import 'dart:math'; // For the max function
//
// class TimelineStep {
//   final String label;
//   final String? imagePath; // Use image instead of IconData
//   final Color color;
//   final bool isActive;
//
//   const TimelineStep({
//     required this.label,
//     this.imagePath,
//     required this.color,
//     this.isActive = false,
//   });
// }
//
// class StatusTimeline extends StatelessWidget {
//   final List<TimelineStep> steps;
//   final double circleSize;
//   final double linewidth;
//   final double textSlotWidthMultiplier; // NEW: Control how wide the text/circle slot is
//
//   const StatusTimeline({
//     super.key,
//     required this.steps,
//     this.circleSize = 19,
//     this.linewidth = 30,
//     this.textSlotWidthMultiplier = 2.5, // Defaulting to a larger value (e.g., 2.5 or 3.0)
//     // You can also consider adding a minTextWidth if you have very short labels
//     // final double minTextWidth = 60.0; // Example
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     final lastActiveIndex = steps.lastIndexWhere((step) => step.isActive);
//     final activeColor = lastActiveIndex >= 0
//         ? steps[lastActiveIndex].color
//         : Colors.grey;
//
//     // Calculate the effective width for each step's slot (circle + text).
//     // This value now uses the new multiplier.
//     final double effectiveCircleAreaWidth = circleSize * textSlotWidthMultiplier;
//
//     return SizedBox(
//       width: double.infinity,
//       child: Padding(
//         padding: EdgeInsets.all(10 * Responsive.getResponsive(context)),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Circles + Lines Row
//             Row(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: List.generate(steps.length * 2 - 1, (index) {
//                 if (index.isOdd) {
//                   // This represents the line segment between circles
//                   return Container(
//                     width: linewidth,
//                     height: circleSize,
//                     alignment: Alignment.center,
//                     child: Container(
//                       height: 0.003 * Responsive.getHeight(context),
//                       color: isLineActive(index, lastActiveIndex) ? activeColor : AppTheme.getColor(context).outline,
//                     ),
//                   );
//                 } else {
//                   // This represents a circle's position
//                   final stepIndex = index ~/ 2;
//                   final isStepActive = steps[stepIndex].isActive;
//                   final displayColor = isStepActive ? activeColor : AppTheme.getColor(context).outline;
//
//                   return SizedBox( // Allocate horizontal space for this circle
//                     width: effectiveCircleAreaWidth,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.center, // Center the circle within its allocated space
//                       children: [
//                         Container(
//                           width: circleSize * 1.4, // Keep the inner circle's visual size relatively fixed
//                           height: circleSize * 1.4,
//                           alignment: Alignment.center,
//                           decoration: BoxDecoration(
//                             boxShadow: [
//                               const BoxShadow(color: Colors.black26),
//                               BoxShadow(
//                                 color: AppTheme.getColor(context).surface,
//                                 blurRadius: 5,
//                                 offset: const Offset(3, 3),
//                               ),
//                             ],
//                             shape: BoxShape.circle,
//                           ),
//                           child: Container(
//                             width: circleSize,
//                             height: circleSize,
//                             decoration: BoxDecoration(
//                               shape: BoxShape.circle,
//                               color: displayColor.withOpacity(0.9),
//                               border: Border.all(color: displayColor, width: 2),
//                             ),
//                             child: Center(
//                               child: steps[stepIndex].imagePath != null
//                                   ? Image.asset(
//                                 steps[stepIndex].imagePath!,
//                                 width: circleSize * 0.5,
//                                 height: circleSize * 0.4,
//                                 fit: BoxFit.contain,
//                               )
//                                   : const SizedBox(),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   );
//                 }
//               }),
//             ),
//
//             SizedBox(height: 0.01 * Responsive.getHeight(context)),
//
//             // Text labels Row (now scales text to fit in a single line within a wider container)
//             Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: List.generate(steps.length * 2 - 1, (index) {
//                 if (index.isOdd) {
//                   // This creates the same horizontal spacing as the lines above
//                   return SizedBox(width: linewidth);
//                 } else {
//                   // This creates the text container matching the wider circle slot's width
//                   final stepIndex = index ~/ 2;
//                   final isLabelActive = stepIndex <= lastActiveIndex;
//                   final displayColor = isLabelActive ? activeColor : const Color(0xff929292);
//
//                   return SizedBox(
//                     width: effectiveCircleAreaWidth, // The fixed, wider width for the text slot
//                     child: FittedBox( // Allows its child (CustomText) to be scaled
//                       fit: BoxFit.scaleDown, // Shrink the text if it's too big
//                       alignment: Alignment.center, // Center the scaled text
//                       child: CustomText(
//                         steps[stepIndex].label,
//                         textAlign: TextAlign.center, // Center the text within FittedBox's scaled area
//                         fontSize: 11 * Responsive.getResponsiveText(context), // Starting font size
//                         color: displayColor,
//                         fontWeight: FontWeight.w600,
//                         maxLines: 1, // Crucial: Force text to a single line
//                       ),
//                     ),
//                   );
//                 }
//               }),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   // Helper to determine if the line is active
//   bool isLineActive(int index, int lastActiveIndex) {
//     final stepIndex = (index - 1) ~/ 2;
//     return stepIndex < lastActiveIndex;
//   }
// }

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
  final double textSlotWidthMultiplier;

  const StatusTimeline({
    super.key,
    required this.steps,
    this.circleSize = 19,
    this.linewidth = 72,
    this.textSlotWidthMultiplier = 2,
  });

  @override
  Widget build(BuildContext context) {
    final lastActiveIndex = steps.lastIndexWhere((step) => step.isActive);
    final activeColor = lastActiveIndex >= 0
        ? steps[lastActiveIndex].color
        : Colors.grey;

    // Determine the effective width of the circle display area.
    // This width will be consistently applied to both circle containers and text containers.
    final double effectiveCircleAreaWidth =
        circleSize * 1.4; // This is the total width slot for each step

    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.all(10 * Responsive.getResponsive(context)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Circles + Lines Row
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: List.generate(steps.length * 2 - 1, (index) {
                if (index.isOdd) {
                  // This represents the line segment between circles
                  return Container(
                    width: linewidth,
                    height: circleSize,
                    alignment: Alignment.center,
                    child: Container(
                      height: 0.003 * Responsive.getHeight(context),
                      color: isLineActive(index, lastActiveIndex)
                          ? activeColor
                          : AppTheme.getColor(context).outline,
                    ),
                  );
                } else {
                  // This represents a circle's position
                  final stepIndex = index ~/ 2;
                  final isStepActive = steps[stepIndex].isActive;
                  final displayColor = isStepActive
                      ? activeColor
                      : AppTheme.getColor(context).outline;

                  return SizedBox(
                    // Use SizedBox to allocate the horizontal space for this circle
                    width: effectiveCircleAreaWidth,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      // Center the circle element within its allocated SizedBox
                      children: [
                        Container(
                          width: effectiveCircleAreaWidth,
                          height: effectiveCircleAreaWidth,
                          // Keep height consistent for a square bounding box
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
                    ),
                  );
                }
              }),
            ),

            SizedBox(height: 0.01 * Responsive.getHeight(context)),

            // Text labels Row (now scales text to fit in a single line)
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(steps.length * 2 - 1, (index) {
                if (index.isOdd) {
                  // This creates the same horizontal spacing as the lines above
                  return SizedBox(width: linewidth);
                } else {
                  // This creates the text container matching the circle's width
                  final stepIndex = index ~/ 2;
                  final isLabelActive = stepIndex <= lastActiveIndex;
                  final displayColor = isLabelActive
                      ? activeColor
                      : const Color(0xff929292);

                  return SizedBox(
                    width: effectiveCircleAreaWidth,
                    // The fixed width for the text slot
                    child: FittedBox(
                      // Allows its child (CustomText) to be scaled
                      fit: BoxFit.scaleDown, // Shrink the text if it's too big
                      alignment: Alignment.center, // Center the scaled text
                      child: CustomText(
                        steps[stepIndex].label,
                        textAlign: TextAlign.center,
                        // Center the text within FittedBox's scaled area
                        fontSize: 11 * Responsive.getResponsiveText(context),
                        // Starting font size
                        color: displayColor,
                        fontWeight: FontWeight.w600,
                        maxLines: 1, // Crucial: Force text to a single line
                        // No `overflow` property needed, FittedBox handles fitting
                      ),
                    ),
                  );
                }
              }),
            ),
          ],
        ),
      ),
    );
  }

  // Helper to determine if the line is active
  bool isLineActive(int index, int lastActiveIndex) {
    final stepIndex = (index - 1) ~/ 2;
    return stepIndex < lastActiveIndex;
  }
}
