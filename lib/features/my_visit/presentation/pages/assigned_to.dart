import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/language_manager.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/my_visit/presentation/bloc/visit_with_bloc/Department_tag_bloc/Input_Tag_bloc.dart';
import 'package:myco_flutter/features/my_visit/presentation/bloc/visit_with_bloc/Department_tag_bloc/Input_Tag_event.dart';
import 'package:myco_flutter/features/my_visit/presentation/bloc/visit_with_bloc/Department_tag_bloc/Input_Tag_state.dart';
import 'package:myco_flutter/features/my_visit/presentation/widgets/row_widget.dart';
import 'package:myco_flutter/features/my_visit/presentation/widgets/tag_input_widget.dart';
import 'package:myco_flutter/widgets/custom_employee_card.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_searchfield.dart';
import 'package:myco_flutter/widgets/custom_simple_bottom_sheet.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

class AssignedTo extends StatefulWidget {
  const AssignedTo({super.key});

  @override
  State<AssignedTo> createState() => _VisitWithState();
}

class _VisitWithState extends State<AssignedTo> {
  final TextEditingController searchController = TextEditingController();
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
  Color blendedColor = Color.lerp(Color(0xFFF54444), Color(0xFFFFFFFF), 0.5)!;


  @override
  Widget build(BuildContext context) => SafeArea(
    child: Container(
      padding: EdgeInsets.symmetric(
        horizontal: 31 * Responsive.getResponsiveText(context),
        vertical: 5 * Responsive.getResponsiveText(context),
      ),
      height: Responsive.getHeight(context) * 0.95,
      width: Responsive.getWidth(context),
      child: Column(
        spacing: 16 * Responsive.getResponsive(context),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                'assign_to',
                fontSize: Responsive.getDashboardResponsiveText(context) * 20,
                isKey: true,
                fontWeight: FontWeight.bold,
                color: AppTheme.getColor(context).onSurface,
              ),
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: SvgPicture.asset('assets/visit/dropdown_visit.svg'),
              ),
            ],
          ),
          CustomSearchField(
            hintText: LanguageManager().get('search'),
            controller: searchController,
          ),


          // Branch Section
          BlocBuilder<InputTagBloc, InputTagState>(
            builder: (context, state) => Column(
              children: [
                LabelRow(
                  title: 'blocks',
                  actionLabel: 'select_branch',
                  Isselectbtn: state.Branchtags.isNotEmpty,
                  onTap: () async {
                    final List<String>? selectedIds = await showCustomSimpleBottomSheet(
                      context: context,
                      heading: 'select_branch',
                      dataList: branches,
                      btnTitle: 'add',
                      isMultipleSelection: true,
                    );

                    if (selectedIds != null && selectedIds.isNotEmpty) {
                      for (final id in selectedIds) {
                        final selectedMap = branches.firstWhere(
                              (e) => e['id'] == id,
                          orElse: () => {'id': '', 'name': ''},
                        );

                        context.read<InputTagBloc>().add(
                          AddBranchTagFromSheet(selectedMap['name'] ?? ''),
                        );
                      }
                    }
                  },
                ),
                CustomTagInputField(
                  tags: state.Branchtags,
                  hint: 'block',
                  onAdd: (value) {
                    final cleanValue = value.replaceAll(',', '').trim();
                    if (cleanValue.isNotEmpty &&
                        !state.Branchtags.contains(cleanValue)) {
                      context.read<InputTagBloc>().add(
                        AddBranchTagFromSheet(cleanValue),
                      );
                    }
                  },
                  onRemove: (tag) {
                    context.read<InputTagBloc>().add(RemoveBranchTag(tag));
                  },
                  onArrowTap: () async {
                    final List<String>? selectedIds = await showCustomSimpleBottomSheet(
                      context: context,
                      heading: 'select_branch',
                      dataList: branches,
                      btnTitle: 'add',
                      isMultipleSelection: true,
                    );

                    if (selectedIds != null && selectedIds.isNotEmpty) {
                      for (final id in selectedIds) {
                        final selectedMap = branches.firstWhere(
                              (e) => e['id'] == id,
                          orElse: () => {'id': '', 'name': ''},
                        );

                        context.read<InputTagBloc>().add(
                          AddBranchTagFromSheet(selectedMap['name'] ?? ''),
                        );
                      }
                    }
                  },
                ),
              ],
            ),
          ),

          // Department Section - SHOWN ONLY IF branch selected
          BlocBuilder<InputTagBloc, InputTagState>(
            builder: (context, state) {
              if (state.Branchtags.isEmpty) {
                return const SizedBox.shrink();
              }

              return Column(
                children: [
                  LabelRow(
                    title: 'department',
                    actionLabel: 'select_department',
                    Isselectbtn: state.Departmenttags.isNotEmpty,
                    onTap: () async {
                      final List<String>? selectedIds = await showCustomSimpleBottomSheet(
                        context: context,
                        heading: 'select_department',
                        dataList: Department,
                        btnTitle: 'add',
                        isMultipleSelection: true,
                      );

                      if (selectedIds != null && selectedIds.isNotEmpty) {
                        for (final id in selectedIds) {
                          final selectedMap = Department.firstWhere(
                                (e) => e['id'] == id,
                            orElse: () => {'id': '', 'name': ''},
                          );

                          context.read<InputTagBloc>().add(
                            AddDepartmentTagFromSheet(selectedMap['name'] ?? ''),
                          );
                        }
                      }
                    },
                  ),
                  CustomTagInputField(
                    onArrowTap: () async {
                      final List<String>? selectedIds = await showCustomSimpleBottomSheet(
                        context: context,
                        heading: 'select_department',
                        dataList: Department,
                        btnTitle: 'add',
                        isMultipleSelection: true,
                      );

                      if (selectedIds != null && selectedIds.isNotEmpty) {
                        for (final id in selectedIds) {
                          final selectedMap = Department.firstWhere(
                                (e) => e['id'] == id,
                            orElse: () => {'id': '', 'name': ''},
                          );

                          context.read<InputTagBloc>().add(
                            AddDepartmentTagFromSheet(selectedMap['name'] ?? ''),
                          );
                        }
                      }
                    },
                    tags: state.Departmenttags,
                    hint: 'department',
                    onAdd: (value) {
                      final cleanValue = value.replaceAll(',', '').trim();
                      if (cleanValue.isNotEmpty &&
                          !state.Departmenttags.contains(cleanValue)) {
                        context.read<InputTagBloc>().add(
                          AddDepartmentTagFromSheet(cleanValue),
                        );
                      }
                    },
                    onRemove: (tag) {
                      context.read<InputTagBloc>().add(RemoveDepartmentTag(tag));
                    },
                  ),
                ],
              );
            },
          ),

          // Employees Grid
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) => GridView.builder(
                padding: const EdgeInsets.all(5),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: Responsive.getGridConfig(
                    context,
                    screenWide: constraints.maxWidth,
                  ).itemCount,
                  mainAxisSpacing: Responsive.getGridConfig(
                    context,
                    screenWide: constraints.maxWidth,
                  ).spacing,
                  crossAxisSpacing: Responsive.getGridConfig(
                    context,
                    screenWide: constraints.maxWidth,
                  ).spacing,
                  childAspectRatio: Responsive.getGridConfig(
                    context,
                    screenWide: constraints.maxWidth,
                  ).childAspectRatio,
                ),
                itemCount: employees.length,
                itemBuilder: (context, index) {
                  final emp = employees[index];
                  return EmployeeSelectionCard(
                    selectedColor: blendedColor,
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

          // Add Button
          Align(
            alignment: Alignment.bottomCenter,
            child: MyCoButton(
              title: LanguageManager().get('add'),
              boarderRadius: 50,
              height: 0.05 * Responsive.getHeight(context),
              isShadowBottomLeft: true,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w500,
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    ),
  );
}
