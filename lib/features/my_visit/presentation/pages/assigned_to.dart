import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/my_visit/presentation/widgets/card_widget.dart';
import 'package:myco_flutter/features/my_visit/presentation/widgets/row_widget.dart';
import 'package:myco_flutter/features/my_visit/presentation/widgets/tag_input_widget.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_simple_bottom_sheet.dart';
import 'package:myco_flutter/widgets/custom_text.dart';
import 'package:myco_flutter/widgets/custom_text_field.dart';

class AssignedTo extends StatefulWidget {
  const AssignedTo({super.key});

  @override
  State<AssignedTo> createState() => _VisitWithState();
}

class _VisitWithState extends State<AssignedTo> {
  final TextEditingController searchController = TextEditingController();
  final FocusNode searchFocus = FocusNode();

  final List<String> _branchTags = [];

  final List<String> _departmentTags = [];

  final Set<int> selectedEmployeeIndexes = {};

  final employees = List.generate(
    25,
    (index) => {
      'name': 'Aadi K',
      'role': 'QA',
      'image': 'https://i.pravatar.cc/150?img=${index + 1}',
    },
  );

  final List<Map<String, String>> Department = [
    {'id': '1', 'name': 'QA Technical'},
    {'id': '2', 'name': 'QA Sales'},
    {'id': '3', 'name': 'QA HR'},
    {'id': '4', 'name': 'SR Technical'},
    {'id': '5', 'name': 'SR Sales'},
    {'id': '6', 'name': 'SR HR'},
    {'id': '7', 'name': 'Jr Technical'},
    {'id': '8', 'name': 'Jr Sales'},
    {'id': '9', 'name': 'Jr HR'},
    {'id': '10', 'name': 'Intern Technical'},
  ];

  final List<Map<String, String>> branches = [
    {'id': '11', 'name': 'Ahmedabad'},
    {'id': '12', 'name': 'Surat'},
    {'id': '13', 'name': 'Vadodara'},
    {'id': '14', 'name': 'Rajkot'},
    {'id': '15', 'name': 'Bhavnagar'},
    {'id': '16', 'name': 'Jamnagar'},
    {'id': '17', 'name': 'Gandhinagar'},
    {'id': '18', 'name': 'Junagadh'},
    {'id': '19', 'name': 'Anand'},
    {'id': '20', 'name': 'Nadiad'},
  ];

  @override
  Widget build(BuildContext context) {
    double multiplier = Responsive.getResponsiveText(context);
    return SafeArea(
      child: Container(
        padding: EdgeInsets.only(
          left: 20 * multiplier,
          right: 20 * multiplier,
          top: 20 * multiplier,
          bottom: 5 * multiplier,
        ),
        height: MediaQuery.of(context).size.height * 0.97,
        width: MediaQuery.of(context).size.width * 1,
        child: SingleChildScrollView(
          child: Column(
            spacing: 20 * Responsive.getResponsive(context),
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    'Assigned To',
                    fontWeight: FontWeight.bold,
                    color: AppTheme.getColor(context).onSurface,
                  ),
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: SvgPicture.asset('assets/visit/dropdown_visit.svg'),
                    color: AppTheme.getColor(context).primary,
                  ),
                ],
              ),
              //search bar
            MyCoTextfield(
                controller: searchController,
                focusNode: searchFocus,
                hintText: 'Search',
                boarderRadius: 10,
                contentPadding: EdgeInsets.symmetric(
                  vertical: 2 * multiplier,
                ),
                prefix: Padding(
                  padding: EdgeInsets.only(
                    left: 10 * multiplier,
                    right: 0 * multiplier,
                  ),
                  child: Icon(
                    CupertinoIcons.search,
                    color: AppColors.primary,
                    size: 20 * multiplier,
                  ),
                ),
                typingtextStyle: TextStyle(fontSize: 14 * multiplier),
                hintTextStyle: TextStyle(
                  fontSize: 15 * multiplier,
                  color: AppTheme.getColor(context).outline,
                ),
                textAlignment: TextAlign.start,
                border: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(Responsive.getResponsive(context) * 18),
                  borderSide: BorderSide(
                    color: AppTheme.getColor(context).outline,
                  ),
                ),
              ),
              // Branches selection
              Column(
                children: [
                  LabelRow(
                    title: 'Branches',
                    actionLabel: 'Select Branch',
                    onTap: () async {
                      final selectedId = await showCustomSimpleBottomSheet(
                        context: context,
                        btnTitle: 'ADD',
                        heading: 'Select Branch',
                        dataList: branches,
                      );
                      if (selectedId != null) {
                        final selectedMap = branches.firstWhere(
                          (e) => e['id'] == selectedId,
                          orElse: () => {'id': '', 'name': ''},
                        );
                        setState(() {
                          _branchTags.add(selectedMap['name'] ?? '');
                        });
                      }
                    },
                  ),
                  //Tag input field for branches
                  TagInputField(
                    tags: _branchTags,
                    hint: "Branch",
                    onAdd: (value) {
                      final cleanValue = value.replaceAll(',', '').trim();
                      if (cleanValue.isNotEmpty &&
                          !_branchTags.contains(cleanValue)) {
                        setState(() {
                          _branchTags.add(cleanValue);
                        });
                      }
                    },
                    onRemove: (tag) {
                      setState(() {
                        _branchTags.remove(tag);
                      });
                    },
                    onarrowbtn: () async {
                      final selectedId = await showCustomSimpleBottomSheet(
                        context: context,
                        btnTitle: 'ADD',
                        heading: 'Select Branch',
                        dataList: branches,
                      );
                      if (selectedId != null) {
                        final selectedMap = branches.firstWhere(
                          (e) => e['id'] == selectedId,
                          orElse: () => {'id': '', 'name': ''},
                        );
                        setState(() {
                          _branchTags.add(selectedMap['name'] ?? '');
                        });
                      }
                    },
                  ),
                ],
              ),

