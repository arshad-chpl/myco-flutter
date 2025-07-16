import 'package:flutter/material.dart';
import 'package:myco_flutter/widgets/common_card.dart';
import 'package:myco_flutter/widgets/custom_appbar.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) => const Scaffold(
    appBar: CustomAppbar(title: 'Work Allocation'),
    body: Column(
      children: [
        CommonCard(
          title: 'Assign By ',
          bottomWidget: ListTile(
           
            title: CustomText('Mukund Madhav'),
            subtitle: CustomText('QA'),
          ),
        ),
      ],
    ),
  );
}
