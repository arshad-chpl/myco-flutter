import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/widgets/custom_text_radio_button.dart';

class VisitTypeSelector extends StatefulWidget {
  final String initialSelection;
  final ValueChanged<String> onChanged;

  const VisitTypeSelector({
    required this.initialSelection,
    required this.onChanged,
    super.key,
  });

  @override
  _VisitTypeSelectorState createState() => _VisitTypeSelectorState();
}

class _VisitTypeSelectorState extends State<VisitTypeSelector> {
  late String selectedType;

  @override
  void initState() {
    super.initState();
    selectedType = widget.initialSelection;
  }

  void _updateSelection(String value) {
    setState(() {
      selectedType = selectedType == value ? '' : value;
    });
    widget.onChanged(selectedType);
  }

  Widget _buildOption(BuildContext context, String type) =>
      CustomTextRadioButton(
        gender: type,
        selectedGender: selectedType,
        onSelect: _updateSelection,
        height: 0.07 * Responsive.getHeight(context),
        width: 0.41 * Responsive.getWidth(context),
        leading: Padding(
          padding: EdgeInsets.only(
            left: 12 * Responsive.getResponsive(context),
          ),
          child: Radio<String>(
            value: type,
            groupValue: selectedType,
            activeColor: AppTheme.getColor(context).primary,
            onChanged: (val) {
              _updateSelection(val!);
            },
          ),
        ),
        customDecoration: BoxDecoration(
          color: selectedType == type
              ? AppTheme.getColor(context).surfaceContainer
              : AppTheme.getColor(context).onPrimary,
          border: Border.all(color: AppTheme.getColor(context).outline),
          borderRadius: BorderRadius.circular(
            10 * Responsive.getResponsive(context),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) => Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      _buildOption(context, 'Field Visit'),
      _buildOption(context, 'Virtual Visit'),
    ],
  );
}
