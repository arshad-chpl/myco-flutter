import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';

class OfferBox extends StatelessWidget {
  const OfferBox({
    required this.title,
    required this.textContent,
    required this.offerTime,
    super.key,
  });

  final String title;
  final String textContent;
  final String offerTime;
  @override
  Widget build(BuildContext context) => Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12 * getResponsive(context)),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Header
        Container(
          height: 0.07 * getHeight(context),
          padding: EdgeInsets.all(10 * getResponsive(context)),
          decoration: BoxDecoration(
            color: AppColors.myCoCyan,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(12 * getResponsive(context)),
            ),
          ),
          child: Row(
            children: [
              Image.asset(
                'assets/take_order/offer.png',
                height: 0.03 * getHeight(context),
              ),
              SizedBox(width: 0.02 * getWidth(context)),
              Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20 * getResponsiveText(context),
                ),
              ),
            ],
          ),
        ),

        // Offer Description
        Padding(
          padding: EdgeInsets.all(14 * getResponsive(context)),
          child: Text(
            textContent,
            style: TextStyle(
              fontSize: 18 * getResponsiveText(context),
              color: Colors.grey[700],
            ),
          ),
        ),

        // Footer with validity
        Padding(
          padding: EdgeInsets.fromLTRB(
            12 * getResponsive(context),
            0,
            12 * getResponsive(context),
            12 * getResponsive(context),
          ),
          child: Text(
            offerTime,
            style: TextStyle(
              fontSize: 16 * getResponsiveText(context),
              color: AppColors.primary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    ),
  );
}
