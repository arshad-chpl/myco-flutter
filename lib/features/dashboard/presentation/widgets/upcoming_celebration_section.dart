import 'package:flutter/material.dart';
import 'package:myco_flutter/constants/app_assets.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/dashboard/domain/entites/my_unit_response_entity.dart';
import 'package:myco_flutter/features/dashboard/presentation/widgets/custom_section.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

part 'custom_upcoming_celebration_card.dart';

class UpcomingCelebrationSection extends StatelessWidget {
  final List<TodayBirthDayEntity>? birthdays;
  const UpcomingCelebrationSection({super.key, this.birthdays});

  @override
  Widget build(BuildContext context) {
    if (birthdays == null || birthdays!.isEmpty) {
      return const SizedBox.shrink();
    }
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
          itemCount: birthdays?.length ?? 0,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return UpcomingCelebrationCard(
              name: birthdays?[index].userFullName ?? '',
              description:
                  '${birthdays?[index].userDesignation ?? ''}\n${birthdays?[index].blockName ?? ''}-${birthdays?[index].floorName ?? ''}',
              imagePath: birthdays?[index].userProfilePic ?? '',
              chipLabel: birthdays?[index].totalYearView ?? '',
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
