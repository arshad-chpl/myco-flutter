import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_text.dart';
import 'package:myco_flutter/widgets/custom_text_field.dart';

class CustomBottomSheet extends StatefulWidget {
  final List<Map<String, String>>? items;
  final Future<List<Map<String, String>>>? futureItems;
  final double? height, width, titleImageHeight, titleImageWidth;
  final String? selectedItem, title, searchBarHintText, btnTitle;
  final ValueChanged<String>? onSelect;
  final ImageProvider? image;
  final bool showSnackBar;

  const CustomBottomSheet({
    this.items,
    this.futureItems,
    super.key,
    this.selectedItem,
    this.onSelect,
    this.image,
    this.title,
    this.btnTitle,
    this.showSnackBar = false,
    this.titleImageHeight,
    this.titleImageWidth,
    this.height,
    this.width,
    this.searchBarHintText,
  });

  @override
  State<CustomBottomSheet> createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> {
  String searchQuery = '';
  String? selectedItem;
  List<Map<String, String>> allItems = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    selectedItem = widget.selectedItem;
    _loadItems();
  }

  Future<void> _loadItems() async {
    if (widget.items != null) {
      setState(() {
        allItems = widget.items!;
        isLoading = false;
      });
    } else if (widget.futureItems != null) {
      try {
        final result = await widget.futureItems!;
        setState(() {
          allItems = result;
          isLoading = false;
        });
      } catch (e) {
        setState(() => isLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final filteredItems = allItems
        .where(
          (item) => (item['name'] ?? '').toLowerCase().contains(
            searchQuery.toLowerCase(),
          ),
        )
        .toList();

    return Container(
      height: widget.height ?? getHeight(context) * 0.625,
      width: widget.width ?? getWidth(context),
      padding: EdgeInsets.all(16 * getResponsive(context)),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              if (widget.title != null)
                Padding(
                  padding: EdgeInsets.only(bottom: 8 * getResponsive(context)),
                  child: CustomText(
                    widget.title!,
                    fontWeight: FontWeight.w700,
                    fontSize: 18 * getResponsiveText(context),
                    color: AppColors.textPrimary,
                  ),
                ),
              const Spacer(),
              if (widget.image != null)
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Padding(
                    padding: EdgeInsets.only(
                      bottom: 12 * getResponsive(context),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image(
                        fit: BoxFit.cover,
                        image: widget.image!,
                        height:
                            widget.titleImageHeight ??
                            20 * getResponsive(context),
                        width:
                            widget.titleImageWidth ??
                            20 * getResponsive(context),
                      ),
                    ),
                  ),
                ),
            ],
          ),
          SizedBox(height: 12 * getResponsive(context)),
          MyCoTextfield(
            prefix: Image.asset(
              'assets/take_order/search-normal.png',
              scale: 20,
            ),
            hintText: widget.searchBarHintText ?? 'Search',
            hintTextStyle: TextStyle(
              fontSize: 14 * getResponsiveText(context),
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
            textInputType: TextInputType.text,
            textAlignment: TextAlign.left,
            boarderRadius: 10,
            contentPadding: EdgeInsets.all(10 * getResponsive(context)),
            onChanged: (value) {
              setState(() {
                searchQuery = value;
              });
            },
          ),
          SizedBox(height: 12 * getResponsive(context)),
          isLoading
              ? const Expanded(
                  child: Center(child: CircularProgressIndicator()),
                )
              : Expanded(
                  child: ListView.builder(
                    itemCount: filteredItems.length,
                    itemBuilder: (context, index) {
                      final item = filteredItems[index];
                      final itemId = item['id'];
                      final itemTitle = item['name'] ?? '';

                      if (itemId == null || itemTitle.isEmpty) {
                        return const SizedBox.shrink();
                      }

                      final isSelected = selectedItem == itemTitle;

                      return Container(
                        height: 40 * getResponsive(context),
                        margin: EdgeInsets.symmetric(
                          vertical: 6 * getResponsive(context),
                        ),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? AppTheme.getColor(context).primary
                              : Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: AppTheme.getColor(
                              context,
                            ).primary.withAlpha((0.3 * 255).toInt()),
                          ),
                        ),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              selectedItem = selectedItem == itemTitle
                                  ? null
                                  : itemTitle;
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 10 * getResponsive(context),
                              horizontal: 16 * getResponsive(context),
                            ),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? AppTheme.getColor(context).surfaceContainer
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(11),
                            ),
                            child: CustomText(
                              itemTitle,
                              textAlign: TextAlign.center,
                              fontWeight: FontWeight.w700,
                              fontSize: 14 * getResponsiveText(context),
                              color: AppColors.textPrimary,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
          SizedBox(height: 16 * getResponsive(context)),
          MyCoButton(
            title: widget.btnTitle ?? 'Select',
            boarderRadius: 50,
            isShadowBottomLeft: true,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w500,
            onTap: () {
              if (selectedItem != null && widget.onSelect != null) {
                final item = allItems.firstWhere(
                  (e) => e['name'] == selectedItem,
                  orElse: () => {},
                );

                final selectedId = item['id'];
                if (selectedId != null) {
                  widget.onSelect!(selectedId);
                  Navigator.pop(context, selectedId);
                  return;
                }
              }
              Navigator.pop(context);
            },
          ),
          SizedBox(height: getHeight(context) * 0.02),
        ],
      ),
    );
  }
}

extension CustomSimpleBottomSheet on CustomBottomSheet {
  static Future<String?> show(
    BuildContext context, {
    List<Map<String, String>>? items,
    Future<List<Map<String, String>>>? futureItems,
    String? selectedItem,
    ValueChanged<String>? onSelect,
    ImageProvider? image,
    String? title,
    String? btnTitle,
    bool showSnackBar = false,
    double? titleImageHeight,
    double? titleImageWidth,
    double? height,
    double? width,
    String? searchBarHintText,
  }) => showModalBottomSheet<String>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (_) => CustomBottomSheet(
      items: items,
      futureItems: futureItems,
      selectedItem: selectedItem,
      onSelect: onSelect,
      image: image,
      title: title,
      btnTitle: btnTitle,
      showSnackBar: showSnackBar,
      titleImageHeight: titleImageHeight,
      titleImageWidth: titleImageWidth,
      height: height,
      width: width,
      searchBarHintText: searchBarHintText,
    ),
  );
}
