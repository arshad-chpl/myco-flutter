import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/widgets/custom_text_radio_button.dart';

class YesOrNoButtonWidget extends StatefulWidget {
  final String initialGender;
  final ValueChanged<String> onChanged;

  const YesOrNoButtonWidget({
    required this.initialGender, required this.onChanged, super.key,
  });

  @override
  _YesOrNoButtonWidgetState createState() => _YesOrNoButtonWidgetState();
}

class _YesOrNoButtonWidgetState extends State<YesOrNoButtonWidget> {
  late String selectedGender;

  @override
  void initState() {
    super.initState();
    selectedGender = widget.initialGender;
  }

  void _updateGender(String gender) {
    setState(() {
      selectedGender = gender;
    });
    widget.onChanged(gender);
  }

  @override
  Widget build(BuildContext context) => Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: ['Yes', 'No']
        .map(
          (gender) => CustomTextRadioButton(
            customDecoration: BoxDecoration(
              color: selectedGender == gender
                  ? AppTheme.getColor(context).surfaceContainer
                  : AppTheme.getColor(context).onPrimary,
              border: Border.all(color: AppTheme.getColor(context).outline),
              borderRadius: BorderRadius.circular(
                10 * Responsive.getResponsive(context),
              ),
            ),
            gender: gender,
            selectedGender: selectedGender,
            onSelect: _updateGender,
            height: 0.07 * Responsive.getHeight(context),
            width: 0.41 * Responsive.getWidth(context),
          ),
        )
        .toList(),
  );
}
