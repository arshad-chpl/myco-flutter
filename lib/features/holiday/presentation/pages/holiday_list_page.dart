import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/holiday/presentation/bloc/holiday_bloc.dart';
import 'package:myco_flutter/features/holiday/presentation/bloc/holiday_event.dart';
import 'package:myco_flutter/features/holiday/presentation/bloc/holiday_state.dart';
import 'package:myco_flutter/features/lost_and_found/presentation/widgets/text_field.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';

class HolidayListPage extends StatelessWidget {
  final TextEditingController controller;

  HolidayListPage({super.key, required this.controller});

  final List<Color> backgroundColors = [
    const Color(0xFF2F648E),
    const Color(0xFF2FBBA4),
    const Color(0xFF08A4BB),
    const Color(0xFFFFC026),
    const Color(0xFFDCA7A7),
  ];

  @override
  Widget build(BuildContext context) {
    final selectedDateNotifier = ValueNotifier<DateTime>(DateTime.now());
    final sl = GetIt.instance;

    void fetchHolidays(BuildContext context, DateTime date) {
      final year = DateFormat('yyyy').format(date);
      context.read<HolidayBloc>().add(FetchHolidayList(year));
    }

    return BlocProvider(
      create: (_) => sl<HolidayBloc>(),
      child: ValueListenableBuilder<DateTime>(
        valueListenable: selectedDateNotifier,
        builder: (context, currentDate, _) {
          // Trigger fetch on date change
          WidgetsBinding.instance.addPostFrameCallback((_) {
            fetchHolidays(context, currentDate);
          });

          return Scaffold(
            appBar: AppBar(
              leading: const BackButton(),
              title: const Text('Holiday'),
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: Column(
                children: [
                  MyCoTextField(
                    controller: controller,
                    preFixImage: 'assets/lost_and_found/search-normal.png',
                    hintText: 'Search',
                    border: Border.all(color: AppTheme.getColor(context).outline),
                    typingtextStyle: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontFamily: 'Gilroy-Medium',
                      fontSize: 20 * Responsive.getResponsiveText(context),
                    ),
                    hintTextStyle: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontFamily: 'Gilroy-Medium',
                      fontSize: 20 * Responsive.getResponsiveText(context),
                      color: AppTheme.getColor(context).outline,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          selectedDateNotifier.value = DateTime(
                            currentDate.year - 1,
                            currentDate.month,
                          );
                        },
                        icon: const Icon(Icons.arrow_left),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              DateFormat('MMMM, yyyy').format(currentDate),
                              style: TextStyle(
                                fontSize: 18 * Responsive.getResponsiveText(context),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Icon(
                              Icons.arrow_drop_down,
                              size: 24,
                              color: Colors.black,
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          selectedDateNotifier.value = DateTime(
                            currentDate.year + 1,
                            currentDate.month,
                          );
                        },
                        icon: const Icon(Icons.arrow_right),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: BlocBuilder<HolidayBloc, HolidayState>(
                      builder: (context, state) {
                        if (state is HolidayLoading) {
                          return const Center(child: CircularProgressIndicator());
                        } else if (state is HolidayListLoaded) {
                          final holidays = state.holidays;
                          if (holidays.isEmpty) {
                            return const Center(child: Text('No holidays found'));
                          }

                          return ListView.builder(
                            itemCount: holidays.length,
                            itemBuilder: (context, index) {
                              final holiday = holidays[index];
                              final backgroundColor =
                              backgroundColors[index % backgroundColors.length];
                              final isApplied = holiday.alreadyAppliedHoliday == "true";

                              return Container(
                                margin: const EdgeInsets.only(top: 10),
                                decoration: BoxDecoration(
                                  border: Border.all(color: const Color(0xFF98A2B3)),
                                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                                ),
                                child: Column(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        color: index == 0
                                            ? const Color(0xFF999999)
                                            : backgroundColor,
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(9),
                                          topRight: Radius.circular(9),
                                        ),
                                      ),
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          SvgPicture.asset(
                                            'assets/visit_svgs/calendar.svg',
                                            height: 24,
                                            width: 24,
                                          ),
                                          const SizedBox(width: 10),
                                          Text(
                                            DateFormat('d MMM yyyy').format(
                                                holiday.holidayStartDate ?? DateTime.now()),
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize:
                                              20 * Responsive.getResponsiveText(context),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
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
                                            child: Image.asset(
                                              holiday.holidayIcon ??
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
                                                    fontSize: 20 *
                                                        Responsive.getResponsiveText(context),
                                                  ),
                                                ),
                                                Text(
                                                  holiday.holidayDay ?? '',
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.normal,
                                                    fontSize: 16 *
                                                        Responsive.getResponsiveText(context),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                            child: MyCoButton(
                                              onTap: () {
                                                if (!isApplied) {
                                                  context.read<HolidayBloc>().add(
                                                      ApplyHolidayEvent(
                                                          holiday.holidayId ?? ''));
                                                }
                                              },
                                              title: isApplied ? 'Applied' : 'Apply',
                                              textStyle: TextStyle(
                                                fontFamily: 'Gilroy-semiBold',
                                                fontSize:
                                                14 * Responsive.getResponsiveText(context),
                                                color: AppTheme.getColor(context).onPrimary,
                                              ),
                                              width: 0.26 * Responsive.getWidth(context),
                                              height: 36,
                                              boarderRadius: 8,
                                              borderColor: isApplied
                                                  ? const Color(0xFF2FBBA4)
                                                  : const Color(0xFF08A4BB),
                                              backgroundColor: isApplied
                                                  ? const Color(0xFF2FBBA4)
                                                  : const Color(0xFF08A4BB),
                                              isShadowBottomLeft: true,
                                            ),
                                          ),
                                          if (isApplied)
                                            InkWell(
                                              onTap: () {
                                                context.read<HolidayBloc>().add(
                                                  DeleteHolidayEvent(
                                                      holiday.optionalHolidayAssignId ?? ''),
                                                );
                                              },
                                              child: const Icon(
                                                Icons.delete_outline,
                                                color: Colors.red,
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        } else if (state is HolidayError) {
                          return Center(child: Text(state.message));
                        }
                        return const SizedBox.shrink();
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
