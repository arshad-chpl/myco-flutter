import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/chat/presentation/widgets/select_department.dart';

class MultiDepartmentSelector extends StatefulWidget {
  const MultiDepartmentSelector({super.key});

  @override
  State<MultiDepartmentSelector> createState() =>
      _MultiDepartmentSelectorState();
}

class _MultiDepartmentSelectorState extends State<MultiDepartmentSelector> {
  final TextEditingController branchController = TextEditingController();
  List<Map<String, String>> selectedDepartments = [];

  final List<Map<String, String>> departments = [
    {'id': '1', 'name': 'QA Sales'},
    {'id': '2', 'name': 'Product Team'},
    {'id': '3', 'name': 'Technical Support'},
    {'id': '4', 'name': 'Marketing'},
    {'id': '5', 'name': 'HR'},
  ];

  void _openDepartmentPicker() async {
    final List<Map<String, String>> tempSelected = List.from(
      selectedDepartments,
    );
    final selectedId = await showCustomSimpleBottomSheet(
      context: context,
      heading: 'Select Branch',
      icon: AssetImage('assets/chat/down_arrow.png'),
      dataList: departments,
    );
    if (selectedId != null) {
      final selectedMap = departments.firstWhere(
        (e) => e['id'] == selectedId,
        orElse: () => {'id': '', 'name': ''},
      );

      final alreadySelected = selectedDepartments.any(
        (dept) => dept['id'] == selectedMap['id'],
      );

      setState(() {
        branchController.text = selectedMap['name'] ?? '';
        if (!alreadySelected && selectedMap['id']!.isNotEmpty) {
          selectedDepartments.add(selectedMap);
        }
      });
    }
  }

  void _removeDepartment(Map<String, String> dept) {
    setState(
      () => selectedDepartments.removeWhere((d) => d['id'] == dept['id']),
    );
  }

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      /// Top Label Row
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Department',
            style: TextStyle(
              fontSize: 12 * Responsive.getResponsiveText(context),
              fontWeight: FontWeight.w700,
              color: AppTheme.getColor(context).onSurface,
            ),
          ),
          TextButton.icon(
            onPressed: _openDepartmentPicker,
            icon: Icon(
              Icons.add_circle_outline,
              size: 16 * Responsive.getResponsiveText(context),
            ),
            label: Text(
              'Select Department',
              style: TextStyle(
                fontSize: 12 * Responsive.getResponsiveText(context),
                fontWeight: FontWeight.w700,
                color: AppTheme.getColor(context).onSurface,
              ),
            ),
            style: TextButton.styleFrom(foregroundColor:AppTheme.getColor(context).primary),
          ),
        ],
      ),

      /// Chips or Placeholder Box
      InkWell(
        onTap: _openDepartmentPicker,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          decoration: BoxDecoration(
            border: Border.all(color: AppTheme.getColor(context).outline),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Show Chips
              Expanded(
                child: selectedDepartments.isEmpty
                    ? Container(
                      margin: const EdgeInsets.symmetric(vertical: 4),
                      child:  Text(
                          'No department selected',
                          style: TextStyle(color: AppTheme.getColor(context).outline),
                        ),
                    )
                    : Wrap(
                        spacing: 8,
                        runSpacing: -1,
                        children: selectedDepartments
                            .map(
                              (dept) => Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 6,
                                ),
                                margin: const EdgeInsets.symmetric(vertical: 4),
                                decoration: BoxDecoration(
                                  color: AppTheme.getColor(context).surfaceContainer,
                                  borderRadius: BorderRadius.circular(8),
                                  
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      dept['name'] ?? '',
                                      style: TextStyle(
                                        fontSize:
                                            14 *
                                            Responsive.getResponsiveText(
                                              context,
                                            ),
                                        color: AppTheme.getColor(context).primary,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const SizedBox(width: 6),
                                    GestureDetector(
                                      onTap: () => _removeDepartment(dept),
                                      child: Icon(
                                        Icons.close,
                                        size:
                                            16 *
                                            Responsive.getResponsiveText(
                                              context,
                                            ),
                                        color: AppTheme.getColor(context).primary,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                            .toList(),
                      ),
              ),

              /// Dropdown Icon
               Image.asset(
                'assets/chat/arrow_down_sigle.png',
                height: 26 * Responsive.getResponsive(context),
                
                )
            ],
          ),
        ),
      ),
    ],
  );
}
