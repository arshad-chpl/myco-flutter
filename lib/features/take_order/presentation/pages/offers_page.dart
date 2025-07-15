import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/language_manager.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/take_order/presentation/widgets/offer_box.dart';
import 'package:myco_flutter/widgets/custom_appbar.dart';

// ignore: must_be_immutable
class OffersPage extends StatelessWidget {
  OffersPage({super.key});

  List<Map<String, String>> offerContent = [
    {
      'title': 'Carrom Offer',
      'textContent':
          'Buy 99 Ujla Goti (20 Point) + Kaala Goti (10 Point) + '
          'Rani Goti (50 Point) and get 1 Carrom Slades (Carrom Play) free',
      'offerTime': 'Offer Valid Till : 11:59 PM, 31st Jul 2027',
    },
    {
      'title': 'Carrom Offer',
      'textContent':
          'Buy 205 Cno (Rs. 5 Chips Cno) Salted (Rs. 5 Chips Chrunchy Mirchi wafer)+ Plain (Rs. 5 Fryums Noodle) Masala (Rs. 5 Fryums Pasta) and get 5 Murmura (Rs. 5 Sev Murmura Masala) free',
      'offerTime': 'Offer Valid Till : 11:59 PM, 31st Jul 2027',
    },
    {
      'title': 'Carrom Offer',
      'textContent':
          'Buy 99 Ujla Goti (20 Point) + Kaala Goti (10 Point) + '
          'Rani Goti (50 Point) and get 1 Carrom Slades (Carrom Play) free',
      'offerTime': 'Offer Valid Till : 11:59 PM, 31st Jul 2027',
    },
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: AppTheme.getColor(context).surface,
    appBar: CustomAppbar(appBarText: LanguageManager().get('offers')),
    body: Container(
      padding: EdgeInsets.symmetric(
        horizontal: 0.08 * Responsive.getWidth(context),
      ),
      child: Column(
        children: [
          Expanded(
            child: ListView.separated(
              itemCount: offerContent.length,
              itemBuilder: (context, index) => OfferBox(
                title: offerContent[index]['title'] ?? '',
                textContent: offerContent[index]['textContent'] ?? '',
                offerTime: offerContent[index]['offerTime'] ?? '',
              ),
              separatorBuilder: (context, index) =>
                  SizedBox(height: 0.01 * Responsive.getHeight(context)),
            ),
          ),
        ],
      ),
    ),
  );
}
