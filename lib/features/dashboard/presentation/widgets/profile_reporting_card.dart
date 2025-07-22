import 'package:flutter/material.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/idea_box/presentation/widgets/common_container.dart';
import 'package:myco_flutter/widgets/custom_employee_card.dart';

class ProfileReportingCard extends StatelessWidget {
  const ProfileReportingCard({super.key});

  @override
  Widget build(BuildContext context) => CommonCard(
    title: "Reporting Person",
    bottomWidget: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.only(
              top: 10 * Responsive.getResponsive(context),
              right: 10 * Responsive.getResponsive(context),
              bottom: 10 * Responsive.getResponsive(context),
              left: 10 * Responsive.getResponsive(context),
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: Responsive.getGridConfig(context).itemCount,
              mainAxisSpacing: Responsive.getGridConfig(context).spacing,
              crossAxisSpacing: Responsive.getGridConfig(context).spacing,
              childAspectRatio: 2 / 2.7,
            ),
            itemCount: 3, // example count
            itemBuilder: (context, index) {
              return EmployeeSelectionCard(
                image: const AssetImage("assets/dashboard/person_photo.png"),
                name: 'Ajit Maurya',
                department: 'QA',
                isSelected: false,
              );
            },
            shrinkWrap: true,
          ),
        ),
      ],
    ),
  );
}
