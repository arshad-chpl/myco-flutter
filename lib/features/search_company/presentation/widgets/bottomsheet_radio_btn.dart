import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/sign_in/presentation/widgets/select_other_company_screen.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button_theme.dart';
import 'package:myco_flutter/widgets/custom_text_field.dart';


class BottomsheetRadioButton extends StatefulWidget {
  final List<Map<String, String>> items;
  final double? height;
  final double? width;
  final String? selectedItem;
  final ValueChanged<String>? onSelect;
  final ImageProvider? image;
  final double? titleImageHeight;
  final double? titleImageWidth;
  final String? title;
  final bool showSnackBar;

  const BottomsheetRadioButton({
    super.key,
    required this.items,
    this.selectedItem,
    this.onSelect,
    this.image,
    this.title,
    this.showSnackBar = false,
    this.titleImageHeight,
    this.titleImageWidth,
    this.height,
    this.width,
  });

  @override
  State<BottomsheetRadioButton> createState() => _BottomsheetRadioButtonState();
}

class _BottomsheetRadioButtonState extends State<BottomsheetRadioButton> {
  String searchQuery = '';
  String? selectedItem;

  @override
  void initState() {
    super.initState();
    selectedItem = widget.selectedItem;
  }

  @override
  Widget build(BuildContext context) {
    final filteredItems =
        widget.items
            .where(
              (item) =>
                  item['title']!.toLowerCase().contains(
                    searchQuery.toLowerCase(),
                  ) ||
                  item['subtitle']!.toLowerCase().contains(
                    searchQuery.toLowerCase(),
                  ),
            )
            .toList();

    return Container(
      height: widget.height ?? MediaQuery.of(context).size.height * 0.8,
      width: widget.width ?? MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 22),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (widget.title != null)
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(
                widget.title!,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize:
                      Theme.of(context).textTheme.bodyLarge?.fontSize ?? 14,
                  fontFamily: 'Gilroy',
                ),
              ),
            ),
          if (widget.image != null)
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image(
                  fit: BoxFit.cover,
                  image: widget.image!,
                  height: widget.titleImageHeight ?? 100,
                  width: widget.titleImageWidth ?? 100,
                ),
              ),
            ),
            Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Company Name',
                  style: TextStyle(
                    fontSize: 15 * getResponsiveText(context),
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF101828),
                    fontFamily: 'Gilroy-Bold',
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
              SizedBox(height: 0.01 * getHeight(context)),
          MyCoTextfield(
            isSuffixIconOn: true,
            hintText: "Search",
            hintTextStyle: TextStyle(color: AppColors.black),
            border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(color: Color(0xFF98A2B3), width: 1),
                ),
            preFixImage: 'visit/search_society/company_icon.png',
            onChanged: (value) {
              setState(() {
                searchQuery = value;
              });
            },
          ),
           SizedBox(height: getHeight(context) * 0.025),
          Expanded(
            child: ListView.builder(
              itemCount: filteredItems.length,
              itemBuilder: (context, index) {
                final item = filteredItems[index];
                final isSelected = selectedItem == item['id'];

                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 9),
                  decoration: BoxDecoration(
                    color: isSelected ? AppColors.primary : Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: AppColors.primary.withAlpha((0.3 * 255).toInt()),
                    ),
                  ),
                  child: RadioListTile<String>(
                    value: item['id']!,
                    groupValue: selectedItem,
                    onChanged: (value) {
                      setState(() {
                        if (selectedItem == value) {
                          selectedItem = null;
                        } else {
                          selectedItem = value;
                          if (widget.showSnackBar) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: AppColors.primary,
                                content: Text(
                                  "Selected ID: ${item['id']}, Title: ${item['title']}",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize:
                                        Theme.of(
                                          context,
                                        ).textTheme.bodyMedium?.fontSize ??
                                        14,
                                    fontFamily: 'Gilroy-SemiBold',
                                  ),
                                ),
                              ),
                            );
                          }
                        }
                      });
                    },
                    activeColor: Colors.white,
                    title: Text(
                      item['title']!,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize:
                            Theme.of(context).textTheme.bodyMedium?.fontSize ??
                            14,
                        fontFamily: 'Gilroy',
                        color: isSelected ? AppColors.white : null,
                      ),
                    ),
                    // isThreeLine: true,
                    subtitle: Text(
                      item['subtitle']!,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize:
                            Theme.of(context).textTheme.bodySmall?.fontSize ??
                            14,
                        fontFamily: 'Gilroy',
                        color: isSelected ? AppColors.white : null,
                      ),
                    ),
                    secondary: CircleAvatar(
                      radius: 20,
                      backgroundColor:
                          isSelected ? Colors.white : AppColors.primary,
                      child: Container(
                        alignment: Alignment.center,
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: AppColors.white,
                        ),
                        child: Text(
                          item['title']![0].toUpperCase(),
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize:
                                Theme.of(
                                  context,
                                ).textTheme.bodyMedium?.fontSize ??
                                14,
                            color: AppColors.primary,
                          ),
                        ),
                      ),
                    ),
                    controlAffinity: ListTileControlAffinity.trailing,
                  ),
                );
              },
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.020),
          Row(
            children: [
              Expanded(
                child: MyCoButton(
                  title: 'Close',
                  
                  boarderRadius: 30,
                  width: getWidth(context) * .450,
                  backgroundColor: AppColors.white,
                  border: Border.all(color: AppColors.primary, width: 1),
                  textStyle: MyCoButtonTheme.getWhiteBackgroundTextStyle(
                    context,
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: MyCoButton(
                  title: 'Submit',
                  isShadowBottomLeft: true,
                  boarderRadius: 30,
                  width: getWidth(context) * .450,
                  onTap: () {
                    // if (selectedItem != null && widget.onSelect != null) {
                    //   widget.onSelect!(selectedItem!);
                    // }
                    // Navigator.pop(context, selectedItem);
                    // if (widget.showSnackBar && selectedItem != null) {
                    //   final selected = widget.items.firstWhere(
                    //     (item) => item['id'] == selectedItem,
                    //   );
                    //   ScaffoldMessenger.of(context).showSnackBar(
                    //     SnackBar(
                    //       backgroundColor: AppColors.primary,
                    //       content: Text(
                    //         "You selected ID: ${selected['id']}, Title: ${selected['title']}",
                    //         style: TextStyle(
                    //           fontWeight: FontWeight.w400,
                    //           fontSize:
                    //               Theme.of(
                    //                 context,
                    //               ).textTheme.bodyMedium?.fontSize ??
                    //               14,
                    //           fontFamily: 'Gilroy-SemiBold',
                    //         ),
                    //       ),
                    //     ),
                    //   );
                    // }
                    context.pop();
                    showModalBottomSheet(
                      scrollControlDisabledMaxHeightRatio: 0.7 * getHeight(context),
                      backgroundColor: Colors.transparent,
                      context: context,
                      isScrollControlled: true,
                      builder: (context) => SelectOtherCompanyScreen(),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}