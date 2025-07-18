import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/core/utils/util.dart';
import 'package:myco_flutter/features/work_allocation/presentation/widgets/employee_card.dart';
import 'package:myco_flutter/features/work_allocation/presentation/widgets/label_with_star.dart';
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
}

class AssignEngineerField extends StatefulWidget {
  final List<Employee> allEmployees;

  const AssignEngineerField({super.key, required this.allEmployees});

  @override
  State<AssignEngineerField> createState() => _AssignEngineerFieldState();
}

class _AssignEngineerFieldState extends State<AssignEngineerField> {
  Employee? selectedEmployee;
  final TextEditingController _controller = TextEditingController();
  List<Employee> filteredList = [];
  bool showList = false;

  //
  void filterList(String query) {
    final q = query.toLowerCase();
    if (q.isEmpty) {
      setState(() => showList = false);
      return;
    }
    setState(() {
      filteredList = widget.allEmployees
          .where((e) => e.name.toLowerCase().contains(q))
          .toList();
      showList = true;
    });
  }

  //select emp
  void selectEmployee(Employee emp) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        selectedEmployee = emp;
        _controller.clear();
        showList = false;
        FocusScope.of(context).unfocus();
      });
    });
  }

  //remove select emp
  void removeSelected() {
    setState(() => selectedEmployee = null);
  }

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      //Assign Work Engineer
      labelWithAsterisk(context, 'Assign Work Engineer'),
      SizedBox(height: 0.003 * Responsive.getHeight(context)),

      //Mention Here bottom border
      Container(
        padding: const EdgeInsets.only(left: 10, right: 10, bottom: 15),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade400),
          borderRadius: BorderRadius.circular(12),
          color: AppTheme.getColor(context).onPrimary,
        ),

        //Mention Here
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 0.060 * Responsive.getHeight(context),
              child: TextField(
                controller: _controller,
                onChanged: filterList,
                decoration: InputDecoration(
                  hintText: 'Mention Here',
                  contentPadding: const EdgeInsets.symmetric(vertical: 10),
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
                  suffixIcon: _controller.text.isNotEmpty
                      ? IconButton(
                          icon: const Icon(Icons.clear),
                          onPressed: () {
                            _controller.clear();
                            filterList('');
                          },
                        )
                      : null,
                ),
              ),
            ),

            // show list(emp)
            if (showList && filteredList.isNotEmpty)
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
                            onTap: () => selectEmployee(emp),
                            child: Container(
                              height: 0.07 * Responsive.getHeight(context),
                              margin: EdgeInsets.symmetric(
                                vertical: 4 * Responsive.getResponsive(context),
                                horizontal:
                                    8 * Responsive.getResponsive(context),
                              ),
                              decoration: BoxDecoration(
                                color: AppTheme.getColor(context).onPrimary,
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
                                  const SizedBox(width: 8),
                                  CircleAvatar(
                                    radius: 18,
                                    backgroundImage: NetworkImage(emp.imageUrl),
                                  ),
                                  const SizedBox(width: 12),
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
                                    width: 0.008 * Responsive.getWidth(context),
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

            //selected emp show(emp card)
            if (selectedEmployee != null)
              SizedBox(
                height: 150,
                width: 140,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: EmployeeSelectionCard(
                    name: selectedEmployee?.name ?? 'No emp name',
                    department: selectedEmployee?.role ?? 'no emp role',
                    image: const Icon(Icons.person),
                    isSelected: true,
                    showDelete: true,
                    onSelected: (_) => removeSelected(),
                  ),
                ),
              ),
          ],
        ),
      ),
    ],
  );
}