              //Department selection
              Column(
                children: [
                  LabelRow(
                    title: 'Department',
                    actionLabel: 'Select Department',
                    onTap: () async {
                      final selectedId = await showCustomSimpleBottomSheet(
                        context: context,
                        heading: 'Select Department',
                        dataList: Department,
                        btnTitle: 'ADD',
                      );
                      if (selectedId != null) {
                        final selectedMap = Department.firstWhere(
                          (e) => e['id'] == selectedId,
                          orElse: () => {'id': '', 'name': ''},
                        );
                        setState(() {
                          _departmentTags.add(selectedMap['name'] ?? '');
                        });
                      }
                    },
                  ),
                  //Tag input field for department
                  TagInputField(
                    tags: _departmentTags,
                    hint: 'Department',
                    onAdd: (value) {
                      final cleanValue = value.replaceAll(',', '').trim();
                      if (cleanValue.isNotEmpty &&
                          !_departmentTags.contains(cleanValue)) {
                        setState(() {
                          _departmentTags.add(cleanValue);
                        });
                      }
                    },
                    onRemove: (tag) {
                      setState(() {
                        _departmentTags.remove(tag);
                      });
                    },
                    onarrowbtn: () async {
                      final selectedId = await showCustomSimpleBottomSheet(
                        context: context,
                        heading: 'Select Department',
                        dataList: Department,
                        btnTitle: 'ADD',
                      );
                      if (selectedId != null) {
                        final selectedMap = Department.firstWhere(
                          (e) => e['id'] == selectedId,
                          orElse: () => {'id': '', 'name': ''},
                        );
                        setState(() {
                          _departmentTags.add(selectedMap['name'] ?? '');
                        });
                      }
                    },
                  ),
                ],
              ),

              // Employee selection grid
               SizedBox(
                height: Responsive.getHeight(context) * 0.48,
                 child: LayoutBuilder(
                   builder: (context, constraints) => GridView.builder(
                       padding: const EdgeInsets.all(5),
                       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                         crossAxisCount: Responsive.getGridConfig(context ,screenWide: constraints.maxWidth ).itemCount,
                         mainAxisSpacing: Responsive.getGridConfig(context, screenWide: constraints.maxWidth).spacing,
                         crossAxisSpacing: Responsive.getGridConfig(context, screenWide: constraints.maxWidth).spacing,
                         childAspectRatio: Responsive.getGridConfig(
                             context,screenWide: constraints.maxWidth
                         ).childAspectRatio,
                       ),
                       itemCount: employees.length,
                       itemBuilder: (context, index) {

                         final emp = employees[index];
                         return EmployeeSelectionCard(
                           selectedColor: const Color.fromARGB(
                             255,
                             89,
                             129,
                             161,
                           ),
                           name: emp['name']!,
                           department: emp['role']!,
                           image: NetworkImage(emp['image']!),
                           showDelete: false,
                           isSelected: selectedEmployeeIndexes.contains(index),
                           onSelected: (value) {
                             setState(() {
                               if (selectedEmployeeIndexes.contains(index)) {
                                 selectedEmployeeIndexes.remove(index);
                               } else {
                                 selectedEmployeeIndexes.add(index);
                               }
                             });
                           },
                         );
                       },
                     ),
                 ),
              ),

              //Add button
              MyCoButton(
                title: 'ADD',
                boarderRadius: 50,
                height: 0.05 * Responsive.getHeight(context),
                isShadowBottomLeft: true,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
