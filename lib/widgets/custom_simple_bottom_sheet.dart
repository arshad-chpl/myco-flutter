import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myco_flutter/constants/app_assets.dart';
import 'package:myco_flutter/constants/constants.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/language_manager.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_searchfield.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

Future<dynamic> showCustomSimpleBottomSheet({
  required BuildContext context,
  required List<Map<String, String>> dataList,
  required String heading,
  dynamic selectedId,
  String? icon,
  String? searchHint,
  String? btnTitle,
  bool isMultipleSelection = false,
  bool isCloseButton = false,
}) => showModalBottomSheet<dynamic>(
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
    isCloseButton: isCloseButton,
  ),
);

class _CustomSimpleBottomSheet extends StatefulWidget {
  final List<Map<String, String>> dataList;
  final String heading;
  final dynamic selectedId;
  final String? searchHint, btnTitle, icon;
  final bool isMultipleSelection, isCloseButton;

  const _CustomSimpleBottomSheet({
    required this.dataList,
    required this.heading,
    this.selectedId,
    this.searchHint,
    this.btnTitle,
    this.icon,
    this.isMultipleSelection = false,
    this.isCloseButton = false,
  });

  @override
  State<_CustomSimpleBottomSheet> createState() =>
      _CustomSimpleBottomSheetState();
}

class _CustomSimpleBottomSheetState extends State<_CustomSimpleBottomSheet> {
  String searchQuery = '';
  Map<String, String>? selectedItem;
  List<Map<String, String>> selectedItems = [];
  late List<Map<String, String>> filteredList;
  bool isAllSelected = false;

  @override
  void initState() {
    super.initState();
    filteredList = List.from(widget.dataList);

    if (widget.isMultipleSelection) {
      if (widget.selectedId is List<String>) {
        final ids = List<String>.from(widget.selectedId);
        selectedItems = widget.dataList
            .where((item) => ids.contains(item['id']))
            .toList();
      }
    } else {
      if (widget.selectedId is String) {
        selectedItem = widget.dataList.firstWhere(
          (item) => item['id'] == widget.selectedId,
          orElse: () => {},
        );
      }
    }
  }

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

  void _toggleSelection(Map<String, String> item) {
    setState(() {
      final exists = selectedItems.any((e) => e['id'] == item['id']);
      if (exists) {
        selectedItems.removeWhere((e) => e['id'] == item['id']);
        isAllSelected = false;
      } else {
        selectedItems.add(item);
        if (selectedItems.length == filteredList.length) {
          isAllSelected = true;
        }
      }
    });
  }

