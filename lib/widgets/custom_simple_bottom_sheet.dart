import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/language_manager.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_text.dart';
import 'package:myco_flutter/widgets/custom_text_field.dart';

Future<dynamic> showCustomSimpleBottomSheet({
  required BuildContext context,
  required List<Map<String, String>> dataList,
  required String heading,
  String? selectedId,
  ImageProvider? icon,
  String? searchHint,
  String? btnTitle,
  bool isMultipleSelection = false,
}) =>
    showModalBottomSheet<dynamic>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => _CustomSimpleBottomSheet(
        heading: heading,
        dataList: dataList,
        selectedId: selectedId,
        icon: icon,
        searchHint: searchHint,
        btnTitle: btnTitle,
        isMultipleSelection: isMultipleSelection,
      ),
    );

class _CustomSimpleBottomSheet extends StatefulWidget {
  final List<Map<String, String>> dataList;
  final String heading;
  final String? selectedId;
  final String? searchHint;
  final String? btnTitle;
  final ImageProvider? icon;
  final bool isMultipleSelection;

  const _CustomSimpleBottomSheet({
    required this.dataList,
    required this.heading,
    this.selectedId,
    this.searchHint,
    this.btnTitle,
    this.icon,
    this.isMultipleSelection = false,
  });

  @override
  State<_CustomSimpleBottomSheet> createState() =>
      _CustomSimpleBottomSheetState();
}

class _CustomSimpleBottomSheetState extends State<_CustomSimpleBottomSheet> {
  String searchQuery = '';
  String? selectedItemId;
  List<String> selectedItemIds = [];
  late List<Map<String, String>> filteredList;
  bool isAllSelected = false;

  @override
  void initState() {
    super.initState();
    selectedItemId = widget.selectedId;
    filteredList = List.from(widget.dataList);

    if (widget.selectedId != null) {
      selectedItemIds = [widget.selectedId!];
    }
  }

  void _onSearch(String query) {
    setState(() {
      searchQuery = query;
      filteredList = widget.dataList
          .where((item) =>
          (item['name'] ?? '').toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  void _toggleSelection(String id) {
    setState(() {
      if (selectedItemIds.contains(id)) {
        selectedItemIds.remove(id);
        isAllSelected = false;
      } else {
        selectedItemIds.add(id);
        if (selectedItemIds.length == filteredList.length) {
          isAllSelected = true;
        }
      }
    });
  }

  void _selectAll() {
    if (isAllSelected) {
      setState(() {
        selectedItemIds.clear();
        isAllSelected = false;
      });
    } else {
      final allIds = filteredList.map((e) => e['id']!).toList();
      setState(() {
        selectedItemIds = allIds;
        isAllSelected = true;
      });
    }
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

        // Title and close icon
        Row(
          children: [
            if (widget.heading.isNotEmpty)
              Expanded(
                child: CustomText(
                  LanguageManager().get(widget.heading),
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
        MyCoTextfield(
          prefix:
          Image.asset('assets/take_order/search-normal.png', scale: 20),
          hintText: widget.searchHint ?? 'Search',
          hintTextStyle: TextStyle(
            fontSize: 14 * Responsive.getResponsiveText(context),
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
          textInputType: TextInputType.text,
          textAlignment: TextAlign.left,
          boarderRadius: 10,
          contentPadding: EdgeInsets.all(
            10 * Responsive.getResponsive(context),
          ),
          onChanged: _onSearch,
        ),

        SizedBox(height: 12 * Responsive.getResponsive(context)),

        // "Select All" button
        if (widget.isMultipleSelection && filteredList.length > 1)
          InkWell(
            onTap: _selectAll,
            child: Container(
              margin: EdgeInsets.symmetric(
                vertical: 6 * Responsive.getResponsive(context),
              ),
              padding: EdgeInsets.symmetric(
                vertical: 10 * Responsive.getResponsive(context),
                horizontal: 16 * Responsive.getResponsive(context),
              ),
              decoration: BoxDecoration(
                color: isAllSelected
                    ? AppTheme.getColor(context).surfaceContainer
                    : Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color:
                  AppTheme.getColor(context).primary.withOpacity(0.3),
                ),
              ),
              child: Center(
                child: CustomText(
                  isAllSelected ? 'Unselect All' : 'Select All',
                  textAlign: TextAlign.center,
                  fontWeight: FontWeight.w700,
                  fontSize: 14 * Responsive.getResponsiveText(context),
                  color: AppColors.textPrimary,
                ),
              ),
            ),
          ),

        // List of items
        Expanded(
          child: ListView.builder(
            itemCount: filteredList.length,
            itemBuilder: (context, index) {
              final item = filteredList[index];
              final id = item['id'];
              final name = item['name'] ?? '';

              if (id == null || name.isEmpty) return const SizedBox.shrink();

              final isSelected = widget.isMultipleSelection
                  ? selectedItemIds.contains(id)
                  : id == selectedItemId;

              return Container(
                margin: EdgeInsets.symmetric(
                  vertical: 6 * Responsive.getResponsive(context),
                ),
                decoration: BoxDecoration(
                  color: isSelected
                      ? AppTheme.getColor(context).primary
                      : Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: AppTheme.getColor(context)
                        .primary
                        .withOpacity(0.3),
                  ),
                ),
                child: InkWell(
                  onTap: () {
                    if (widget.isMultipleSelection) {
                      _toggleSelection(id);
                    } else {
                      setState(() {
                        selectedItemId = id;
                      });
                    }
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
          title: LanguageManager().get(widget.btnTitle ?? 'Submit'),
          boarderRadius: 50,
          height: 0.05 * Responsive.getHeight(context),
          isShadowBottomLeft: true,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w500,
          onTap: () {
            if (widget.isMultipleSelection) {
              Navigator.pop(context, selectedItemIds);
            } else if (selectedItemId != null) {
              Navigator.pop(context, selectedItemId!);
            } else {
              Navigator.pop(context);
            }
          },
        ),
      ],
    ),
  );
}
