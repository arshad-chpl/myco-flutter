import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
  final Widget Function(BuildContext, Map<String, dynamic>, int, Size, int)
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
  Widget build(BuildContext context) => SingleChildScrollView(
    padding: EdgeInsets.all(Responsive.getWidth(context) * 0.04),
    child: Column(
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
        // VisitSearchBar(
        //   controller: searchController,
        //   focusNode: searchFocus,
        //   hintText: 'Search with Customer',
        // ),
        CustomSearchField(
          controller: searchController,
          hintText: 'Search With Customer',
        ),
        SizedBox(height: Responsive.getHeight(context) * 0.010),

        // Auto Expense Card
        buildAutoExpenseCard,
        SizedBox(height: Responsive.getHeight(context) * 0.010),

        // Visit List
        ListView.builder(
          itemCount: visitList.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => buildVisitCard(
            context,
            visitList[index],
            index,
            MediaQuery.of(context).size,
            visitList.length,
          ),
        ),
      ],
    ),
  );
}
