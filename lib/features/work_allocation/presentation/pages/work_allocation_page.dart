import 'package:flutter/material.dart';
import 'package:myco_flutter/widgets/custom_appbar.dart';

class WorkAllocationPage extends StatefulWidget {
  const WorkAllocationPage({super.key});

  @override
  State<WorkAllocationPage> createState() => _WorkAllocationPageState();
}

class _WorkAllocationPageState extends State<WorkAllocationPage> {
  @override
  Widget build(BuildContext context) => const Scaffold(
    appBar: CustomAppbar(
      title: 'work_allocation',
      isKey: true,
    ),
    body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

      ],
    ),
  );
}
