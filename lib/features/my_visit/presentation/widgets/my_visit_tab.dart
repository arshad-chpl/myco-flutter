import 'package:flutter/material.dart';
import 'package:myco_flutter/constants/constants.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/my_visit/presentation/widgets/date_selection_row.dart';
import 'package:myco_flutter/widgets/custom_searchfield.dart';

class MyVisitTab extends StatelessWidget {
  final TextEditingController searchController;
  final FocusNode searchFocus;
  final String formattedDate;
  final VoidCallback goToPreviousDate;
  final VoidCallback goToNextDate;
  final VoidCallback selectDateFromPicker;
  final List<Map<String, dynamic>> visitList;
  final Widget Function(BuildContext, Map<String, dynamic>, int, int)
  buildVisitCard;
  final Widget buildAutoExpenseCard;

  const MyVisitTab({
    super.key,
    required this.searchController,
    required this.searchFocus,
    required this.formattedDate,
    required this.goToPreviousDate,
    required this.goToNextDate,
    required this.selectDateFromPicker,
    required this.visitList,
    required this.buildVisitCard,
    required this.buildAutoExpenseCard,
  });

  @override
  Widget build(BuildContext context) => Padding(
    padding: EdgeInsets.symmetric(
      horizontal:
          Responsive.getResponsive(context) *
          VariableBag.screenHorizontalPadding,
      vertical:
          Responsive.getResponsive(context) * VariableBag.tabBarAfterSpace,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // DateSelectionRow
        DateSelectionRow(
          formattedDate: formattedDate,
          goToPreviousDate: goToPreviousDate,
          goToNextDate: goToNextDate,
          selectDateFromPicker: selectDateFromPicker,
        ),
        SizedBox(height: Responsive.getHeight(context) * 0.010),

        // Search Field
        CustomSearchField(
          controller: searchController,
          hintText: 'Search with Customer',
        ),
        SizedBox(height: Responsive.getHeight(context) * 0.010),
        // Auto Expense Card
        buildAutoExpenseCard,
        SizedBox(height: Responsive.getHeight(context) * 0.010),

        // Visit List - Only this is scrollable
        Expanded(
          child: ListView.builder(
            itemCount: visitList.length,
            itemBuilder: (context, index) => buildVisitCard(
              context,
              visitList[index],
              index,
              visitList.length,
            ),
          ),
        ),
      ],
    ),
  );
}
