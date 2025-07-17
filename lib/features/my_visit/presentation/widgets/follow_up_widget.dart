import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myco_flutter/constants/app_assets.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/widgets/custom_labeled_dropdown.dart';

class FollowUpWidget extends StatelessWidget {
  const FollowUpWidget({
    required this.visitTimes, required this.selectedVisitTime, required this.visitDates, required this.selectedVisitDate, super.key,
  });

  final List<String> visitTimes;
  final String? selectedVisitTime;
  final List<String> visitDates;
  final String? selectedVisitDate;

  @override
  Widget build(BuildContext context) => Row(
    children: [
      LabeledDropdown(
        label: 'Follow Up Visit Time',
        items: visitTimes,
        width: 0.41 * Responsive.getWidth(context),
        hintText: 'Select',
        border: BoxBorder.all(color: AppTheme.getColor(context).outline),
        prefix: SvgPicture.asset(AppAssets.assetClock, fit: BoxFit.scaleDown),
        itemToString: (item) => item,
        useRadioList: true,
        selectedItem: selectedVisitTime,
        onChanged: (value, index) {},
      ),
      SizedBox(width: 0.04 * Responsive.getWidth(context)),

      // Date Dropdown
      LabeledDropdown(
        label: 'Follow Up Visit Date',
        items: visitDates,
        width: 0.41 * Responsive.getWidth(context),
        hintText: 'Select',
        border: BoxBorder.all(color: AppTheme.getColor(context).outline),
        prefix: SvgPicture.asset(
          AppAssets.assetNoteFavorite,
          fit: BoxFit.scaleDown,
        ),
        itemToString: (item) => item,
        useRadioList: true,
        selectedItem: selectedVisitDate,
        onChanged: (value, index) {},
      ),
    ],
  );
}
