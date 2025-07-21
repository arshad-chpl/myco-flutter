import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/language_manager.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_searchfield.dart';
import 'package:myco_flutter/widgets/custom_text.dart';
import 'package:myco_flutter/widgets/custom_text_field.dart';

Future<List<String>?> showMultiSelectBottomSheet({
  required BuildContext context,
  required List<Map<String, String>> dataList,
  required String heading,
  final List<String>? selectedIds,
  ImageProvider? icon,
  String? searchHint,
  String? btnTitle,
}) => showModalBottomSheet<List<String>>(
  context: context,
  isScrollControlled: true,
  backgroundColor: Colors.transparent,
  builder: (_) => _MultiSelectBottomSheet(
    heading: heading,
    dataList: dataList,
    selectedIds: selectedIds,
    icon: icon,
    searchHint: searchHint,
    btnTitle: btnTitle,
  ),
);

class _MultiSelectBottomSheet extends StatefulWidget {
  final List<Map<String, String>> dataList;
  final String heading;
  final List<String>? selectedIds;
  final String? searchHint;
  final String? btnTitle;
  final ImageProvider? icon;

  const _MultiSelectBottomSheet({
    required this.dataList,
    required this.heading,
    this.selectedIds,
    this.searchHint,
    this.btnTitle,
    this.icon,
  });

  @override
  State<_MultiSelectBottomSheet> createState() =>
      _MultiSelectBottomSheetState();
}

class _MultiSelectBottomSheetState extends State<_MultiSelectBottomSheet> {
  String searchQuery = '';

  Set<String> selectedIds = {};

  late List<Map<String, String>> filteredList;

  @override
  void initState() {
    super.initState();
    filteredList = List.from(widget.dataList);
    selectedIds = widget.selectedIds != null ? widget.selectedIds!.toSet() : {};
  }

  void _onSearch(String query) {
    setState(() {
      searchQuery = query;
      filteredList = widget.dataList
          .where(
            (item) => (item['department'] ?? '').toLowerCase().contains(
              query.toLowerCase(),
            ),
          )
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) => Container(
    height: Responsive.getHeight(context) * 0.625,
    width: Responsive.getWidth(context),
    padding: EdgeInsets.all(16 * Responsive.getResponsive(context)),
    decoration: const BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title + Optional Icon
        Row(
          children: [
            if (widget.heading.isNotEmpty)
              Expanded(
                child: CustomText(
                  widget.heading,
                  fontWeight: FontWeight.w700,
                  fontSize: 18 * Responsive.getResponsiveText(context),
                  color: AppColors.textPrimary,
                ),
              ),
            if (widget.icon != null)
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image(
                    image: widget.icon!,
                    width: 0.04 * Responsive.getWidth(context),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
          ],
        ),

        SizedBox(height: 12 * Responsive.getResponsive(context)),

        // Search field
        CustomSearchField(
          hintText: widget.searchHint ?? 'search',
          onChanged: _onSearch,
        ),

        SizedBox(height: 12 * Responsive.getResponsive(context)),

        // List of items
        Expanded(
          child: ListView.builder(
            itemCount: filteredList.length,
            itemBuilder: (context, index) {
              final item = filteredList[index];
              final id = item['id'];
              final name = item['department'] ?? '';
              final isSelected = selectedIds.contains(id);

              if (id == null || name.isEmpty) return const SizedBox.shrink();

              return Container(
                margin: EdgeInsets.symmetric(
                  vertical: 6 * Responsive.getResponsive(context),
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: isSelected
                        ? AppTheme.getColor(context).primary
                        : AppTheme.getColor(context).outline,
                    width: isSelected ? 1.5 : 1,
                  ),
                ),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      if (isSelected) {
                        selectedIds.remove(id);
                      } else {
                        selectedIds.add(id!);
                      }
                    });

                    log(selectedIds.toString(), name: "selectedIds");
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 10 * Responsive.getResponsive(context),
                      horizontal: 16 * Responsive.getResponsive(context),
                    ),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? AppTheme.getColor(context).surfaceContainer
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(11),
                    ),
                    child: CustomText(
                      name,
                      textAlign: TextAlign.center,
                      fontWeight: FontWeight.w700,
                      fontSize: 14 * Responsive.getResponsiveText(context),
                      color: AppColors.textPrimary,
                    ),
                  ),
                ),
              );
            },
          ),
        ),

        SizedBox(height: Responsive.getResponsive(context) * 0.16),

        // Submit button
        MyCoButton(
          title: widget.btnTitle ?? LanguageManager().get('select'),
          boarderRadius: 50,
          height: 0.05 * Responsive.getHeight(context),
          isShadowBottomLeft: true,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w500,
          onTap: () {
            log(selectedIds.toString(), name: "selectedIds");
            Navigator.pop(context, selectedIds.toList());
          },
        ),
        SizedBox(height: Responsive.getResponsive(context) * 12),
      ],
    ),
  );
}
