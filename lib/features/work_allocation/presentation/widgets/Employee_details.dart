import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/work_allocation/presentation/widgets/employee_card.dart';
import 'package:myco_flutter/features/work_allocation/presentation/widgets/label_with_star.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

class Employee {
  final String name;
  final String role;
  final String imageUrl;

  Employee({required this.name, required this.role, required this.imageUrl});
}

class AssignEngineerField extends StatefulWidget {
  final List<Employee> allEmployees;

  const AssignEngineerField({super.key, required this.allEmployees});

  @override
  State<AssignEngineerField> createState() => _AssignEngineerFieldState();
}

class _AssignEngineerFieldState extends State<AssignEngineerField> {
  final TextEditingController controller = TextEditingController();
  final LayerLink layerLink = LayerLink();
  final GlobalKey textFieldKey = GlobalKey();
  bool showList = false;

  List<Employee> filteredList = [];
  Employee? selectedEmployee;
  OverlayEntry? overlayEntry;

  @override
  void initState() {
    super.initState();
    controller.addListener(filterList);
  }

  void filterList() {
    final query = controller.text.trim().toLowerCase();

    if (query.isEmpty) {
      removeOverlay();
      setState(() {
        showList = false;
        filteredList = [];
      });
      return;
    }

    filteredList = widget.allEmployees
        .where((e) => e.name.toLowerCase().contains(query))
        .toList();

    if (filteredList.isEmpty) {
      removeOverlay();
      return;
    }

    setState(() => showList = true);
    showOverlay();
  }

  void selectEmployee(Employee emp) {
    controller.clear();
    setState(() {
      selectedEmployee = emp;
      showList = false;
    });
    removeOverlay();
  }

  void removeSelected() {
    setState(() {
      selectedEmployee = null;
    });
  }

  void removeOverlay() {
    overlayEntry?.remove();
    overlayEntry = null;
  }

  void showOverlay() {
    removeOverlay();

    overlayEntry = OverlayEntry(
      builder: (context) => Positioned.fill(
        child: Padding(
          padding: EdgeInsets.all(30 * Responsive.getResponsive(context)),
          child: CompositedTransformFollower(
            link: layerLink,
            showWhenUnlinked: false,
            offset: const Offset(10.0, 94.0),
            child: Material(
              child: ListView.builder(
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: filteredList.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final emp = filteredList[index];
                  return GestureDetector(
                    onTap: () => selectEmployee(emp),
                    child: Container(
                      height: 0.070 * Responsive.getHeight(context),
                      margin: const EdgeInsets.symmetric(
                        vertical: 4,
                        horizontal: 8,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            blurRadius: 6,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          const SizedBox(width: 8),
                          CircleAvatar(
                            backgroundImage: NetworkImage(emp.imageUrl),
                            radius: 18,
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  emp.name,
                                  fontWeight: FontWeight.bold,
                                  fontSize:
                                      14 *
                                      Responsive.getResponsiveText(context),
                                ),
                                CustomText(
                                  emp.role.isNotEmpty
                                      ? emp.role
                                      : 'No Role Assigned',
                                  fontSize:
                                      12 *
                                      Responsive.getResponsiveText(context),
                                  color: Colors.grey,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 8),
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
    );

    Overlay.of(context).insert(overlayEntry!);
  }

  @override
  void dispose() {
    controller.dispose();
    removeOverlay();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => CompositedTransformTarget(
    link: layerLink,
    child: IntrinsicHeight(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          labelWithAsterisk(context, 'Assign Work Engineer'),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade400),
              borderRadius: BorderRadius.circular(12),
              color: AppTheme.getColor(context).onPrimary,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  key: textFieldKey,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: AppTheme.getColor(context).outline,
                        width: 1.0,
                      ),
                    ),
                  ),
                  child: TextField(
                    controller: controller,
                    decoration: InputDecoration(
                      hintText: 'Mention Here',
                      hintStyle: TextStyle(
                        fontSize: 14 * Responsive.getResponsiveText(context),
                        fontWeight: FontWeight.w400,
                        color: AppTheme.getColor(context).outline,
                      ),
                      border: InputBorder.none,
                      isDense: true,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 14,
                      ),
                      // Adds padding for better height
                      suffixIcon: controller.text.isNotEmpty
                          ? IconButton(
                              icon: const Icon(Icons.clear),
                              onPressed: () {
                                controller.clear();
                                removeOverlay();
                              },
                            )
                          : null,
                    ),
                  ),
                ),
                if (selectedEmployee != null)
                  SizedBox(
                    height: 150,
                    width: 150,
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
      ),
    ),
  );
}
