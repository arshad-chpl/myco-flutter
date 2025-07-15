import 'package:flutter/material.dart';
import 'package:myco_flutter/features/my_visit/presentation/pages/add_new_visit.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';

class Visit extends StatefulWidget {
  const Visit({super.key});

  @override
  State<Visit> createState() => _AddNewVisitState();
}

class _AddNewVisitState extends State<Visit> {
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Visit')),
    body: const Column(
      children: [
        // Your content
      ],
    ),
    floatingActionButton: Padding(
      padding: const EdgeInsets.only(top: 12, right: 20, left: 20, bottom: 12),
      child: MyCoButton(
        height: 63,
        width: 63,
        boarderRadius: 50,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddNewVisit()),
          );
        },
        title: "",
        isShadowTopLeft: true,
        image: const Icon(Icons.add, color: Colors.white, size: 50, weight: 30),
      ),
    ),
  );
}
