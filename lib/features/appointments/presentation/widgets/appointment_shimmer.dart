import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:shimmer/shimmer.dart';

class AppointmentShimmer extends StatelessWidget {
  const AppointmentShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.getResponsive(context);
    return ListView.builder(
      itemCount: 4,
      padding: EdgeInsets.symmetric(horizontal: 16 * responsive),
      itemBuilder: (context, index) => Padding(
        padding: EdgeInsets.only(bottom: 23 * responsive),
        child: Shimmer.fromColors(
          baseColor: AppTheme.getColor(context).outlineVariant,
          highlightColor: AppColors.gray,
          child: Container(
            padding: EdgeInsets.all(13 * responsive),
            decoration: BoxDecoration(
              color: AppTheme.getColor(context).onPrimary,
              borderRadius: BorderRadius.circular(12 * responsive),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header time bar
                Container(
                  height: 10 * responsive,
                  width: 100 * responsive,
                  color: AppTheme.getColor(context).onPrimary,
                ),
                SizedBox(height: 12 * responsive),

                // Person details section
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 0.12 * Responsive.getWidth(context),
                      height: 0.06 * Responsive.getHeight(context),
                      decoration: BoxDecoration(
                        color: AppTheme.getColor(context).onPrimary,
                        shape: BoxShape.circle,
                      ),
                    ),
                    SizedBox(width: 10 * responsive),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 10 * responsive,
                            width: double.infinity,
                            color: AppTheme.getColor(context).onPrimary,
                          ),
                          SizedBox(height: 6 * responsive),
                          Container(
                            height: 10 * responsive,
                            width: 150 * responsive,
                            color: AppTheme.getColor(context).onPrimary,
                          ),
                          SizedBox(height: 6 * responsive),
                          Container(
                            height: 10 * responsive,
                            width: 100 * responsive,
                            color: AppTheme.getColor(context).onPrimary,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 16 * responsive),
                const Divider(color: Colors.white),

                // Reason for appointment
                SizedBox(height: 10 * responsive),
                Container(
                  height: 10 * responsive,
                  width: double.infinity,
                  color: AppTheme.getColor(context).onPrimary,
                ),
                SizedBox(height: 8 * responsive),
                Container(
                  height: 10 * responsive,
                  width: double.infinity,
                  color: AppTheme.getColor(context).onPrimary,
                ),

                // Location and Phone
                SizedBox(height: 8 * responsive),
                Container(
                  height: 10 * responsive,
                  width: double.infinity,
                  color: AppTheme.getColor(context).onPrimary,
                ),
                SizedBox(height: 8 * responsive),
                Container(
                  height: 10 * responsive,
                  width: 150 * responsive,
                  color: AppTheme.getColor(context).onPrimary,
                ),

                // Buttons
                SizedBox(height: 20 * responsive),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 0.045 * Responsive.getHeight(context),
                        decoration: BoxDecoration(
                          color: AppTheme.getColor(context).onPrimary,
                          borderRadius: BorderRadius.circular(23 * responsive),
                        ),
                      ),
                    ),
                    SizedBox(width: 12 * responsive),
                    Expanded(
                      child: Container(
                        height: 0.045 * Responsive.getHeight(context),
                        decoration: BoxDecoration(
                          color: AppTheme.getColor(context).onPrimary,
                          borderRadius: BorderRadius.circular(23 * responsive),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
