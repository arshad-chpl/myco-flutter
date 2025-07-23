import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/core/utils/util.dart';
import 'package:myco_flutter/features/work_allocation/presentation/bloc/work_allocation_bloc.dart';
import 'package:myco_flutter/features/work_allocation/presentation/bloc/work_allocation_event.dart';
import 'package:myco_flutter/features/work_allocation/presentation/bloc/work_allocation_state.dart';
import 'package:myco_flutter/features/work_allocation/presentation/widgets/employee_card.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

class Employee {
  final String name;
  final String role;
  final String imageUrl;

  const Employee({
    required this.name,
    required this.role,
    required this.imageUrl,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Employee &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          role == other.role &&
          imageUrl == other.imageUrl;

  @override
  int get hashCode => name.hashCode ^ role.hashCode ^ imageUrl.hashCode;
}

class AssignEngineerField extends StatelessWidget {
  final List<Employee> allEmployees;
  final TextEditingController controller;
  final FocusNode focusNode;

  const AssignEngineerField({
    super.key,
    required this.allEmployees,
    required this.controller,
    required this.focusNode,
  });

  @override
  Widget build(
    BuildContext context,
  ) => BlocBuilder<WorkAllocationBloc, WorkAllocationState>(
    builder: (context, state) {
      final bloc = context.read<WorkAllocationBloc>();
      final filteredList = bloc.filteredEmployees;
      final selectedEmployee = bloc.selectedEmployee;

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                'Assign Work Engineer',
                fontSize: 14 * Responsive.getResponsiveText(context),
                fontWeight: FontWeight.w700,
                color: AppTheme.getColor(context).onSurfaceVariant,
              ),
              CustomText(
                ' *',
                fontSize: 14 * Responsive.getResponsiveText(context),
                fontWeight: FontWeight.w700,
                color: AppTheme.getColor(context).error,
                isKey: false,
              ),
            ],
          ),
          SizedBox(height: 0.003 * Responsive.getHeight(context)),
          Container(
            padding: EdgeInsets.only(
              left: 10 * Responsive.getResponsive(context),
              right: 10 * Responsive.getResponsive(context),
              bottom: 15 * Responsive.getResponsive(context),
            ),
            decoration: BoxDecoration(
              border: Border.all(
                color: AppTheme.getColor(context).outline,
                width: 1.2,
              ),
              borderRadius: BorderRadius.circular(
                12 * Responsive.getResponsive(context),
              ),
              color: AppTheme.getColor(context).surface,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 0.060 * Responsive.getHeight(context),
                  child: Focus(
                    onFocusChange: (hasFocus) {
                      if (!hasFocus) {
                        context.read<WorkAllocationBloc>().add(
                          FilterEmployeesEvent('', allEmployees),
                        );
                      }
                    },
                    child: TextField(
                      controller: controller,
                      focusNode: focusNode,
                      onChanged: (query) => context
                          .read<WorkAllocationBloc>()
                          .add(FilterEmployeesEvent(query, allEmployees)),
                      decoration: InputDecoration(
                        hintText: 'Mention Here',
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 10 * Responsive.getResponsive(context),
                        ),
                        border: const UnderlineInputBorder(),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: AppTheme.getColor(context).outline,
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: AppTheme.getColor(context).outline,
                          ),
                        ),
                        hintStyle: TextStyle(
                          fontSize: 12 * Responsive.getResponsiveText(context),
                          fontWeight: FontWeight.w600,
                          color: AppTheme.getColor(context).outline,
                        ),
                        suffixIcon: controller.text.isNotEmpty
                            ? IconButton(
                                icon: const Icon(Icons.clear),
                                onPressed: () {
                                  controller.clear();
                                  context.read<WorkAllocationBloc>().add(
                                    FilterEmployeesEvent('', allEmployees),
                                  );
                                },
                              )
                            : null,
                      ),
                    ),
                  ),
                ),

                if (filteredList.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Material(
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(maxHeight: 220),
                          child: ListView.builder(
                            padding: EdgeInsets.zero,
                            itemCount: filteredList.length,
                            itemBuilder: (context, index) {
                              final emp = filteredList[index];
                              return InkWell(
                                onTap: () => context
                                    .read<WorkAllocationBloc>()
                                    .add(SelectEmployeeEvent(emp)),
                                child: Container(
                                  height: 0.07 * Responsive.getHeight(context),
                                  margin: EdgeInsets.symmetric(
                                    vertical:
                                        4 * Responsive.getResponsive(context),
                                    horizontal:
                                        8 * Responsive.getResponsive(context),
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppTheme.getColor(context).surface,
                                    border: Border.all(
                                      color: Util.applyOpacity(
                                        AppTheme.getColor(context).outline,
                                        0.4,
                                      ),
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width:
                                            0.08 * Responsive.getWidth(context),
                                      ),
                                      CircleAvatar(
                                        radius: 18,
                                        backgroundImage: NetworkImage(
                                          emp.imageUrl,
                                        ),
                                      ),
                                      SizedBox(
                                        width:
                                            0.012 *
                                            Responsive.getWidth(context),
                                      ),
                                      Expanded(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            CustomText(
                                              emp.name,
                                              fontWeight: FontWeight.bold,
                                              fontSize:
                                                  14 *
                                                  Responsive.getResponsiveText(
                                                    context,
                                                  ),
                                              color: AppTheme.getColor(
                                                context,
                                              ).onSurface,
                                            ),
                                            CustomText(
                                              emp.role.isNotEmpty
                                                  ? emp.role
                                                  : 'No Role Assigned',
                                              fontSize:
                                                  12 *
                                                  Responsive.getResponsiveText(
                                                    context,
                                                  ),
                                              color: AppTheme.getColor(
                                                context,
                                              ).outline,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width:
                                            0.008 *
                                            Responsive.getWidth(context),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                if (selectedEmployee != null)
                  Container(
                    height: 0.190 * Responsive.getHeight(context),
                    width: 0.400 * Responsive.getWidth(context),
                    child: Padding(
                      padding: EdgeInsets.all(
                        8 * Responsive.getResponsive(context),
                      ),
                      child: EmployeeSelectionCard(
                        name: selectedEmployee.name,
                        department: selectedEmployee.role,
                        image: const Icon(Icons.person),
                        isSelected: true,
                        showDelete: true,
                        onSelected: (_) => context
                            .read<WorkAllocationBloc>()
                            .add(RemoveSelectedEmployeeEvent()),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      );
    },
  );
}
