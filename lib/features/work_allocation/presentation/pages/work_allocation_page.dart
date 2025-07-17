import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myco_flutter/constants/app_assets.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/work_allocation/presentation/widget/work_allocation_card_list_view.dart';
import 'package:myco_flutter/widgets/custom_appbar.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_searchfield.dart';

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
    floatingActionButton: MyCoButton(
      onTap: () {
        context.push('');
      },
      height: 0.09 * Responsive.getHeight(context),
      width: 0.20 * Responsive.getWidth(context),
      boarderRadius: 100,
      isShadowBottomLeft: true,
      isShadowBottomRight: true,
      title: '',
      image: const Image(image: AssetImage(AppAssets.plus)),
    ),
  );
}
