import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:shimmer/shimmer.dart';

class LeaveBalanceSkeletonLoader extends StatelessWidget {
  const LeaveBalanceSkeletonLoader({super.key});

  @override
  Widget build(BuildContext context) => ListView.separated(
    padding: const EdgeInsets.all(16.0),
    itemCount: 7, // number of skeleton cards
    separatorBuilder: (_, __) => const SizedBox(height: 16),
    itemBuilder: (context, index) => Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppTheme.getColor(context).surface,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // title
            Container(
              height: 20,
              width: 0.4 * Responsive.getWidth(context),
              color: AppTheme.getColor(context).surface,
            ),
            const SizedBox(height: 12),
            // chips row
            Row(
              children: List.generate(
                3,
                (_) => Container(
                  margin: const EdgeInsets.only(right: 8),
                  height: 20,
                  width: 80,
                  color: AppTheme.getColor(context).surface,
                ),
              ),
            ),
            const SizedBox(height: 12),
            // a few more rows as placeholder
            Container(
              height: 12,
              width: double.infinity,
              color: AppTheme.getColor(context).surface,
            ),
            const SizedBox(height: 8),
            Container(
              height: 12,
              width: 0.8 * Responsive.getWidth(context),
              color: AppTheme.getColor(context).surface,
            ),
          ],
        ),
      ),
    ),
  );
}
