import 'package:flutter/material.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:shimmer/shimmer.dart';

class ActiveAssetsCardShimmer extends StatelessWidget {
  const ActiveAssetsCardShimmer({super.key});

  @override
  Widget build(BuildContext context) => Shimmer.fromColors(
    baseColor: Colors.grey.shade300,
    highlightColor: Colors.grey.shade100,
    child: Container(
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(
          10 * Responsive.getResponsive(context),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(16 * Responsive.getResponsive(context)),
            decoration: const BoxDecoration(
              border: Border(bottom: BorderSide()),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 0.4 * Responsive.getWidth(context),
                  height: 0.02 * Responsive.getHeight(context),
                  color: Colors.white,
                ),
                SizedBox(height: 0.010 * Responsive.getHeight(context)),
                Container(
                  width: 0.3 * Responsive.getWidth(context),
                  height: 0.015 * Responsive.getHeight(context),
                  color: Colors.white,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16 * Responsive.getResponsive(context)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        width: 0.3 * Responsive.getWidth(context),
                        height: 0.15 * Responsive.getHeight(context),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(
                            12 * Responsive.getResponsive(context),
                          ),
                        ),
                      ),
                      SizedBox(width: 0.012 * Responsive.getHeight(context)),
                      const VerticalDivider(color: Colors.white, thickness: 1),
                      SizedBox(width: 0.012 * Responsive.getHeight(context)),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _shimmerText(context),
                            _verticalGap(context),
                            _shimmerText(context),
                            _verticalGap(context),
                            _shimmerText(context),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 0.02 * Responsive.getHeight(context)),
                Row(
                  children: [
                    Container(
                      width: 0.36 * Responsive.getWidth(context),
                      height: 0.020 * Responsive.getHeight(context),
                      color: Colors.white,
                    ),
                    SizedBox(width: 0.012 * Responsive.getHeight(context)),
                    Expanded(
                      child: Wrap(
                        spacing: 10 * Responsive.getResponsive(context),
                        children: List.generate(
                          3,
                          (_) => Container(
                            width: 0.12 * Responsive.getWidth(context),
                            height: 0.12 * Responsive.getWidth(context),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                10 * Responsive.getResponsive(context),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );

  Widget _shimmerText(BuildContext context) => Container(
    width: 0.5 * Responsive.getWidth(context),
    height: 18 * Responsive.getResponsiveText(context),
    color: Colors.white,
  );

  Widget _verticalGap(BuildContext context) =>
      SizedBox(height: 0.02 * Responsive.getHeight(context));
}
