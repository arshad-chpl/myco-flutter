import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:myco_flutter/features/sign_in/presentation/pages/select_custom_dialog.dart';

Widget buildCustomSelector({
  required BuildContext context,
  required String label,
  required String selectedId,
  required String selectedName,
  required List<String> optionIds,
  required List<String> optionNames,
  required void Function(String id, String name) onSelected,
  required String defaultLabelKey,
  required String prefixIcon, // <- image path
}) {
  final String defaultValue = getDefaultLabel(defaultLabelKey);
  final bool isDefault = selectedName == defaultValue;

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
      ),
      GestureDetector(
        onTap: () {
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

          _showSelectionDialog(
            context: context,
            optionId: optionIds,
            optionName: optionNames,
            selectedValue: selectedId,
            title:
                defaultLabelKey[0].toUpperCase() + defaultLabelKey.substring(1),
            onSelected: (selectedId, selectedName) {
              onSelected(selectedId, selectedName);
            },
          );
        },
        child: AbsorbPointer(
          child: SizedBox(
            height: 75,
            child: TextFormField(
              readOnly: true,
              controller: TextEditingController(text: selectedName),
              style: TextStyle(
                color: isDefault ? Colors.black45 : Colors.black,
                fontSize: 16,
              ),
              decoration: InputDecoration(
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Image.asset(
                    prefixIcon,
                    width: 20,
                    height: 20,
                    fit: BoxFit.contain,
                  ),
                ),
                suffixIcon: const Icon(
                  Icons.arrow_drop_down,
                  color: Colors.black,
                ),
                hintText: defaultValue,
                hintStyle: const TextStyle(color: Colors.black45),
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 18,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                    color: Color(0xFFBDBDBD),
                    width: 1.2,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                    color: Color(0xFFBDBDBD),
                    width: 1.2,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                    color: Color(0xFF2F648E),
                    width: 1.2,
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                    color: Color(0xFFBDBDBD),
                    width: 1.2,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    ],
  );
}

//selection in all bottom dialog
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

//set default text field
String getDefaultLabel(String field) {
  switch (field) {
    case 'branch':
      return 'Select your Branch';
    case 'department':
      return 'Select Your Department';
    case 'sub department':
      return 'Select Sub Department';
    case 'shift':
      return 'Shift time';
    case 'designation':
      return 'Designation';
    default:
      return '';
  }
}
