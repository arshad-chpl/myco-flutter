import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/work_allocation/presentation/widget/work_allocation_card_list_view.dart';
import 'package:myco_flutter/widgets/custom_appbar.dart';
import 'package:myco_flutter/widgets/custom_searchfield.dart';
import 'package:myco_flutter/widgets/floating_action_btn.dart';

class WorkAllocationPage extends StatefulWidget {
  const WorkAllocationPage({super.key});

  @override
  State<WorkAllocationPage> createState() => _WorkAllocationPageState();
}

class _WorkAllocationPageState extends State<WorkAllocationPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: const CustomAppbar(title: 'work_allocation', isKey: true),
    body: Padding(
      padding: EdgeInsets.all(13 * Responsive.getResponsive(context)),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(13 * Responsive.getResponsive(context)),
            child: const CustomSearchField(hintText: 'Search'),
          ),
          SizedBox(height: 0.023 * Responsive.getHeight(context)),

          // MonthYearHeader(
          //   onChanged: (month, year) => month + year,
          // ),
          // SizedBox(height: 0.023 * Responsive.getHeight(context),),
          const Expanded(child: WorkAllocationCardListView()),
        ],
      ),
    ),
    floatingActionButton: ExpandableFab(
      innericonsize: 30 * Responsive.getResponsive(context),
      imageSize: 50 * Responsive.getResponsive(context),
      onTap: () {
        context.go('/assign-work');

      },
      openIcon: Icons.add,
      closeIcon: Icons.close,
      actions: [],
    ),
  );
}
