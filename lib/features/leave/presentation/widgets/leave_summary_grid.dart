import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

class LeaveSummaryItem {
  final String title;
  final String value;

  LeaveSummaryItem({required this.title, required this.value});
}

class LeaveSummaryGrid extends StatelessWidget {
  final List<LeaveSummaryItem> summaryItems;

  const LeaveSummaryGrid({required this.summaryItems, super.key});

  @override
  Widget build(BuildContext context) {
    final responsive = getResponsive(context);

    return Padding(
      padding: EdgeInsets.all(8 * responsive),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: summaryItems.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // 2 columns
          crossAxisSpacing: 8 * responsive,
          mainAxisSpacing: 8 * responsive,
          childAspectRatio: 4.5, // Control box shape
        ),
        itemBuilder: (context, index) {
          final item = summaryItems[index];
          return Container(
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.primary),
              borderRadius: BorderRadius.circular(12 * responsive),
            ),
            alignment: Alignment.center,
            child: CustomText(
              '${item.title} : ${item.value}',
              fontWeight: FontWeight.w500,
              fontSize: 14 * getResponsiveText(context),
              color: AppColors.primary,
            ),
          );
        },
      ),
    );
  }
}
