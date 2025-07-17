// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:myco_flutter/core/theme/colors.dart';
// import 'package:myco_flutter/core/utils/responsive.dart';
// import 'package:myco_flutter/widgets/common_card.dart';
// import 'package:myco_flutter/widgets/custom_text.dart';

// class EmployeeSelectionModel {
//   final ImageProvider image;
//   final String name, department;

//   EmployeeSelectionModel({
//     required this.image,
//     required this.name,
//     required this.department,
//   });
// }

// class EmployeeSelectionCard extends StatelessWidget {
//   final ImageProvider image;
//   final String name, department;
//   final bool isSelected;
//   final bool? showDelete;
//   final VoidCallback? onDeleteTap;
//   final TextStyle? nameTextStyle, departmentTextStyle;
//   final EdgeInsetsGeometry? boxPadding;
//   final Color? borderColor, selectedColor;
//   final double? boxHeight,
//       boxWidth,
//       borderRadius,
//       imageWidth,
//       imageHeight,
//       spaceBetweenImageText;
//   final ValueChanged<EmployeeSelectionModel>? onSelected;

//   const EmployeeSelectionCard({
//     required this.image,
//     required this.name,
//     required this.department,
//     required this.isSelected,
//     super.key,
//     this.boxHeight,
//     this.boxWidth,
//     this.imageWidth,
//     this.imageHeight,
//     this.spaceBetweenImageText,
//     this.onSelected,
//     this.borderRadius,
//     this.borderColor,
//     this.nameTextStyle,
//     this.departmentTextStyle,
//     this.boxPadding,
//     this.showDelete,
//     this.onDeleteTap,
//     this.selectedColor,
//   });

