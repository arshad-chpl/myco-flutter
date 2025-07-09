import 'package:flutter/material.dart';
import 'package:myco_flutter/constants/app_assets.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/dashboard/presentation/widgets/custom_myteam%20(1).dart';
import 'package:myco_flutter/features/dashboard/presentation/widgets/custom_section.dart';
import 'package:myco_flutter/widgets/border_container_wraper.dart';

class MyTeamSection extends StatelessWidget {
  const MyTeamSection({super.key});

  @override
  Widget build(BuildContext context) => CustomSection(
      title: 'My Team',
      subtitle: 'It’s Team That can Make it Happen',
      icon: Image.asset(
        AppAssets.quickAccessGif,
        height: 70 * Responsive.getResponsiveOnWidth(context),
      ),
      hasViewMoreButton: true,
      count: '04',
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: BorderContainerWraper(
        child: OverlappingPeopleCard(
          people: [
            PersonData(
              firstName: 'person',
              lastName: 'name',
              imagePath:
                  'https://plus.unsplash.com/premium_photo-1690407617542-2f210cf20d7e?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cGVyc29ufGVufDB8fDB8fHww',
            ),
            PersonData(
              firstName: 'person',
              lastName: 'name',
              imagePath:
                  'https://plus.unsplash.com/premium_photo-1690407617542-2f210cf20d7e?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cGVyc29ufGVufDB8fDB8fHww',
            ),
            PersonData(
              firstName: 'person',
              lastName: 'name',
              imagePath:
                  'https://plus.unsplash.com/premium_photo-1690407617542-2f210cf20d7e?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cGVyc29ufGVufDB8fDB8fHww',
            ),
            PersonData(
              firstName: 'person',
              lastName: 'name',
              imagePath:
                  'https://plus.unsplash.com/premium_photo-1690407617542-2f210cf20d7e?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cGVyc29ufGVufDB8fDB8fHww',
            ),
          ],
        ),
      ),
    );
}
