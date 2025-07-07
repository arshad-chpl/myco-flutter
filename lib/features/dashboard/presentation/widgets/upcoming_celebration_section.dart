import 'package:flutter/material.dart';
import 'package:myco_flutter/constants/app_assets.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/dashboard/presentation/widgets/custom_section.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

part 'custom_upcoming_celebration_card.dart';

class UpcomingCelebrationSection extends StatelessWidget {
  const UpcomingCelebrationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomSection(
      title: 'Upcoming Celebrations',
      subtitle: 'Spread smiles — celebrate someone today!',
      icon: Image.asset(
        AppAssets.quickAccessGif,
        height: 70 * Responsive.getResponsiveOnWidth(context),
      ),
      count: '04',
      hasViewMoreButton: true,
      child: SizedBox(
        width: Responsive.getWidth(context),
        height: 248,
        child: ListView.builder(
          itemCount: 3,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return UpcomingCelebrationCard(
              name: 'Arsahd Shaikh $index',
              description: index == 1
                  ? 'Big Decsription of hello there $index'
                  : 'Big Decsription of  $index',
              imagePath:
                  'https://plus.unsplash.com/premium_photo-1690407617542-2f210cf20d7e?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cGVyc29ufGVufDB8fDB8fHww',
              chipLabel: 'BirthDay',
              onButtonPressed: () {},
              cardWidth: 300 * Responsive.getDashboardResponsiveText(context),
              cardPadding: EdgeInsets.zero,
              // contentPadding: EdgeInsets.zero,
              buttonLabel: 'Celebrate',
              buttonBorderRadius:
                  32 * Responsive.getDashboardResponsiveText(context),
            );
          },
        ),
      ),
    );
  }
}
