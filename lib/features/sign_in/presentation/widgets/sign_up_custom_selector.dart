import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:myco_flutter/constants/app_assets.dart';
import 'package:myco_flutter/core/utils/language_manager.dart';
import 'package:myco_flutter/features/sign_in/presentation/pages/select_custom_dialog.dart';
import 'package:myco_flutter/widgets/custom_text_field_new.dart';

Widget buildCustomSelector({
  required BuildContext context,
  required String label,
  required String selectedId,
  required String selectedName,
  required List<String> optionIds,
  required List<String> optionNames,
  required void Function(String id, String name) onSelected,
  required String defaultLabelKey,
  required String prefixIcon, // icon path
  bool isRequired = true,
}) {
  final String defaultValue = getDefaultLabel(defaultLabelKey);
  final bool isDefault = selectedName == defaultValue;

  return FormField<String>(
    validator: (val) {

      if (defaultLabelKey == 'branch' && optionIds.isEmpty) {
        Fluttertoast.showToast(msg: 'No branch found.', backgroundColor: Colors.redAccent, textColor: Colors.white,);
        return;
      } else if (defaultLabelKey == 'department' && optionIds.isEmpty) {
        Fluttertoast.showToast(msg: 'No department found.', backgroundColor: Colors.redAccent, textColor: Colors.white,);
        return;
      } else if (defaultLabelKey == 'sub department' && optionIds.isEmpty) {
        Fluttertoast.showToast(msg: 'No sub department found.', backgroundColor: Colors.redAccent, textColor: Colors.white,);
        return;
      } else if (defaultLabelKey == 'shift' && optionIds.isEmpty) {
        Fluttertoast.showToast(msg: 'No shift found.', backgroundColor: Colors.redAccent, textColor: Colors.white,);
        return;
      } else if (defaultLabelKey == 'designation' && optionIds.isEmpty) {
        Fluttertoast.showToast(msg: 'No designation found.', backgroundColor: Colors.redAccent, textColor: Colors.white,);
        return;
      }

      return null;
    },
    builder: (field) => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        NewTextField(
          label: label,
          prefixIconPath: prefixIcon,
          suffixIconPath: AppAssets.downArrow,
          hintText: LanguageManager().get('select'),
          isRequired: isRequired,
          controller: TextEditingController(text: selectedName),
          onTap: () {
            if (optionIds.isEmpty) {
              Fluttertoast.showToast(
                msg: 'No ${defaultLabelKey.replaceAll('_', ' ')} found.',
                backgroundColor: Colors.redAccent,
                textColor: Colors.white,
              );
              return;
            }
            _showSelectionDialog(
              context: context,
              optionId: optionIds,
              optionName: optionNames,
              selectedValue: selectedId,
              title: defaultLabelKey[0].toUpperCase() + defaultLabelKey.substring(1),
              onSelected: (id, name) {
                onSelected(id, name);
                field.didChange(name);
              },
            );
          },
        ),
        if (field.hasError)
          Padding(
            padding: const EdgeInsets.only(left: 12.0, top: 4.0),
            child: Text(
              field.errorText ?? '',
              style: const TextStyle(
                color: Colors.red,
                fontSize: 12,
              ),
            ),
          ),
      ],
    ),
  );
}

void _showSelectionDialog({
  required BuildContext context,
  required List<String> optionId,
  required List<String> optionName,
  required String? selectedValue,
  required String title,
  required void Function(String selectedId, String selectedName) onSelected,
}) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    backgroundColor: Colors.white,
    builder: (BuildContext context) => SelectCustomDialog(
      optionIds: optionId,
      optionNames: optionName,
      selectedId: selectedValue,
      title: title,
      onSelected: onSelected,
    ),
  );
}

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
