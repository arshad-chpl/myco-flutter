import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/chat/presentation/widgets/select_department.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

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
      SizedBox(height: 16 * Responsive.getResponsiveText(context)),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          
          CustomText(
            'Department',
            fontSize: 14 * Responsive.getResponsiveText(context),
            fontWeight: FontWeight.w600,
            color: AppTheme.getColor(context).onSurface,
          ),
          InkWell(
            onTap: _openDepartmentPicker,
            child: Row(
              children: [
                Icon(
                  Icons.add_circle_outline,
                  size: 16 * Responsive.getResponsiveText(context),
                ),
                const SizedBox(width: 8),
                CustomText(
                  'select_department',
                  
                    fontSize: 14 * Responsive.getResponsiveText(context),
                    fontWeight: FontWeight.w600,
                    color: AppTheme.getColor(context).onSurface,
           
                ),
              ],
            ),
          ),
        ],
      ),
      SizedBox(height: 0.01 * Responsive.getHeight(context)),
      /// Chips or Placeholder Box
      InkWell(
        onTap: _openDepartmentPicker,
        child: Container(
          padding:  EdgeInsets.symmetric(horizontal: 12 * Responsive.getResponsive(context), vertical: 8 * Responsive.getResponsive(context)),
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
                        margin:  EdgeInsets.symmetric(vertical: 6 * Responsive.getResponsive(context)),
                        child: CustomText(
                          'No department selected',
                          fontSize: 16 * Responsive.getResponsiveText(context),
                            color: AppTheme.getColor(context).outline,
                        
                        ),
                      )
                    : Wrap(
                        spacing: 8,
                        runSpacing: -1,
                        children: selectedDepartments
                            .map(
                              (dept) => Container(
                                padding:  EdgeInsets.symmetric(
                                  horizontal: 10 * Responsive.getResponsive(context), 
                                  vertical: 3 * Responsive.getResponsive(context),
                                ),
                                margin:  EdgeInsets.symmetric(vertical: 4 * Responsive.getResponsive(context)),
                                decoration: BoxDecoration(
                                  color: AppTheme.getColor(
                                    context,
                                  ).surfaceContainer,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    CustomText(
                                      dept['name'] ?? '',
                                    
                                        fontSize:
                                            14 *
                                            Responsive.getResponsiveText(
                                              context,
                                            ),
                                        color: AppTheme.getColor(
                                          context,
                                        ).primary,
                                        fontWeight: FontWeight.w600,
                                     
                                    ),
                                     SizedBox(width: 0.01 * Responsive.getWidth(context)),
                                    InkWell(
                                      onTap: () => _removeDepartment(dept),
                                      child: Ink(
                                        child: Icon(
                                          Icons.close,
                                          size:
                                              16 *
                                              Responsive.getResponsiveText(
                                                context,
                                              ),
                                          color: AppTheme.getColor(
                                            context,
                                          ).primary,
                                        ),
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
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 6 * Responsive.getResponsive(context)),
                  Image.asset(
                    'assets/chat/arrow_down_sigle.png',
                    height: 22 * Responsive.getResponsive(context),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ],
  );
}
