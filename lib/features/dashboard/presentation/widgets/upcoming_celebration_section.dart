import 'package:flutter/material.dart';
import 'package:myco_flutter/constants/app_assets.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/dashboard/presentation/widgets/custom_section.dart';
import 'package:myco_flutter/features/dashboard/presentation/widgets/custom_upcomingcelebrationcard.dart';

class UpcomingCelebrationSection extends StatelessWidget {
  const UpcomingCelebrationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomSection(
                  title: 'Upcoming Celebrations',
                  subtitle: 'Spread smiles — celebrate someone today!',
                  icon: Image.asset(
                    AppAssets.quickAccessGif,
                    height: 70 * getResponsiveOnWidth(context),
                  ),
                  count: '04',
                  hasViewMoreButton: true,
                  child: SizedBox(
                    width: getWidth(context),
                    height: 0.3 * getHeight(context),
                    child: ListView.builder(
                      itemCount: 3,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return CustomProfileCard(
                          name: 'Person Name',
                          description: 'Decs',
                          imagePath:
                              'https://plus.unsplash.com/premium_photo-1690407617542-2f210cf20d7e?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cGVyc29ufGVufDB8fDB8fHww',
                          chipLabel: 'BirthDay',
                          buttonLabel: '',
                          onButtonPressed: () {},
                          cardWidth: getWidth(context) * 0.8,
                          cardPadding: EdgeInsets.zero,
                          // contentPadding: EdgeInsets.zero,
                        );
                      },
                    ),
                  ),
                );
  }
}