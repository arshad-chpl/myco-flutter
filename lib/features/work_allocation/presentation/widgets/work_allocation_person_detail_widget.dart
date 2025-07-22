import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

class WorkAllocationPersonDetailWidget extends StatefulWidget {
  final String imagePath;
  final String empName;
  final String designation;
  final String fieldWithCity;

  const WorkAllocationPersonDetailWidget({
    required this.imagePath,
    required this.empName,
    required this.designation,
    required this.fieldWithCity,
    super.key
  });

  @override
  State<WorkAllocationPersonDetailWidget> createState() => _WorkAllocationPersonDetailWidgetState();
}

class _WorkAllocationPersonDetailWidgetState extends State<WorkAllocationPersonDetailWidget> {
  @override
  Widget build(BuildContext context) => ListTile(
      leading: Image(
        image: AssetImage(
          widget.imagePath
        ),
      ),
      title:  CustomText(
        widget.empName,
        fontWeight: FontWeight.w600,
      ),
      subtitle:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            widget.designation,
            isKey: true,
            color: AppColors.textGray,
            fontWeight: FontWeight.w500,
          ),
          CustomText(
            widget.fieldWithCity,
            color: AppColors.textGray,
            fontWeight: FontWeight.w500,
          ),
        ],
      ),
    );
}
