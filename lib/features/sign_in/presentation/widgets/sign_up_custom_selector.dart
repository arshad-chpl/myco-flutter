import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:myco_flutter/constants/app_assets.dart';
import 'package:myco_flutter/core/utils/language_manager.dart';
import 'package:myco_flutter/features/sign_in/presentation/custome_bloc/my_form_bloc.dart';
import 'package:myco_flutter/features/sign_in/presentation/pages/select_custom_dialog.dart';
import 'package:myco_flutter/widgets/custom_text_field_new.dart';

Widget buildCustomSelector({
  required BuildContext context,
  required String label,
  required String selectedId,
  required String selectedName,
  required List<String> optionIds,
  required List<String> optionNames,
  required String defaultLabelKey, // This is our 'fieldKey'
  required String prefixIcon,
   String? Function(String?)? validator,
  bool? isRequired,
}) => NewTextField(
    label: label,
    prefixIconPath: prefixIcon,
    suffixIconPath: AppAssets.downArrow,
    hintText: LanguageManager().get('select'),
    isRequired: isRequired ?? false,// Prevent keyboard from appearing
    controller: TextEditingController(text: selectedName),
    validator: validator,
    onTap: () {
      if (optionIds.isEmpty) {
        Fluttertoast.showToast(msg: 'No ${defaultLabelKey.replaceAll('_', ' ')} found.', backgroundColor: Colors.redAccent, textColor: Colors.white,);
        return;
      }
      _showSelectionDialog(
        context: context,
        optionId: optionIds,
        optionName: optionNames,
        selectedValue: selectedId,
        title: defaultLabelKey[0].toUpperCase() + defaultLabelKey.substring(1),
        fieldKey: defaultLabelKey, // Pass the key
      );
    },
  );

void _showSelectionDialog({
  required BuildContext context, // This context has access to the BLoC
  required List<String> optionId,
  required List<String> optionName,
  required String? selectedValue,
  required String title,
  required String fieldKey, // Receive the key
}) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    backgroundColor: Colors.white,
    // **FIX**: Provide the existing BLoC instance to the new route (the modal sheet)
    builder: (_) => BlocProvider.value(
      value: BlocProvider.of<MyFormBloc>(context),
      child: SelectCustomDialog(
        optionIds: optionId,
        optionNames: optionName,
        selectedId: selectedValue,
        title: title,
        fieldKey: fieldKey, // Pass the key to the dialog
      ),
    ),
  );
}

// ... (Your getDefaultLabel function remains the same)
String getDefaultLabel(String field) {
  switch (field) {
    case 'branch':
      return 'Select Branch';
    case 'department':
      return 'Select Department';
    case 'sub department':
      return 'Select Sub Department';
    case 'shift':
      return 'Select Shift';
    case 'designation':
      return 'Select Designation';
    default:
      return '';
  }
}