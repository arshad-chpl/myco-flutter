import 'package:flutter/material.dart';
import 'package:myco_flutter/constants/app_assets.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/dashboard/presentation/widgets/custom_department_container.dart';
import 'package:myco_flutter/features/dashboard/presentation/widgets/custom_section.dart';

class YourDepartmentSection extends StatelessWidget {
  const YourDepartmentSection({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomSection(
                  title: 'Your Department',
                  subtitle: 'The people who help make things happen.',
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
                        return Padding(
                          padding: const EdgeInsets.only(right: 24.0),
                          child: ProfileCard(
                            imagePath:
                                'https://plus.unsplash.com/premium_photo-1690407617542-2f210cf20d7e?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cGVyc29ufGVufDB8fDB8fHww',
                            name: 'Name',
                            department: 'Sales',
                          ),
                        );
                      },
                    ),
                  ),
                );
  }
}