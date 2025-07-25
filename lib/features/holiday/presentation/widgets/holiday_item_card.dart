import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/holiday/domain/entities/holiday_list_response_entity.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';

class HolidayItemCard extends StatelessWidget {
  final HolidayEntity holiday;
  final int index;
  final List<Color> backgroundColors;
  final BuildContext context;
  final VoidCallback onApplyTap;
  final VoidCallback onDeleteTap;

  const HolidayItemCard({
    required this.holiday,
    required this.index,
    required this.backgroundColors,
    required this.context,
    required this.onApplyTap,
    required this.onDeleteTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final holidayDate =
        DateTime.tryParse(holiday.holidayStartDate ?? '') ?? DateTime.now();
    final backgroundColor = backgroundColors[index % backgroundColors.length];
    final isOptionalHoliday = holiday.holidayTypeOption == '2';
    final isApplied = holiday.alreadyAppliedHoliday == '1';
    final currentDate = DateTime.now();
    final isPastDate = holidayDate.isBefore(
      DateTime(currentDate.year, currentDate.month, currentDate.day),
    );
    final remainingOptional =
        int.tryParse(holiday.remainOptionalHoliday ?? '0') ?? 0;
    final canDelete = holiday.optionalHolidayAssignDeleteId != '0';

    final showApplyButton =
        isOptionalHoliday && !isPastDate && !isApplied && remainingOptional > 0;
    final showAppliedState = isOptionalHoliday && isApplied && canDelete;
    final hideAll =
        (!isOptionalHoliday || isPastDate) ||
        (remainingOptional == 0 && !canDelete);

    return Container(
      margin: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFF98A2B3)),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        children: [
          // Header
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: isPastDate ? const Color(0xFF999999) : backgroundColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(9),
                topRight: Radius.circular(9),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/visit_svgs/calendar.svg',
                      height: 24,
                      width: 24,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      DateFormat('dd MMM yyyy').format(holidayDate),
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20 * Responsive.getResponsiveText(context),
                      ),
                    ),
                  ],
                ),
                if (isOptionalHoliday && !isPastDate)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 7.0,
                      vertical: 2.0,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.green),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: const Text(
                      'Optional',
                      style: TextStyle(
                        fontSize: 8.0,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Gilroy',
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.right,
                    ),
                  ),
              ],
            ),
          ),

          // Body
          Container(
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: holiday.holidayIcon != null
                      ? Image.network(
                          holiday.holidayIcon!,
                          height: 50,
                          width: 50,
                          fit: BoxFit.cover,
                        )
                      : Image.asset(
                          'assets/search_society/contact_admin.png',
                          height: 50,
                          width: 50,
                          fit: BoxFit.cover,
                        ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        holiday.holidayName ?? '',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20 * Responsive.getResponsiveText(context),
                        ),
                      ),
                      Text(
                        holiday.holidayDay ?? '',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                          fontSize: 16 * Responsive.getResponsiveText(context),
                        ),
                      ),
                    ],
                  ),
                ),
                if (!hideAll)
                  Row(
                    children: [
                      if (showApplyButton)
                        MyCoButton(
                          onTap: onApplyTap,
                          title: 'Apply',
                          textStyle: TextStyle(
                            fontFamily: 'Gilroy-semiBold',
                            fontSize:
                                14 * Responsive.getResponsiveText(context),
                            color: AppTheme.getColor(context).onPrimary,
                          ),
                          width: 0.26 * Responsive.getWidth(context),
                          height: 36,
                          boarderRadius: 8,
                          borderColor: const Color(0xFF08A4BB),
                          backgroundColor: const Color(0xFF08A4BB),
                          isShadowBottomLeft: true,
                        ),
                      if (showAppliedState) ...[
                        MyCoButton(
                          onTap: () {},
                          title: 'Applied',
                          textStyle: TextStyle(
                            fontFamily: 'Gilroy-semiBold',
                            fontSize:
                                14 * Responsive.getResponsiveText(context),
                            color: AppTheme.getColor(context).onPrimary,
                          ),
                          width: 0.26 * Responsive.getWidth(context),
                          height: 36,
                          boarderRadius: 8,
                          borderColor: const Color(0xFF2FBBA4),
                          backgroundColor: const Color(0xFF2FBBA4),
                          isShadowBottomLeft: true,
                        ),
                        const SizedBox(width: 8),
                        InkWell(
                          onTap: onDeleteTap,
                          child: const Icon(
                            Icons.delete_outline,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ],
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
