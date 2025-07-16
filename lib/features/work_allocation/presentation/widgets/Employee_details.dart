import 'package:flutter/material.dart';

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
  final TextEditingController _controller = TextEditingController();
  List<Employee> _filteredList = [];
  Employee? _selectedEmployee;
  bool _showList = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(_filterList);
  }

  void _filterList() {
    final query = _controller.text.toLowerCase();
    if (query.isEmpty) {
      setState(() => _showList = false);
      return;
    }
    setState(() {
      _filteredList = widget.allEmployees
          .where((e) => e.name.toLowerCase().contains(query))
          .toList();
      _showList = true;
    });
  }

  void _selectEmployee(Employee emp) {
    _controller.clear();
    setState(() {
      _selectedEmployee = emp;
      _showList = false;
    });
  }

  void _removeSelected() {
    setState(() {
      _selectedEmployee = null;
    });
  }

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text(
        "Assign Work Engineer *",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      const SizedBox(height: 8),
      Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade400),
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
        ),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: "Mention Here",
                border: InputBorder.none,
                isDense: true,
                suffixIcon: _controller.text.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          _controller.clear();
                          setState(() => _showList = false);
                        },
                      )
                    : null,
              ),
            ),
            if (_showList)
              Container(
                constraints: const BoxConstraints(maxHeight: 150),
                margin: const EdgeInsets.only(top: 4),
                padding: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: _filteredList.length,
                  itemBuilder: (context, index) {
                    final emp = _filteredList[index];
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(emp.imageUrl),
                      ),
                      title: Text(emp.name),
                      subtitle: Text(emp.role),
                      onTap: () => _selectEmployee(emp),
                    );
                  },
                ),
              ),
            if (_selectedEmployee != null)
              Container(
                margin: const EdgeInsets.only(top: 12),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Stack(
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundImage: NetworkImage(
                            _selectedEmployee!.imageUrl,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              _selectedEmployee!.name,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              _selectedEmployee!.role,
                              style: const TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Positioned(
                      top: -4,
                      right: -4,
                      child: GestureDetector(
                        onTap: _removeSelected,
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.close,
                            size: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    ],
  );
}
