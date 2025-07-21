import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/leave/presentation/widgets/leave_filter_bottom_sheet.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_text_field.dart';

class LeaveEncashmentForm extends StatefulWidget {
  final List<String> leaveOptions;
  final void Function(String selectedLeave, String remark) onSave;
  final VoidCallback onCancel;

  const LeaveEncashmentForm({
    super.key,
    required this.leaveOptions,
    required this.onSave,
    required this.onCancel,
  });

  @override
  State<LeaveEncashmentForm> createState() => _LeaveEncashmentFormState();
}

class _LeaveEncashmentFormState extends State<LeaveEncashmentForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _selectedLeave = TextEditingController();
  final TextEditingController _remarkController = TextEditingController();

  @override
  void dispose() {
    _remarkController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = Responsive.getWidth(context);
    double height = Responsive.getHeight(context);

    return Padding(
      padding: EdgeInsets.all(width * 0.04),
      child: Container(
        padding: EdgeInsets.all(width * 0.05),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.blue.shade100),
        ),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Leave Encashment Request',
                style: TextStyle(
                  fontSize: width * 0.045,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue.shade800,
                ),
              ),
              SizedBox(height: height * 0.03),

              /// Dropdown
              Text(
                'Encashment Leave',
                style: TextStyle(
                  fontSize: width * 0.038,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: height * 0.008),

              MyCoTextfield(
                isReadOnly: true,
                validator: (value) => value == null || value.isEmpty
                    ? 'Please select a type of leave'
                    : null,
                controller: _selectedLeave,
                hintText: 'Select',
                hintTextStyle: TextStyle(
                  fontSize: 18 * Responsive.getResponsiveText(context),
                  color: AppTheme.getColor(context).outline,
                ),
                image1: 'assets/images/arrow-down.png',
                onClick: () {
                  showLeaveFilterBottomSheet(context, _selectedLeave.text, (
                    p0,
                  ) {
                    _selectedLeave.text = p0;
                    setState(() {});
                  }, widget.leaveOptions);
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
              SizedBox(height: height * 0.025),

              /// Remark
              Text(
                'Remark',
                style: TextStyle(
                  fontSize: width * 0.038,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: height * 0.008),
              MyCoTextfield(
                isReadOnly: false,
                validator: (value) => value == null || value.isEmpty
                    ? 'Please enter a remark'
                    : null,
                controller: _remarkController,
                hintText: 'rwmark',
                hintTextStyle: TextStyle(
                  fontSize: 18 * Responsive.getResponsiveText(context),
                  color: AppTheme.getColor(context).outline,
                ),
                preFixImage: 'assets/images/message-question.png',
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(color: Color(0xFF98A2B3), width: 1),
                ),
                textAlignment: TextAlign.start,
                maxLines: 3,
              ),
              SizedBox(height: height * 0.03),

              /// Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MyCoButton(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    title: 'Cancel',
                    height: 0.06 * Responsive.getHeight(context),
                    boarderRadius: 30,

                    width: 0.3 * Responsive.getWidth(context),
                    textStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.black,
                    ),
                    backgroundColor: AppColors.transparent,
                  ),
                  // Save Button
                  MyCoButton(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        widget.onSave(
                          _selectedLeave.text.trim(),
                          _remarkController.text.trim(),
                        );
                      }
                    },
                    title: 'Save',
                    height: 0.06 * Responsive.getHeight(context),
                    boarderRadius: 30,

                    width: 0.3 * Responsive.getWidth(context),
                    textStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppTheme.getColor(context).onPrimary,
                    ),
                    backgroundColor: AppTheme.getColor(context).primary,
                    isShadowBottomLeft: true,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
