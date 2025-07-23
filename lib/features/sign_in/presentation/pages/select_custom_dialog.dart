import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';

class SelectCustomDialog extends StatefulWidget {
  final List<String> optionIds;
  final List<String> optionNames;
  final String? selectedId;
  final String title;
  final void Function(String selectedId, String selectedName) onSelected;

  const SelectCustomDialog({
    required this.optionIds,
    required this.optionNames,
    required this.selectedId,
    required this.title,
    required this.onSelected,
    super.key,
  });

  @override
  State<SelectCustomDialog> createState() => _SelectCustomDialogState();
}

class _SelectCustomDialogState extends State<SelectCustomDialog> {
  String? tempSelectedId;
  late List<int> filteredIndexes;
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    tempSelectedId = widget.selectedId;
    filteredIndexes = List.generate(
      widget.optionNames.length,
      (index) => index,
    );

    searchController.addListener(() {
      setState(() {});
    });
  }

  void _filterList(String query) {
    setState(() {
      filteredIndexes = [];
      for (int i = 0; i < widget.optionNames.length; i++) {
        if (widget.optionNames[i].toLowerCase().contains(query.toLowerCase())) {
          filteredIndexes.add(i);
        }
      }
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => SafeArea(
    child: Padding(
      padding: const EdgeInsets.all(15),
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
          color: Colors.white,
        ),
        child: Wrap(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              child: TextField(
                controller: searchController,
                decoration: InputDecoration(
                  hintText: 'Search',
                  filled: true,
                  fillColor: const Color(0xFFE6E6E6),
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Color(0xFF2F648E),
                  ),
                  suffixIcon: searchController.text.length > 1
                      ? IconButton(
                          icon: const Icon(
                            Icons.clear,
                            color: Color(0xFF2F648E),
                          ),
                          onPressed: () {
                            searchController.clear();
                            _filterList('');
                            FocusScope.of(context).unfocus();
                          },
                        )
                      : IconButton(
                          icon: const Icon(Icons.mic, color: Color(0xFF2F648E)),
                          onPressed: () {
                            searchController.clear();
                            _filterList('');
                            FocusScope.of(context).unfocus();
                          },
                        ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
                onChanged: _filterList,
              ),
            ),
            const SizedBox(height: 18),
            SizedBox(
              height: 250,
              child: filteredIndexes.isEmpty
                  ? const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.inbox, size: 48, color: Colors.grey),
                          SizedBox(height: 10),
                          Text(
                            'No data available',
                            style: TextStyle(fontSize: 16, color: Colors.grey),
                          ),
                        ],
                      ),
                    )
                  : ListView.builder(
                      itemCount: filteredIndexes.length,
                      itemBuilder: (_, index) {
                        final actualIndex = filteredIndexes[index];
                        final itemName = widget.optionNames[actualIndex];
                        final itemId = widget.optionIds[actualIndex];
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              tempSelectedId = itemId;
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 1),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 15),
                                    child: Text(
                                      itemName,
                                      style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Radio<String>(
                                    value: itemId,
                                    groupValue: tempSelectedId,
                                    onChanged: (value) {
                                      setState(() {
                                        tempSelectedId = value;
                                      });
                                    },
                                    activeColor: const Color(0xFF2F648E),
                                    visualDensity: const VisualDensity(
                                      horizontal: -4,
                                    ),
                                    materialTapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyCoButton(
                  onTap: () => Navigator.pop(context),
                  boarderRadius: 30 * Responsive.getResponsive(context),
                  textStyle: TextStyle(
                    fontSize: 14 * Responsive.getResponsiveText(context),
                    fontWeight: FontWeight.w600,
                    color: AppColors.primary,
                  ),
                  title: 'Cancel',
                  height: 0.05 * Responsive.getHeight(context),
                  width: 0.42 * Responsive.getWidth(context),
                  backgroundColor: AppColors.white,
                ),

                MyCoButton(
                  onTap: () {
                    if (tempSelectedId == null || tempSelectedId!.isEmpty) {
                      String message = '';
                      if (widget.title.toLowerCase() == 'branch') {
                        message = 'Please select branch';
                      } else if (widget.title.toLowerCase() == 'department') {
                        message = 'Please select department';
                      } else if (widget.title.toLowerCase() ==
                          'sub department') {
                        message = 'Please select sub department';
                      } else if (widget.title.toLowerCase() == 'shift') {
                        message = 'Please select shift';
                      } else if (widget.title.toLowerCase() == 'designation') {
                        message = 'Please select designation';
                      } else {
                        message = 'Please select data first';
                      }

                      Fluttertoast.showToast(
                        msg: message,
                        backgroundColor: Colors.redAccent,
                        textColor: Colors.white,
                      );
                      return;
                    }

                    final selectedIndex = widget.optionIds.indexOf(
                      tempSelectedId!,
                    );
                    final selectedName = selectedIndex != -1
                        ? widget.optionNames[selectedIndex]
                        : '';
                    widget.onSelected(tempSelectedId!, selectedName);
                    Navigator.pop(context);
                  },
                  title: 'Done',
                  height: 0.05 * Responsive.getHeight(context),
                  width: 0.42 * Responsive.getWidth(context),
                  boarderRadius: 30 * Responsive.getResponsive(context),
                  textStyle: TextStyle(
                    fontSize: 14 * Responsive.getResponsiveText(context),
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                  backgroundColor: const Color(0xFF2F648E),
                  isShadowBottomLeft: true,
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
