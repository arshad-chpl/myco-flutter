import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myco_flutter/constants/app_assets.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/language_manager.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_searchfield.dart';
import 'package:myco_flutter/widgets/custom_text.dart';
import 'package:myco_flutter/widgets/custom_text_field.dart';

Future<String?> showCustomSimpleBottomSheet({
  required BuildContext context,
  required List<Map<String, String>> dataList,
  required String heading,
  String? selectedId,
  icon,
  searchHint,
  btnTitle,
  bool isMultipleSelection = false,
}) => showModalBottomSheet<String>(
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
  final String? selectedId, searchHint, btnTitle, icon;
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

  /// For search
  void _onSearch(String query) {
    setState(() {
      searchQuery = query;
      filteredList = widget.dataList
          .where(
            (item) => (item['name'] ?? '').toLowerCase().contains(
              query.toLowerCase(),
            ),
          )
          .toList();
    });
  }

  ///For toggle selection
  ///Ali
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

  ///For SelectionAll
  ///Ali
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
    height: Responsive.getHeight(context) * 0.75,
    width: Responsive.getWidth(context),
    padding: EdgeInsets.all(16 * Responsive.getResponsive(context)),
    decoration: BoxDecoration(
      color: AppTheme.getColor(context).surface,
      borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
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
                  LanguageManager().get(widget.heading),
                  fontWeight: FontWeight.w700,
                  fontSize: 18 * Responsive.getResponsiveText(context),
                  color: AppColors.textPrimary,
                ),
              ),
            if (widget.icon != null)
              IconButton(
                padding: const EdgeInsets.all(0),
                onPressed: () => Navigator.pop(context),

                icon: SvgPicture.asset(
                  widget.icon ?? 'NO_Image||Icon',
                  width: Responsive.isTablet
                      ? 0.03 * Responsive.getWidth(context)
                      : 0.06 * Responsive.getWidth(context),
                  fit: BoxFit.scaleDown,
                ),
              ),
          ],
        ),

        SizedBox(
          height: Responsive.isTablet
              ? 0.006 * Responsive.getHeight(context)
              : 0.009 * Responsive.getHeight(context),
        ),

        // Search field
        CustomSearchField(hintText: 'search', onChanged: _onSearch),
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
                  color: AppTheme.getColor(context).primary.withOpacity(0.3),
                ),
              ),
              child: Center(
                child: CustomText(
                  isAllSelected ? 'unselect_all' : 'select_all',
                  isKey: true,
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
          child: filteredList.isEmpty
              ? Center(
                  child: Padding(
                    padding: EdgeInsets.all(
                      16.0 * Responsive.getResponsive(context),
                    ),
                    child: CustomText(
                      'No matching results found',
                      fontSize: 16 * Responsive.getResponsiveText(context),
                      fontWeight: FontWeight.w600,
                      color: AppColors.textSecondary,
                    ),
                  ),
                )
              : ListView.builder(
                  itemCount: filteredList.length,
                  itemBuilder: (context, index) {
                    final item = filteredList[index];
                    final id = item['id'];
                    final name = item['name'] ?? '';
                    if (id == null || name.isEmpty)
                      return const SizedBox.shrink();

                    final isSelected = widget.isMultipleSelection
                        ? selectedItemIds.contains(id)
                        : id == selectedItemId;

                    return Container(
                      height: Responsive.isTablet
                          ? 0.10 * Responsive.getHeight(context)
                          : 0.040 * Responsive.getHeight(context),
                      margin: EdgeInsets.symmetric(
                        vertical: 0.005 * Responsive.getHeight(context),
                      ),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? AppTheme.getColor(context).surfaceContainer
                            : Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: isSelected
                              ? AppTheme.getColor(context).primary
                              : AppTheme.getColor(
                                  context,
                                ).primary.withValues(alpha: 0.3),
                          width: isSelected ? 2 : 1,
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
                            borderRadius: BorderRadius.circular(11),
                          ),
                          child: CustomText(
                            name,
                            textAlign: TextAlign.center,
                            fontWeight: FontWeight.w700,
                            fontSize:
                                14 * Responsive.getResponsiveText(context),
                            color: AppColors.textPrimary,
                          ),
                        ),
                      ),
                    );
                  },
                ),
        ),
        // Submit button
        MyCoButton(
          title: LanguageManager().get(widget.btnTitle ?? 'submit'),
          boarderRadius: 50,
          height: Responsive.isTablet
              ? 0.10 * Responsive.getHeight(context)
              : 0.05 * Responsive.getHeight(context),
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
        SizedBox(height: 0.015 * Responsive.getHeight(context)),
      ],
    ),
  );
}
