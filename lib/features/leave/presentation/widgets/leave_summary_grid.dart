import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/language_manager.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

class LeaveSummaryItem {
  final String title;
  final String value;
  final bool isKey;

  LeaveSummaryItem({
    required this.title,
    required this.value,
    this.isKey = true,
  });
}

class LeaveSummarySection extends StatelessWidget {
  final List<LeaveSummaryItem> summaryItems;
  final int maxLeavesInMonth;
  final VoidCallback onViewDates;
  final bool isOtherContainer;

  const LeaveSummarySection({
    required this.summaryItems,
    required this.maxLeavesInMonth,
    required this.onViewDates,
    required this.isOtherContainer,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.getResponsive(context);
    final textResponsive = Responsive.getResponsiveText(context);

    return Padding(
      padding: EdgeInsets.only(
        left: 12 * responsive,
        right: 12 * responsive,
        top: 10 * responsive,
      ),
      child: Column(
        children: [
          // Top Grid Section
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: summaryItems.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8 * responsive,
              mainAxisSpacing: 8 * responsive,
              childAspectRatio: 4.5,
            ),
            itemBuilder: (context, index) {
              final item = summaryItems[index];
              final displayTitle = item.isKey
                  ? LanguageManager().get(item.title)
                  : item.title;

              return Container(
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.primary),
                  borderRadius: BorderRadius.circular(12 * responsive),
                ),
                alignment: Alignment.center,
                child: CustomText(
                  '$displayTitle : ${item.value}',
                  fontWeight: FontWeight.w500,
                  fontSize: 14 * textResponsive,
                  color: AppColors.primary,
                ),
              );
            },
          ),

          if (isOtherContainer) ...[
            SizedBox(height: 12 * responsive),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                horizontal: 12 * responsive,
                vertical: 10 * responsive,
              ),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.primary),
                borderRadius: BorderRadius.circular(12 * responsive),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        LanguageManager().get('applicable_max_leaves_month'),
                        fontSize: 14 * textResponsive,
                        fontWeight: FontWeight.w500,
                      ),
                      CustomText(
                        '$maxLeavesInMonth',
                        fontSize: 14 * textResponsive,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                  Divider(height: 20 * responsive, color: Colors.grey.shade400),
                  GestureDetector(
                    onTap: onViewDates,
                    child: CustomText(
                      '${LanguageManager().get('view_dates')} ›',
                      decoration: TextDecoration.underline,
                      fontSize: 13 * textResponsive,
                      fontWeight: FontWeight.w500,
                      color: AppColors.primary,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 12 * responsive),
          ],
        ],
      ),
    );
  }
}
