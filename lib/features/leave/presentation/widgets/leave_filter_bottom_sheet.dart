import 'package:flutter/material.dart';

class LeaveFilterBottomSheet extends StatefulWidget {
  final String selectedValue;
  final Function(String) onSelected;
  final List options;

  const LeaveFilterBottomSheet({
    super.key,
    required this.selectedValue,
    required this.onSelected, required this.options,
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

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: widget.options.map((option) => RadioListTile<String>(
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


void showLeaveFilterBottomSheet(BuildContext context, String selected,
    Function(String) onSelected, List options) {
  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    builder: (_) => LeaveFilterBottomSheet(
      selectedValue: selected,
      onSelected: onSelected,
      options: options,
    ),
  );
}
