import 'package:flutter/material.dart';
import 'package:myco_flutter/features/work_allocation/presentation/pages/status_tracker.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) => Scaffold(
    body: SingleChildScrollView(
      child: Column(
        children: [
          StatusTracker(currentStep: 1),
          StatusTracker(currentStep: 2),
          
        ],
      ),
    ),
  );
}
