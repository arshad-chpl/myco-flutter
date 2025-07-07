import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_text.dart';
import 'package:myco_flutter/widgets/custom_text_field.dart';

Future<String?> showAssetsBottomSheet({
  required BuildContext context,
  required List<String> dataList,
  required String heading,
  Color? selectedBackgroundColor,
  Color? borderColor,
}) => showModalBottomSheet(
  context: context,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.vertical(
      top: Radius.circular(20 * Responsive.getResponsive(context)),
    ),
  ),
  isScrollControlled: true,
  builder: (context) => SizedBox(
    height:
        0.6 * Responsive.getHeight(context) +
        MediaQuery.of(context).viewInsets.bottom,
    child: AssetsBottomSheet(
      categories: dataList,
      heading: heading,
      borderColor: borderColor,
      selectedBackgroundColor: selectedBackgroundColor,
      onCategorySelected: (selected) {
        Navigator.pop(context, selected);
      },
    ),
  ),
);

class AssetsBottomSheet extends StatefulWidget {
  final List<String> categories;
  final Color? selectedBackgroundColor;
  final Color? borderColor;
  final String heading;
  final void Function(String)? onCategorySelected;

  const AssetsBottomSheet({
    required this.categories,
    required this.heading,
    super.key,
    this.onCategorySelected,
    this.selectedBackgroundColor,
    this.borderColor,
  });

  @override
  State<AssetsBottomSheet> createState() => _AssetsBottomSheetState();
}

class _AssetsBottomSheetState extends State<AssetsBottomSheet> {
  late List<String> filteredCategories;
  String? selectedCategory;

  @override
  void initState() {
    super.initState();
    filteredCategories = List.from(widget.categories);
  }

  void filterSearch(String query) {
    setState(() {
      filteredCategories = widget.categories
          .where((item) => item.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) => Padding(
    padding: EdgeInsets.all(16 * Responsive.getResponsive(context)),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomText(
          widget.heading,
          fontSize: 22 * Responsive.getResponsiveText(context),
          fontWeight: FontWeight.w600,
          color: AppTheme.getColor(context).onSurfaceVariant,
        ),
        SizedBox(height: 0.012 * Responsive.getHeight(context)),

        // Search Bar
        MyCoTextfield(
          onChanged: filterSearch,
          hintText: 'Search',
          textAlignment: TextAlign.start,
          hintTextStyle: AppTheme.getTextStyle(
            context,
          ).labelLarge!.copyWith(color: AppColors.textSecondary),
          preFixImage: 'assets/images/search.png',
          isSuffixIconOn: true,
          contentPadding: EdgeInsets.only(
            top: 0.012 * Responsive.getHeight(context),
          ),
          boarderRadius: 12 * Responsive.getResponsive(context),
        ),
        SizedBox(height: 0.012 * Responsive.getHeight(context)),

        // Scrollable Category List
        Expanded(
          child: ListView.builder(
            itemCount: filteredCategories.length,
            itemBuilder: (context, index) {
              final category = filteredCategories[index];
              final isSelected = category == selectedCategory;

              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 6.0),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedCategory = category;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.all(
                      12 * Responsive.getResponsive(context),
                    ),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? widget.selectedBackgroundColor ??
                                const Color(0xffEEF7FD)
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(
                        12 * Responsive.getResponsive(context),
                      ),
                      border: Border.all(
                        color:
                            widget.borderColor ??
                            AppTheme.getColor(context).secondary,
                        width: isSelected ? 1.8 : 0.5,
                      ),
                    ),
                    child: Center(
                      child: CustomText(
                        category,
                        textAlign: TextAlign.center,
                        color: AppTheme.getColor(context).onSurface,
                        fontWeight: FontWeight.w600,
                        fontSize: 20 * Responsive.getResponsiveText(context),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),

        // Submit Button
        Padding(
          padding: EdgeInsets.only(
            top: 12.0 * Responsive.getResponsive(context),
          ),
          child: MyCoButton(
            onTap: () {
              if (selectedCategory != null &&
                  widget.onCategorySelected != null) {
                widget.onCategorySelected!(selectedCategory!);
              }
            },
            title: 'SUBMIT',
            isShadowBottomLeft: true,
            boarderRadius: 50 * Responsive.getResponsive(context),
            fontFamily: 'Gilroy-Bold',
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    ),
  );
}