//   void _handleTap() {
//     if (onSelected != null) {
//       onSelected!(
//         EmployeeSelectionModel(
//           name: name,
//           department: department,
//           image: image,
//         ),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) => GestureDetector(
//     onTap: _handleTap,
//     child: Stack(
//       fit: StackFit.expand,
//       children: [
//         Container(
//           width: 100,
//           padding:
//           boxPadding ??
//               const EdgeInsets.only(top: 12, left: 16, right: 24, bottom: 2),
//           decoration: BoxDecoration(
//             color: isSelected ? const Color(0xFFEEF7FD) : Colors.white,
//             borderRadius: BorderRadius.circular(borderRadius ?? 20),
//             border: Border.all(
//               color: isSelected
//                   ? Colors.transparent
//                   : borderColor ?? AppColors.primary,
//             ),
//             boxShadow: [
//               BoxShadow(
//                 color: isSelected ? Colors.grey.shade300 : Colors.transparent,
//                 spreadRadius: 3,
//                 blurRadius: 5,
//               ),
//             ],
//           ),
//           child: Column(
//             children: [
//               Stack(
//                 alignment: Alignment.center,
//                 children: [
//                   SizedBox(
//                     width: imageWidth ?? 80,
//                     height: imageHeight ?? 80,
//                     child: Stack(
//                       fit: StackFit.expand,
//                       children: [
//                         Container(
//                           width: imageWidth ?? 100,
//                           height: imageHeight ?? 100,
//                           padding: const EdgeInsets.all(3.0),
//                           decoration: BoxDecoration(
//                             shape: BoxShape.circle,
//                             gradient: LinearGradient(
//                               colors: isSelected
//                                   ? [
//                                 selectedColor ?? AppColors.primary,
//                                 (selectedColor ?? AppColors.primary).withAlpha(150),
//                                 Colors.white,
//                               ]
//                                   : [
//                                 Colors.grey.shade400,
//                                 Colors.grey.shade300,
//                                 Colors.white,
//                               ],
//                               begin: Alignment.topCenter,
//                               end: Alignment.bottomCenter,
//                             ),
//                           ),
//                           child: Container(
//                             padding: const EdgeInsets.all(12.0),
//                             decoration: const BoxDecoration(
//                               color: Colors.white,
//                               shape: BoxShape.circle,
//                             ),
//                             child: Container(
//                               decoration: BoxDecoration(
//                                 shape: BoxShape.circle,
//                                 boxShadow: [
//                                   BoxShadow(
//                                     color: Colors.grey.shade400,
//                                     spreadRadius: 2,
//                                     blurRadius: 3,
//                                   ),
//                                 ],
//                               ),
//                               child: CircleAvatar(
//                                 backgroundColor: AppColors.white,
//                                 backgroundImage: image,
//                               ),
//                             ),
//                           ),
//                         ),
//                         Positioned(
//                           right: 6,
//                           bottom: 6,
//                           child: Container(
//                             width: 18,
//                             height: 18,
//                             decoration: BoxDecoration(
//                               gradient: LinearGradient(
//                                 colors: isSelected
//                                     ? [
//                                   AppColors.primary,
//                                   AppColors.primary.withAlpha(150),
//                                   Colors.white,
//                                 ]
//                                     : [
//                                   Colors.grey.shade400,
//                                   Colors.grey.shade400,
//                                 ],
//                                 begin: Alignment.topCenter,
//                                 end: Alignment.bottomCenter,
//                               ),
//                               shape: BoxShape.circle,
//                             ),
//                             padding: const EdgeInsets.all(2),
//                             child: Container(
//                               decoration: BoxDecoration(
//                                 color: isSelected
//                                     ? AppColors.primary
//                                     : Colors.grey.shade400,
//                                 shape: BoxShape.circle,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 0.005 * Responsive.getHeight(context)),
//               CustomText(
//                 name,
//                 fontSize: 12 * Responsive.getResponsiveText(context),
//                 fontWeight: FontWeight.w600,
//                 color: AppColors.textPrimary,
//                 overflow: TextOverflow.ellipsis,
//               ),
//               SizedBox(height: 0.002 * Responsive.getHeight(context)),
//               CustomText(
//                 department,
//                 fontSize: 12 * Responsive.getResponsiveText(context),
//                 color: AppColors.textPrimary,
//                 overflow: TextOverflow.ellipsis,
//               ),
//             ],
//           ),
//         ),
//         if (showDelete == true)
//           Positioned(
//             top: 0,
//             right: 0,
//             child: GestureDetector(
//               onTap: onDeleteTap,
//               child: Container(
//                 padding: const EdgeInsets.all(4),
//                 decoration: BoxDecoration(
//                   color: AppColors.error,
//                   borderRadius: BorderRadius.only(
//                     topRight: Radius.circular((borderRadius ?? 20) - 1),
//                     bottomLeft: Radius.circular(borderRadius ?? 10),
//                   ),
//                 ),
//                 child: const Icon(
//                   CupertinoIcons.clear_circled,
//                   color: AppColors.white,
//                   size: 18,
//                 ),
//               ),
//             ),
//           ),
//       ],
//     ),
//   );
// }

import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

class ProfileReportingCard extends StatelessWidget {
  const ProfileReportingCard({super.key});

  @override
  Widget build(BuildContext context) => Expanded(
    child: GridView.builder(
      // physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.only(
        top: 10 * Responsive.getResponsive(context),
        right: 10 * Responsive.getResponsive(context),
        bottom: 10 * Responsive.getResponsive(context),
        left: 10 * Responsive.getResponsive(context),
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 2 / 2.8,
      ),
      itemCount: 5, // example count
      itemBuilder: (context, index) =>  DepartmentSelectionCard(
        image: AssetImage("assets/dashboard/person_photo.png"),
        // imageSize: 20 * Responsive.getResponsive(context),
        // imageWidth: 0.5 * Responsive.getWidth(context),
        name: 'Ajit Maurya',
        department: 'QA',
        spaceBetweenImageText: 0.006 * Responsive.getHeight(context),
      ),
      shrinkWrap: true,
    ),
  );
}

class DepartmentSelectionModel {
  final ImageProvider image;
  final String name;
  final String department;

  DepartmentSelectionModel({
    required this.image,
    required this.name,
    required this.department,
  });
}

