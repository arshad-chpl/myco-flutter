import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:myco_flutter/constants/constants.dart';
import 'package:myco_flutter/core/router/route_paths.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/di/injector.dart';
import 'package:myco_flutter/features/work_allocation/presentation/bloc/work_allocation/work_allocation_bloc.dart';
import 'package:myco_flutter/features/work_allocation/presentation/widgets/work_allocation_card_list_view.dart';
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
  Widget build(BuildContext context) => BlocProvider<WorkAllocationBloc>(
    create: (context) => sl<WorkAllocationBloc>(),
    child: Scaffold(
      appBar: const CustomAppbar(title: 'work_allocation', isKey: true),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal:
              VariableBag.screenHorizontalPadding *
              Responsive.getResponsive(context),
        ),
        child: Column(
          children: [
            const CustomSearchField(hintText: 'Search'),
            SizedBox(height: 0.023 * Responsive.getHeight(context)),
            const Expanded(child: WorkAllocationCardListView()),
          ],
        ),
      ),
      floatingActionButton: ExpandableFab(
        innericonsize: 30 * Responsive.getResponsive(context),
        imageSize: 50 * Responsive.getResponsive(context),
        onTap: () {
          context.push(RoutePaths.assignWork);
        },
        openIcon: Icons.add,
        closeIcon: Icons.close,
        actions: [],
      ),
    ),
  );
}
