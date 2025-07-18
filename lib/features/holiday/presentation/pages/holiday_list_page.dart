import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:myco_flutter/core/services/preference_manager.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/holiday/model/request/apply_optional_holiday.dart';
import 'package:myco_flutter/features/holiday/model/request/delete_optional_holiday.dart';
import 'package:myco_flutter/features/holiday/model/request/holiday_list_request_model.dart';
import 'package:myco_flutter/features/holiday/presentation/bloc/holiday_bloc.dart';
import 'package:myco_flutter/features/holiday/presentation/bloc/holiday_event.dart';
import 'package:myco_flutter/features/holiday/presentation/bloc/holiday_state.dart';
import 'package:myco_flutter/features/holiday/presentation/widgets/holiday_item_card.dart';
import 'package:myco_flutter/features/lost_and_found/presentation/widgets/text_field.dart';
import 'package:myco_flutter/widgets/custom_alert_dialog.dart';

class HolidayListPage extends StatefulWidget {
  final TextEditingController controller;

  const HolidayListPage({required this.controller, super.key});

  @override
  State<HolidayListPage> createState() => _HolidayListPageState();
}

class _HolidayListPageState extends State<HolidayListPage> {
  final ValueNotifier<DateTime> selectedDateNotifier = ValueNotifier<DateTime>(
    DateTime.now(),
  );
  final ScrollController _scrollController = ScrollController();
  final sl = GetIt.instance;
  final preferenceManager = GetIt.I<PreferenceManager>();
  final List<Color> backgroundColors = const [
    Color(0xFF2F648E),
    Color(0xFF2FBBA4),
    Color(0xFF08A4BB),
    Color(0xFFFFC026),
    Color(0xFFDCA7A7),
  ];

  Future<void> fetchHolidays(BuildContext context, DateTime date) async {
    final year = DateFormat('yyyy').format(date);

    final companyId = await preferenceManager.getCompanyId();
    final userId = preferenceManager.getUserId();

    final fetchListModel = HolidayListRequestModel(
      companyId: companyId ?? '',
      languageId: '1',
      unitId: '1',
      userId: userId,
      blockId: '1',
      floorId: '1',
      levelId: '1',
      year: year,
    );
    context.read<HolidayBloc>().add(FetchHolidayList(fetchListModel));
  }

  void scrollToUpcomingHoliday(List holidays) {
    final now = DateTime.now();
    for (int i = 0; i < holidays.length; i++) {
      final date = holidays[i].holidayStartDate;
      if (date != null && date.isAfter(now)) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          _scrollController.animateTo(
            i * 126.5,
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeInOut,
          );
        });
        break;
      }
    }
  }

  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (_) => sl<HolidayBloc>(),
    child: ValueListenableBuilder<DateTime>(
      valueListenable: selectedDateNotifier,
      builder: (context, currentDate, _) {
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
                  controller: widget.controller,
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
                              fontSize:
                                  18 * Responsive.getResponsiveText(context),
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

                        scrollToUpcomingHoliday(holidays);

                        return ListView.builder(
                          controller: _scrollController,
                          itemCount: holidays.length,
                          itemBuilder: (context, index) {
                            final holiday = holidays[index];

                            return HolidayItemCard(
                              holiday: holiday,
                              index: index,
                              backgroundColors: backgroundColors,
                              context: context,
                              onApplyTap: () {
                                final blocContext = context;

                                showModalBottomSheet(
                                  context: context,
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  builder: (context) => Padding(
                                    padding: EdgeInsets.only(
                                      bottom: MediaQuery.of(
                                        context,
                                      ).viewInsets.bottom,
                                    ),
                                    child: CustomAlertDialog(
                                      alertType: AlertType.defaultType,
                                      content:
                                          'Are you sure you want to apply for optional leave?',
                                      cancelText: 'Cancel',
                                      confirmText: 'OK',
                                      onConfirm: () async {
                                        Navigator.of(context).pop();
                                        final holidayId =
                                            holidays[index].holidayId ?? '';
                                        final optionalHolidayAssignId =
                                            holidays[index]
                                                .optionalHolidayAssignId ??
                                            '';
                                        final companyId = await preferenceManager.getCompanyId();
                                        final userId = preferenceManager.getUserId();

                                        final model = ApplyOptionalHoliday(
                                          companyId: companyId ?? '',
                                          userId: userId,
                                          holidayId: holidayId,
                                          optionalHolidayAssignId:
                                              optionalHolidayAssignId,
                                        );

                                        blocContext.read<HolidayBloc>().add(
                                          ApplyHolidayEvent(model,),
                                        );
                                      },
                                      onCancel: () =>
                                          Navigator.of(context).pop(),
                                    ),
                                  ),
                                );
                              },
                              onDeleteTap: () {
                                final blocContext = context;

                                showModalBottomSheet(
                                  context: context,
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  builder: (context) => Padding(
                                    padding: EdgeInsets.only(
                                      bottom: MediaQuery.of(
                                        context,
                                      ).viewInsets.bottom,
                                    ),
                                    child: CustomAlertDialog(
                                      alertType: AlertType.defaultType,
                                      content:
                                          'Are you sure you want to delete optional leave?',
                                      cancelText: 'Cancel',
                                      confirmText: 'OK',
                                      onConfirm: () async {
                                        Navigator.of(context).pop();
                                        final optionalHolidayAssignId =
                                            holidays[index]
                                                .optionalHolidayAssignId ??
                                            '';
                                        final companyId = await preferenceManager.getCompanyId();
                                        final userId = preferenceManager.getUserId();

                                        final model = DeleteOptionalHoliday(
                                          companyId: companyId ?? '',
                                          userId: userId,
                                          optionalHolidayAssignId:
                                              optionalHolidayAssignId,
                                        );

                                        blocContext.read<HolidayBloc>().add(
                                          DeleteHolidayEvent(model),
                                        );
                                      },
                                      onCancel: () =>
                                          Navigator.of(context).pop(),
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        );
                      } else if (state is HolidayApplied) {
                        Fluttertoast.showToast(
                          msg: state.response.message ?? '',
                        );
                        fetchHolidays(context, selectedDateNotifier.value);
                      } else if (state is HolidayDeleted) {
                        Fluttertoast.showToast(
                          msg: state.response.message ?? '',
                        );
                        fetchHolidays(context, selectedDateNotifier.value);
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
