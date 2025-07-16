import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/leave/presentation/bloc/leave_bloc.dart';
import 'package:myco_flutter/features/leave/presentation/bloc/leave_event.dart';
import 'package:myco_flutter/features/leave/presentation/bloc/leave_state.dart';
import 'package:myco_flutter/features/leave/presentation/widgets/ios_calendar_time_picker.dart';
import 'package:myco_flutter/features/leave/presentation/widgets/required_text_label.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_text_field.dart';

class AddShortLeaveScreen extends StatefulWidget {
  const AddShortLeaveScreen({super.key});

  @override
  State<AddShortLeaveScreen> createState() => _AddShortLeaveScreenState();
}

class _AddShortLeaveScreenState extends State<AddShortLeaveScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();
  final TextEditingController _reasonController = TextEditingController();
  final FocusNode _dateFocusNode = FocusNode();
  final FocusNode _timeFocusNode = FocusNode();
  final FocusNode _reasonFocusNode = FocusNode();

  @override
  void dispose() {
    _dateController.dispose();
    _timeController.dispose();
    _reasonController.dispose();
    _dateFocusNode.dispose();
    _timeFocusNode.dispose();
    _reasonFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    resizeToAvoidBottomInset: false,
    appBar: AppBar(title: const Text('Add Short Leave')),
    body: BlocListener<LeaveBloc, LeaveState>(
      listener: (context, state) {
        if (state is ShortLeaveAdded) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Short leave added successfully')),
          );
          Navigator.pop(context);
        } else if (state is LeaveError) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      child: _buildBody(),
    ),
  );

  Widget _buildBody() => InkWell(
    focusColor: Colors.transparent,
    onTap: () {
      _reasonFocusNode.unfocus();
      _dateFocusNode.unfocus();
      _timeFocusNode.unfocus();
    },
    child: SafeArea(
      child: Padding(
        padding: EdgeInsets.only(
          left: 20 * Responsive.getResponsive(context),
          right: 20 * Responsive.getResponsive(context),
        ),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildDateField(),
              SizedBox(height: 0.02 * Responsive.getHeight(context)),
              _buildTimeField(),
              SizedBox(height: 0.02 * Responsive.getHeight(context)),
              _buildReasonField(),
              const Spacer(),
              _buildSubmitButton(),
            ],
          ),
        ),
      ),
    ),
  );

  Widget _buildDateField() => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      RequiredTextLabel(
        text: 'Select Date',
        isRequired: true,
        style: TextStyle(
          fontSize: 15 * Responsive.getResponsiveText(context),
          fontWeight: FontWeight.w700,
          color: AppTheme.getColor(context).onSurfaceVariant,
        ),
      ),
      SizedBox(height: 0.01 * Responsive.getHeight(context)),
      MyCoTextfield(
        controller: _dateController,
        focusNode: _dateFocusNode,
        hintText: 'Select Date',
        validator: (value) =>
            value == null || value.isEmpty ? 'Please select a date' : null,
        onClick: _showDatePicker,
        hintTextStyle: TextStyle(
          fontSize: 18 * Responsive.getResponsiveText(context),
          color: AppTheme.getColor(context).outline,
        ),
        preFixImage: 'assets/images/note-favorite.png',
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: Color(0xFF98A2B3)),
        ),
        height: 0.05 * Responsive.getHeight(context),
        textAlignment: TextAlign.start,
        isSuffixIconOn: true,
        image1: 'assets/images/arrow-down.png',
        isReadOnly: true,
        suffix: Icon(
          Icons.keyboard_arrow_down_sharp,
          color: AppTheme.getColor(context).primary,
          size: 30 * Responsive.getResponsive(context),
        ),
      ),
    ],
  );

  Widget _buildTimeField() => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      RequiredTextLabel(
        text: 'Short Leave Time',
        isRequired: true,
        style: TextStyle(
          fontSize: 15 * Responsive.getResponsiveText(context),
          fontWeight: FontWeight.w700,
          color: AppTheme.getColor(context).onSurfaceVariant,
        ),
      ),
      SizedBox(height: 0.01 * Responsive.getHeight(context)),
      MyCoTextfield(
        validator: (value) =>
            value == null || value.isEmpty ? 'Please select a time' : null,
        onClick: _showTimePicker,
        isReadOnly: true,
        controller: _timeController,
        focusNode: _timeFocusNode,
        hintText: 'Select Time',
        hintTextStyle: TextStyle(
          fontSize: 18 * Responsive.getResponsiveText(context),
          color: AppTheme.getColor(context).outline,
        ),
        preFixImage: 'assets/images/clock.png',
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: Color(0xFF98A2B3)),
        ),
        height: 0.05 * Responsive.getHeight(context),
        textAlignment: TextAlign.start,
      ),
    ],
  );

  Widget _buildReasonField() => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
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
        focusNode: _reasonFocusNode,
        isReadOnly: false,
        validator: (value) => value == null || value.isEmpty
            ? 'Please enter a reason for leave'
            : null,
        controller: _reasonController,
        hintText: 'Reason for Leave',
        hintTextStyle: TextStyle(
          fontSize: 18 * Responsive.getResponsiveText(context),
          color: AppTheme.getColor(context).outline,
        ),
        preFixImage: 'assets/images/message-question.png',
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: Color(0xFF98A2B3)),
        ),
        textAlignment: TextAlign.start,
        maxLines: 5,
      ),
    ],
  );

  Widget _buildSubmitButton() => Center(
    child: MyCoButton(
      onTap: () {
        if (_formKey.currentState?.validate() ?? false) {
          context.read<LeaveBloc>().add(
            AddShortLeave(
              _dateController.text,
              _timeController.text,
              _reasonController.text,
            ),
          );
        }
      },
      title: 'ADD',
      height: 0.065 * Responsive.getHeight(context),
      width: 0.65  * Responsive.getWidth(context),
      boarderRadius: 30,
      textStyle: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: AppTheme.getColor(context).onPrimary,
      ),
      backgroundColor: AppTheme.getColor(context).primary,
      isShadowBottomLeft: true,
    ),
  );

  void _showDatePicker() {
    showModalBottomSheet(
      backgroundColor: AppColors.white,
      context: context,
      builder: (context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
        child: DialDatePickerWidget(
          initialDate: DateTime.now(),
          onSubmit: (selectedDate) {
            final String date = DateFormat('yyyy-MM-dd').format(selectedDate);
            _dateController.text = date;
            log(date, name: 'Picked Date');
            Navigator.pop(context);
          },
        ),
      ),
    );
  }

  void _showTimePicker() {
    showModalBottomSheet(
      backgroundColor: AppColors.white,
      context: context,
      builder: (context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
        child: DialDatePickerWidget(
          timePicker: true,
          initialDate: DateTime.now(),
          onSubmit: (selectedDate) {
            final String time = DateFormat('HH:mm').format(selectedDate);
            _timeController.text = time;
            log(time, name: 'Picked Time');
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
