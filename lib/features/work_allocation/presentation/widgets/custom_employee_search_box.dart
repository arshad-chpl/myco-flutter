import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/widgets/custom_employee_card.dart';

class CustomEmployeeSearchBox extends StatefulWidget {
  final ValueChanged<EmployeeSelectionModel>? onEmployeeSelected;

  const CustomEmployeeSearchBox({super.key, this.onEmployeeSelected});

  @override
  State<CustomEmployeeSearchBox> createState() =>
      _CustomEmployeeSearchBoxState();
}

class _CustomEmployeeSearchBoxState extends State<CustomEmployeeSearchBox> {
  final TextEditingController _controller = TextEditingController();
  final List<EmployeeSelectionModel> _allEmployees = [
    EmployeeSelectionModel(
      image: const AssetImage('assets/images/user1.png'),
      name: 'John Doe',
      department: 'Sales',
    ),
    EmployeeSelectionModel(
      image: const AssetImage('assets/images/user2.png'),
      name: 'Jane Smith',
      department: 'Support',
    ),
    EmployeeSelectionModel(
      image: const AssetImage('assets/images/user3.png'),
      name: 'Mike Johnson',
      department: 'Development',
    ),
  ];

  List<EmployeeSelectionModel> _filteredEmployees = [];
  String? _selectedName;

  @override
  void initState() {
    super.initState();
    _filteredEmployees = _allEmployees;
  }

  void _filterEmployees(String query) {
    setState(() {
      _filteredEmployees = _allEmployees
          .where((e) => e.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  void _selectEmployee(EmployeeSelectionModel employee) {
    setState(() {
      _selectedName = employee.name;
      _controller.text = employee.name;
    });
    widget.onEmployeeSelected?.call(employee);
  }

  @override
  Widget build(BuildContext context) => Container(
    padding: EdgeInsets.all(16 * Responsive.getResponsive(context)),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8),
      border: Border.all(color: AppTheme.getColor(context).outline),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // TextField with bottom border
        TextField(
          controller: _controller,
          onChanged: _filterEmployees,
          decoration: InputDecoration(
            hintText: 'Search Employee',
            hintStyle: TextStyle(color: AppTheme.getColor(context).outline),
            border: const UnderlineInputBorder(),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade400),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: AppTheme.getColor(context).outline),
            ),
            isDense: true,
            contentPadding: EdgeInsets.only(
              bottom: 8 * Responsive.getResponsive(context),
            ),
          ),
          style: TextStyle(
            fontSize: 14 * Responsive.getResponsiveText(context),
            color: Colors.black,
          ),
        ),

        const SizedBox(height: 12),

        // Show EmployeeSelectionCard only when selected
        if (_selectedName != null)
          EmployeeSelectionCard(
            image: _allEmployees
                .firstWhere((e) => e.name == _selectedName!)
                .image,
            name: _selectedName!,
            department: _allEmployees
                .firstWhere((e) => e.name == _selectedName!)
                .department,
            isSelected: true,
            onSelected: _selectEmployee,
          ),

        // Show suggestion list using EmployeeSelectionCard while typing
        if (_controller.text.isNotEmpty && _selectedName != _controller.text)
          SizedBox(
            height: 240 * Responsive.getResponsive(context),
            child: ListView.builder(
              itemCount: _filteredEmployees.length,
              itemBuilder: (context, index) {
                final employee = _filteredEmployees[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: EmployeeSelectionCard(
                    image: employee.image,
                    name: employee.name,
                    department: employee.department,
                    isSelected: false,
                    onSelected: _selectEmployee,
                  ),
                );
              },
            ),
          ),
      ],
    ),
  );
}
