// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/leave/presentation/widgets/leave_filter_bottom_sheet.dart';
import 'package:myco_flutter/features/leave/presentation/widgets/required_text_label.dart';
import 'package:myco_flutter/widgets/custom_calender.dart';
import 'package:myco_flutter/widgets/custom_text_field.dart';

class AddLeaveScreen extends StatefulWidget {
  const AddLeaveScreen({super.key});

  @override
  State<AddLeaveScreen> createState() => _AddLeaveScreenState();
}

class _AddLeaveScreenState extends State<AddLeaveScreen> {
  final TextEditingController _leaveTypeController = TextEditingController();
  final FocusNode _leaveTypeFocusNode = FocusNode();
  String selectedValue = 'All Leaves';

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      leading: IconButton(
        onPressed: () {
          context.pop();
        },
        icon: const Icon(Icons.arrow_back_outlined),
      ),
      title: const Text('Add Leave'),
      centerTitle: false,
      elevation: 0,
    ),
    body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomCalendar(),
            RequiredTextLabel(
              text: 'Add Reason',
              isRequired: true,
              style: TextStyle(
                fontSize: 15 * Responsive.getResponsiveText(context),
                fontWeight: FontWeight.w700,
                color: AppTheme.getColor(context).onSurfaceVariant,
              ),
            ),
            SizedBox(height: 0.01 * Responsive.getHeight(context)),
            MyCoTextfield(
              focusNode: _leaveTypeFocusNode,
              isReadOnly: true,
              validator: (value) => value == null || value.isEmpty
                  ? 'Please select a type of leave'
                  : null,
              controller: _leaveTypeController,
              hintText: 'Select',
              hintTextStyle: TextStyle(
                fontSize: 18 * Responsive.getResponsiveText(context),
                color: AppTheme.getColor(context).outline,
              ),
              image1: 'assets/images/arrow-down.png',
              onClick: () {
                showLeaveFilterBottomSheet(
                  context,
                  _leaveTypeController.text,
                  (p0) {
                    _leaveTypeController.text = p0;
                    setState(() {});
                  },
                  [
                    'Sick Leave',
                    'Casual Leave',
                    'Testing Leave',
                    'Birthday Leave',
                    'Other Leave',
                  ],
                );
              },
              preFixImage: 'assets/images/note-favorite.png',
              suffix: Icon(
                Icons.keyboard_arrow_down_sharp,
                color: AppTheme.getColor(context).primary,
                size: 30 * Responsive.getResponsive(context),
              ),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color: Color(0xFF98A2B3), width: 1),
              ),
              textAlignment: TextAlign.start,
            ),
          ],
        ),
      ),
    ),
  );
}
