import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:myco_flutter/constants/app_assets.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/language_manager.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/sign_in/presentation/custome_bloc/my_form_event.dart';
import 'package:myco_flutter/features/sign_in/presentation/custome_bloc/my_form_bloc.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';

class SelectCustomDialog extends StatefulWidget {
  final List<String> optionIds;
  final List<String> optionNames;
  final String? selectedId;
  final String title;
  final String fieldKey; // Add fieldKey

  const SelectCustomDialog({
    required this.optionIds,
    required this.optionNames,
    required this.selectedId,
    required this.title,
    required this.fieldKey, // Add fieldKey
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
      _filterList(searchController.text);
    });
  }

  void _filterList(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredIndexes = List.generate(widget.optionNames.length, (i) => i);
      } else {
        filteredIndexes = [];
        for (int i = 0; i < widget.optionNames.length; i++) {
          if (widget.optionNames[i].toLowerCase().contains(query.toLowerCase())) {
            filteredIndexes.add(i);
          }
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
            // ... (Your Search TextField remains the same)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              child: TextField(
                controller: searchController,
                decoration: InputDecoration(
                  hintText: LanguageManager().get('search'),
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: const Padding(
                    padding: EdgeInsets.all(12),
                    child: SizedBox(
                      height: 20,
                      width: 20,
                      child: ImageIcon(
                        AssetImage('assets/take_order/search-normal.png'),
                        size: 20,
                      ),
                    ),
                  ),
                  suffixIcon: searchController.text.isNotEmpty
                      ? IconButton(
                    icon: const Icon(Icons.clear, color: Color(0xFF98A2B3)),
                    onPressed: () {
                      searchController.clear();
                      FocusScope.of(context).unfocus();
                    },
                  )
                      : null,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Color(0xFF98A2B3), width: 1.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Color(0xFF98A2B3), width: 1.5),
                  ),
                ),
                onChanged: _filterList,
              ),
            ),

            const SizedBox(height: 18),
            SizedBox(
              height: 250,
              child: filteredIndexes.isEmpty
                  ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.inbox, size: 48, color: Colors.grey),
                    const SizedBox(height: 10),
                    Text(LanguageManager().get('no_data'), style: const TextStyle(fontSize: 16, color: Colors.grey)),
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
                    onTap: () => setState(() => tempSelectedId = itemId),
                    child: Container(
                      color: Colors.transparent, // For better hit-testing
                      padding: const EdgeInsets.symmetric(vertical: 1),
                      child: Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: Text(itemName, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black)),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Radio<String>(
                              value: itemId,
                              groupValue: tempSelectedId,
                              onChanged: (value) => setState(() => tempSelectedId = value),
                              activeColor: const Color(0xFF2F648E),
                              visualDensity: const VisualDensity(horizontal: -4),
                              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
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
                  title: LanguageManager().get('cancel').toUpperCase(),
                  height: 0.05 * Responsive.getHeight(context),
                  width: 0.42 * Responsive.getWidth(context),
                  backgroundColor: AppColors.white,
                ),
                MyCoButton(
                  onTap: () {

                    if (tempSelectedId == null || tempSelectedId!.isEmpty) {
                      String message = '';
                      if (widget.title.toLowerCase() == 'branch') {
                        message = LanguageManager().get('please_select_branch');
                      } else if (widget.title.toLowerCase() == 'department') {
                        message = LanguageManager().get('please_select_department');
                      } else if (widget.title.toLowerCase() == 'sub department') {
                        message = LanguageManager().get('please_select_sub_department');
                      } else if (widget.title.toLowerCase() == 'shift') {
                        message = LanguageManager().get('please_select_shift');
                      } else if (widget.title.toLowerCase() == 'designation') {
                        message = LanguageManager().get('select_designation');
                      } else {
                        message = 'Please select data first';
                      }

                      Fluttertoast.showToast(msg: message, backgroundColor: Colors.redAccent, textColor: Colors.white,);
                      return;
                    }

                    final selectedIndex = widget.optionIds.indexOf(tempSelectedId!);
                    final selectedName = selectedIndex != -1 ? widget.optionNames[selectedIndex] : '';

                    // **FIX**: Use the BLoC to update state with the fieldKey
                    context.read<MyFormBloc>().add(UpdateSelectedData(id: tempSelectedId!, name: selectedName, fieldKey: widget.fieldKey));

                    Navigator.pop(context);
                  },
                  title: LanguageManager().get('done').toUpperCase(),
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