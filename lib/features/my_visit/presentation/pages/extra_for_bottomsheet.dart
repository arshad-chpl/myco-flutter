import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/features/my_visit/presentation/pages/assigned_to.dart';
import 'visit_with.dart'; 

class Bottom extends StatelessWidget {
  const Bottom({super.key});

  void _openVisitWithBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppTheme.getColor(context).surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) => const VisitWith(),
    );
  }

    void _openAssignedtoBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppTheme.getColor(context).surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) => const AssignedTo(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Page')),
      body: Center(

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => _openVisitWithBottomSheet(context),
              child: const Text('Open VisitWith BottomSheet'),
            ),
              ElevatedButton(
              onPressed: () => _openAssignedtoBottomSheet(context),
              child: const Text('Open Assignedto BottomSheet'),
            )
          ],
        ),
      ),
    );
  }
}
