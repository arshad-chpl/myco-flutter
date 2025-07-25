import 'package:flutter/material.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/widgets/custom_myco_button/common_card.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerSalaryLoadingWidget extends StatelessWidget {
  final String loadingFor;
  const ShimmerSalaryLoadingWidget({required this.loadingFor, super.key});

  @override
  Widget build(BuildContext context) {
    // CTC Shimmer
    if (loadingFor == 'ctc') {
      return Shimmer(
        gradient: LinearGradient(
          colors: [Colors.grey.shade400, Colors.grey.shade100],
        ),
        child: Column(
          children: [
            CommonCard(
              title: 'title',
              bottomWidget: Container(
                height: 0.18 * Responsive.getHeight(context),
              ),
            ),
            SizedBox(height: 0.01 * Responsive.getHeight(context)),
            CommonCard(
              title: 'title',
              bottomWidget: Container(
                height: 0.1 * Responsive.getHeight(context),
              ),
            ),
            SizedBox(height: 0.01 * Responsive.getHeight(context)),
            CommonCard(
              title: 'title',
              bottomWidget: Container(
                height: 0.05 * Responsive.getHeight(context),
              ),
            ),
          ],
        ),
      );
    }

    // Payslip and Other Earnings Shimmer
    if (loadingFor == 'payslip') {
      return Column(
        children: [
          Container(
            height: 0.65 * Responsive.getHeight(context),
            padding: EdgeInsets.symmetric(
              horizontal: 0.08 * Responsive.getWidth(context),
            ),
            child: ListView.separated(
              itemCount: 5,
              itemBuilder: (context, index) => Shimmer(
                gradient: LinearGradient(
                  colors: [Colors.grey.shade400, Colors.grey.shade100],
                ),
                child: CommonCard(
                  title: 'title',
                  bottomWidget: Container(
                    height: 0.05 * Responsive.getHeight(context),
                  ),
                ),
              ),
              separatorBuilder: (_, __) =>
                  SizedBox(height: 0.01 * Responsive.getHeight(context)),
            ),
          ),
        ],
      );
    }

    // Payslip Details Shimmer
    if (loadingFor == 'payslipDetails') {
      return Shimmer(
        gradient: LinearGradient(
          colors: [Colors.grey.shade400, Colors.grey.shade100],
        ),
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 0.08 * Responsive.getWidth(context),
          ),
          child: Column(
            children: [
              Shimmer(
                gradient: LinearGradient(
                  colors: [Colors.grey.shade400, Colors.grey.shade100],
                ),
                child: Column(
                  children: [
                    SizedBox(height: 0.1 * Responsive.getHeight(context)),
                    Container(
                      height: 0.2 * Responsive.getHeight(context),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(height: 0.05 * Responsive.getHeight(context)),
                    const CircleAvatar(radius: 70),
                    SizedBox(height: 0.02 * Responsive.getHeight(context)),
                    SizedBox(
                      height: 0.2 * Responsive.getHeight(context),
                      child: ListView.separated(
                        itemCount: 3,
                        itemBuilder: (context, index) => CommonCard(
                          title: 'title',
                          bottomWidget: Container(
                            height: 0.1 * Responsive.getHeight(context),
                          ),
                        ),
                        separatorBuilder: (context, index) => SizedBox(
                          height: 0.01 * Responsive.getHeight(context),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }
    return Container();
  }
}
