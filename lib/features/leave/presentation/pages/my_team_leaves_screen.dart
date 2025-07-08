import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/leave/presentation/widgets/expandable_common_card.dart';

class MyTeamLeavesScreen extends StatefulWidget {
  const MyTeamLeavesScreen({super.key});

  @override
  State<MyTeamLeavesScreen> createState() => _MyTeamLeavesScreenState();
}

class _MyTeamLeavesScreenState extends State<MyTeamLeavesScreen> {
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.arrow_back_outlined),
      ),
      title: const Text('My Team Leaves'),
      centerTitle: true,
      elevation: 0,
    ),
    body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          spacing: 0.015 * Responsive.getHeight(context),
          children: [
            ExpandableCommonCard(
              headerColor: AppColors.primary,
              title: 'Sick Leave (Total 7)',
              bottomWidget: Container(),
            ),
          ],
        ),
      ),
    ),
  );
}
