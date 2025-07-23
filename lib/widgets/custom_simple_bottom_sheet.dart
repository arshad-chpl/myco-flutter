import 'package:flutter/material.dart';
import 'package:myco_flutter/constants/constants.dart';
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
  ImageProvider? icon,
  String? searchHint,
  String? btnTitle,
  bool? isCloseButton,
  
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
    isCloseButton: isCloseButton,
  ),
);

class _CustomSimpleBottomSheet extends StatefulWidget {
  final List<Map<String, String>> dataList;
  final String heading;
  final bool isKey;
  final String? selectedId;
  final String? searchHint;
  final String? btnTitle;
  final ImageProvider? icon;
  final bool? isCloseButton;

  const _CustomSimpleBottomSheet({
    required this.dataList,
    required this.heading,
    this.selectedId,
    this.searchHint,
    this.btnTitle,
    this.icon,
    this.isKey = false,
    this.isCloseButton =false,
  });

  @override
  State<_CustomSimpleBottomSheet> createState() =>
      _CustomSimpleBottomSheetState();
}

class _CustomSimpleBottomSheetState extends State<_CustomSimpleBottomSheet> {
  String searchQuery = '';
  String? selectedItemId;
  late List<Map<String, String>> filteredList;

  @override
  void initState() {
    super.initState();
    selectedItemId = widget.selectedId;
    filteredList = List.from(widget.dataList);
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

  @override
  Widget build(BuildContext context) => Container(
    height: Responsive.getHeight(context) * 0.625,
    width: Responsive.getWidth(context),
    padding: EdgeInsets.only(
      top: VariableBag.bottomSheetTopPadding,
      bottom: VariableBag.bottomSheetBottomPadding,
      left: VariableBag.bottomSheetLeftPadding,
      right: VariableBag.bottomSheetRightPadding,
    ),
    decoration:  BoxDecoration(
      color: AppTheme.getColor(context).onPrimary,
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
                  LanguageManager().get(widget.heading),
                  fontWeight: FontWeight.w700,
                  fontSize: 18 * Responsive.getResponsiveText(context),
                  color: AppTheme.getColor(context).onSurface,
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
          backgroundColor: AppTheme.getColor(context).onPrimary,
          hintText: widget.searchHint ?? 'Search',
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
              final name = item['name'] ?? '';
              final isSelected = id == selectedItemId;

              if (id == null || name.isEmpty) return const SizedBox.shrink();

              return Container(
                margin: EdgeInsets.symmetric(
                  vertical: 6 * Responsive.getResponsive(context),
                ),
                decoration: BoxDecoration(
                  color: isSelected
                      ? AppTheme.getColor(context).onPrimary
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(12 * Responsive.getResponsive(context)),
                  border: isSelected ? Border.all(
                    color: AppTheme.getColor(context).primary,
                  ) : Border.all(
                    color: AppTheme.getColor(context).outline,
                  ),
                ),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      selectedItemId = id;
                    });
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
        widget.isCloseButton == true ? Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            MyCoButton(
              title: LanguageManager().get('Close'),
              // title: widget.btnTitle ?? 'Select',
              textStyle: TextStyle(
                color: AppTheme.getColor(context).primary,
                fontWeight: FontWeight.w500,
                fontSize: 16 * Responsive.getResponsiveText(context),
              ),
              boarderRadius: 50,
              height: 0.05 * Responsive.getHeight(context),
              width: 0.42 * Responsive.getWidth(context),
              isShadowBottomLeft: true,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w500,
              backgroundColor: AppTheme.getColor(context).onPrimary,
              onTap: () {
             
                  Navigator.pop(context);
          
              },
            ),
           
            MyCoButton(
              title: LanguageManager().get(widget.btnTitle ?? 'Submit'),
              // title: widget.btnTitle ?? 'Select',
              boarderRadius: 50,
              height: 0.05 * Responsive.getHeight(context),
              width: 0.42 * Responsive.getWidth(context),
              isShadowBottomLeft: true,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w500,
              onTap: () {
                if (selectedItemId != null) {
                  Navigator.pop(context, selectedItemId!);
                } else {
                  Navigator.pop(context);
                }
              },
            ),
          ],
        ):
        MyCoButton(

          title: LanguageManager().get(widget.btnTitle ?? 'Submit'),
          // title: widget.btnTitle ?? 'Select',
          boarderRadius: 50,
          height: 0.05 * Responsive.getHeight(context),
          isShadowBottomLeft: true,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w500,
          onTap: () {
            if (selectedItemId != null) {
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