class DepartmentSelectionCard extends StatefulWidget {
  final ImageProvider image;
  final String name;
  final String department;
  final EdgeInsetsGeometry? boxPadding;
  final double? boxHeight;
  final double? boxWidth;
  final Color? borderColor;
  final double? borderRadius;
  final double? imageSize;
  final double? dotSize;
  final double? spaceBetweenImageText;
  final ValueChanged<DepartmentSelectionModel>? onSelected;

  const DepartmentSelectionCard({
    required this.image,
    required this.name,
    required this.department,
    this.boxHeight,
    this.boxWidth,
    this.imageSize,
    this.dotSize,
    this.spaceBetweenImageText,
    this.onSelected,
    super.key,
    this.borderRadius,
    this.borderColor,
    this.boxPadding,
  });

  @override
  State<DepartmentSelectionCard> createState() =>
      _DepartmentSelectionCardState();
}

class _DepartmentSelectionCardState extends State<DepartmentSelectionCard> {
  bool isSelected = false;

  void _toggleSelection() {
    setState(() {
      isSelected = !isSelected;
    });

    if (isSelected && widget.onSelected != null) {
      widget.onSelected!(
        DepartmentSelectionModel(
          image: widget.image,
          name: widget.name,
          department: widget.department,
        ),
      );
    }
  }

  @override
  // ignore: prefer_expression_function_bodies
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleSelection,
      child: Container(
        width: widget.boxWidth,
        height: widget.boxHeight,
        padding:
            widget.boxPadding ??
            EdgeInsets.symmetric(
              vertical: 6.0 * Responsive.getResponsive(context),
              horizontal: 12.0 * Responsive.getResponsive(context),
            ),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFEEF7FD) : Colors.white,
          borderRadius: BorderRadius.circular(
            widget.borderRadius ?? 20 * Responsive.getResponsive(context),
          ),
          border: Border.all(
            color: isSelected
                ? Colors.transparent
                : widget.borderColor ?? AppTheme.getColor(context).primary,
          ),
          boxShadow: [
            BoxShadow(
              color: isSelected ? Colors.grey.shade300 : Colors.transparent,
              spreadRadius: 3,
              blurRadius: 5,
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              children: [
                // Main outer circle
                Container(
                  width:
                      widget.imageSize ??
                      100 * Responsive.getResponsive(context),
                  height:
                      widget.imageSize ??
                      100 * Responsive.getResponsive(context),
                  padding: const EdgeInsets.all(3.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: isSelected
                          ? [
                              AppColors.primary,
                              AppColors.primary.withAlpha(150),
                              Colors.white,
                            ]
                          : [
                              Colors.grey.shade400,
                              Colors.grey.shade300,
                              Colors.white,
                            ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(12.0),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade400,
                            spreadRadius: 2,
                            blurRadius: 3,
                          ),
                        ],
                      ),
                      child: CircleAvatar(backgroundImage: widget.image),
                    ),
                  ),
                ),

                // Dot at bottom-right inside gradient ring
                Positioned(
                  right: 6,
                  bottom: 6,
                  child: Container(
                    width: widget.dotSize ?? 18,
                    height: widget.dotSize ?? 18,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: isSelected
                            ? [
                                AppColors.primary,
                                AppColors.primary.withAlpha(150),
                                Colors.white,
                              ]
                            : [Colors.grey.shade400, Colors.grey.shade400],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                      shape: BoxShape.circle,
                    ),
                    padding: const EdgeInsets.all(2),
                    child: Container(
                      decoration: BoxDecoration(
                        color: isSelected
                            ? AppColors.primary
                            : Colors.grey.shade400,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: widget.spaceBetweenImageText ?? 10),
            CustomText(
              widget.name,
              textAlign: TextAlign.center,
              fontWeight: FontWeight.w700,
              fontSize: 12 * Responsive.getDashboardResponsiveText(context),
            ),
            CustomText(
              widget.department,
              textAlign: TextAlign.center,
              fontWeight: FontWeight.w500,
              fontSize: 12 * Responsive.getDashboardResponsiveText(context),
            ),
          ],
        ),
      ),
    );
  }
}
