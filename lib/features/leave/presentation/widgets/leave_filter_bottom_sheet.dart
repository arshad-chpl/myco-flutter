import 'package:flutter/material.dart';

class LeaveFilterBottomSheet extends StatefulWidget {
  final String selectedValue;
  final Function(String) onSelected;

  const LeaveFilterBottomSheet({
    super.key,
    required this.selectedValue,
    required this.onSelected,
  });

  @override
  State<LeaveFilterBottomSheet> createState() => _LeaveFilterBottomSheetState();
}

class _LeaveFilterBottomSheetState extends State<LeaveFilterBottomSheet> {
  late String _currentValue;

  @override
  void initState() {
    super.initState();
    _currentValue = widget.selectedValue;
  }

  @override
  Widget build(BuildContext context) {
    final options = ['All Leaves', 'Paid Leaves', 'UnPaid Leaves'];

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: options.map((option) => RadioListTile<String>(
            contentPadding: EdgeInsets.zero,
            activeColor: Colors.blue.shade900,
            title: Text(
              option,
              style: const TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.w500),
            ),
            value: option,
            groupValue: _currentValue,
            onChanged: (value) {
              if (value != null) {
                setState(() {
                  _currentValue = value;
                });
                widget.onSelected(value);
                Navigator.pop(context);
              }
            },
          )).toList(),
      ),
    );
  }
}


void showLeaveFilterBottomSheet(BuildContext context, String selected, Function(String) onSelected) {
  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    builder: (_) => LeaveFilterBottomSheet(
      selectedValue: selected,
      onSelected: onSelected,
    ),
  );
}