  void _selectAll() {
    setState(() {
      if (isAllSelected) {
        selectedItems.clear();
        isAllSelected = false;
      } else {
        selectedItems = List.from(filteredList);
        isAllSelected = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) => Container(
    height: Responsive.getHeight(context) * 0.75,
    width: Responsive.getWidth(context),
    padding: EdgeInsets.only(
      top:
          VariableBag.bottomSheetTopPadding * Responsive.getResponsive(context),
      bottom:
          VariableBag.bottomSheetBottomPadding *
          Responsive.getResponsive(context),
      left:
          VariableBag.bottomSheetLeftPadding *
          Responsive.getResponsive(context),
      right:
          VariableBag.bottomSheetRightPadding *
          Responsive.getResponsive(context),
    ),
    decoration: BoxDecoration(
      color: AppTheme.getColor(context).surface,
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(12 * Responsive.getResponsive(context)),
      ),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            if (widget.heading.isNotEmpty)
              Expanded(
                child: CustomText(
                  LanguageManager().get(widget.heading),
                  fontWeight: FontWeight.w700,
                  fontSize: 16 * Responsive.getResponsiveText(context),
                  color: AppTheme.getColor(context).onSurface,
                ),
              ),
            IconButton(
              onPressed: () => Navigator.pop(context),
              icon: SvgPicture.asset(
                widget.icon ?? AppAssets.downArrowBottomSheet,
                width: Responsive.isTablet(context)
                    ? 0.03 * Responsive.getWidth(context)
                    : 0.06 * Responsive.getWidth(context),
                fit: BoxFit.scaleDown,
              ),
            ),
          ],
        ),
        SizedBox(
          height: Responsive.isTablet(context)
              ? 0.006 * Responsive.getHeight(context)
              : 0.009 * Responsive.getHeight(context),
        ),
        CustomSearchField(hintText: 'search', onChanged: _onSearch),
        SizedBox(height: 12 * Responsive.getResponsive(context)),

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
                    : AppTheme.getColor(context).surface,
                borderRadius: BorderRadius.circular(
                  12 * Responsive.getResponsive(context),
                ),
                border: Border.all(
                  color: AppTheme.getColor(context).primary,
                  width: isAllSelected ? 2 : 1,
                ),
              ),
              child: Center(
                child: CustomText(
                  isAllSelected ? 'unselect_all' : 'select_all',
                  isKey: true,
                  textAlign: TextAlign.center,
                  fontWeight: FontWeight.w700,
                  fontSize: 14 * Responsive.getResponsiveText(context),
                  color: isAllSelected
                      ? AppColors.textPrimary
                      : AppTheme.getColor(context).onSurface,
                ),
              ),
            ),
          ),

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
                      color: AppTheme.getColor(context).onSurface,
                    ),
                  ),
                )
              : ListView.builder(
                  itemCount: filteredList.length,
                  itemBuilder: (context, index) {
                    final item = filteredList[index];
                    final id = item['id'];
                    final name = item['name'] ?? '';
                    if (id == null || name.isEmpty) {
                      return const SizedBox.shrink();
                    }

                    final isSelected = widget.isMultipleSelection
                        ? selectedItems.any((e) => e['id'] == id)
                        : selectedItem != null && selectedItem!['id'] == id;

                    return Container(
                      height: Responsive.isTablet(context)
                          ? 0.10 * Responsive.getHeight(context)
                          : 0.045 * Responsive.getHeight(context),
                      margin: EdgeInsets.symmetric(
                        vertical: 0.005 * Responsive.getHeight(context),
                      ),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? AppColors.lightTeal
                            : AppTheme.getColor(context).surface,
                        borderRadius: BorderRadius.circular(
                          12 * Responsive.getResponsive(context),
                        ),
                        border: Border.all(
                          color: AppTheme.getColor(context).primary,
                          width: isSelected ? 2 : 1,
                        ),
                      ),
                      child: InkWell(
                        onTap: () {
                          if (widget.isMultipleSelection) {
                            _toggleSelection(item);
                          } else {
                            setState(() {
                              selectedItem = item;
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
                            color: isSelected
                                ? AppColors.textPrimary
                                : AppTheme.getColor(context).onSurface,
                          ),
                        ),
                      ),
                    );
                  },
                ),
        ),
        SizedBox(height: 0.01 * Responsive.getHeight(context)),

        widget.isCloseButton
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  MyCoButton(
                    title: LanguageManager().get('close'),
                    textStyle: TextStyle(
                      color: AppTheme.getColor(context).primary,
                      fontWeight: FontWeight.w500,
                      fontSize: 16 * Responsive.getResponsiveText(context),
                    ),
                    boarderRadius: 50 * Responsive.getResponsive(context),
                    height: 0.05 * Responsive.getHeight(context),
                    width: 0.42 * Responsive.getWidth(context),
                    isShadowBottomLeft: true,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                    backgroundColor: AppTheme.getColor(context).onPrimary,
                    onTap: () => Navigator.pop(context),
                    wantBorder: false,
                  ),
                  MyCoButton(
                    title: LanguageManager().get(widget.btnTitle ?? 'submit'),
                    boarderRadius: 50 * Responsive.getResponsive(context),
                    height: 0.05 * Responsive.getHeight(context),
                    width: 0.42 * Responsive.getWidth(context),
                    isShadowBottomLeft: true,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                    onTap: () {
                      if (widget.isMultipleSelection) {
                        Navigator.pop(context, selectedItems);
                      } else if (selectedItem != null) {
                        Navigator.pop(context, selectedItem);
                      } else {
                        Navigator.pop(context);
                      }
                    },
                  ),
                ],
              )
            : MyCoButton(
                title: LanguageManager().get(widget.btnTitle ?? 'submit'),
                boarderRadius: 50,
                height: Responsive.isTablet(context)
                    ? 0.10 * Responsive.getHeight(context)
                    : 0.05 * Responsive.getHeight(context),
                isShadowBottomLeft: true,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
                onTap: () {
                  if (widget.isMultipleSelection) {
                    Navigator.pop(context, selectedItems);
                  } else if (selectedItem != null) {
                    Navigator.pop(context, selectedItem);
                  } else {
                    Navigator.pop(context);
                  }
                },
              ),
      ],
    ),
  );
}
