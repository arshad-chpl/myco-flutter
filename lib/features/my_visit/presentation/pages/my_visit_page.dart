import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/my_visit/presentation/bloc/visit_bloc.dart';
import 'package:myco_flutter/features/my_visit/presentation/widgets/auto_expense_card.dart';
import 'package:myco_flutter/features/my_visit/presentation/widgets/build_other_employee_visit_tab.dart';
import 'package:myco_flutter/features/my_visit/presentation/widgets/custom_visit_calender.dart';
import 'package:myco_flutter/features/my_visit/presentation/widgets/my_visit_tab.dart';
import 'package:myco_flutter/features/my_visit/presentation/widgets/visit_card.dart';
import 'package:myco_flutter/widgets/custom_appbar.dart';
import 'package:myco_flutter/widgets/custom_myco_tabbar.dart';
import 'package:myco_flutter/widgets/custom_text.dart';
import 'package:myco_flutter/widgets/floating_action_btn.dart';


class MyVisitPage extends StatelessWidget {
   MyVisitPage({super.key});

  String formattedDate(DateTime selectedDate) =>
      '${selectedDate.day} ${monthName(selectedDate.month)}, ${selectedDate.year}';

  final List<Map<String, dynamic>> visitList = [
  // 1st Visit - Simple Visit
  {
    'title': 'Mahakali Tractor ( RT4567 )',
    'time': '01st April, 2025(09:45 AM) TO 01st April, 2025(12:45 PM)',
    'status': 'Visit Not Started',
    'showExtraButtons': false,
    'details': {
      'Visit': 'Physical',
      'Visit Status': 'Approved',
      'Address':
      '101 Sanand - Sarkhej Rd, Makarba, Ahmedabad\nSarkhej-Okaf, Gujarat, 382421, India'
          '\n(You are in Range)',
    },
    'showWhatsapp': true,
    'showShare': true,
    'showDelete': true,
  },

  // 2nd Visit - Simple Visit
  {
    'title': 'Rajdeep Implements ( RJ2020 )',
    'time': '02nd April, 2025(10:00 AM) TO 02nd April, 2025(01:00 PM)',
    'status': 'Visit Not Started',
    'showExtraButtons': false,
    'details': {
      'Visit': 'Demo',
      'Visit Status': 'Pending',
      'Address': 'Plot 22, Phase-3 GIDC, Vatva, Ahmedabad, Gujarat, 382445',
    },
    'showWhatsapp': true,
    'showShare': true,
    'showDelete': true,
  },

  // 3rd Visit - Show Add Expense
  {
    'title': 'Special Customer ( SC2025 )',
    'time': '03rd April, 2025(11:00 AM) TO 03rd April, 2025(02:00 PM)',
    'status': 'Visit Not Started',
    'showExtraButtons': true,
    'showEndAndOrderButtons': true,
    'details': {
      'Visit': 'Service',
      'Visit Status': 'Approved',
      'Address': 'SG Highway, Near Infocity, Gandhinagar, Gujarat',
    },
    'showWhatsapp': true,
    'showShare': true,
  },

  // 4th Visit - Show END VISIT & TAKE ORDER buttons
  {
    'title': 'Final Customer ( FC2025 )',
    'time': '05th April, 2025(03:00 PM) TO 05th April, 2025(05:00 PM)',
    'status': 'Visit Started',
    'showExtraButtons': true,
    'showStartedVisit': true,
    'isOutOfRange': true,
    'showImage': true,
    'showEndAndOrderButtons': true,
    'details': {
      'Visit': 'Installation',
      'Visit Status': 'Approved',
      'Address': 'Bapunagar, Ahmedabad, Gujarat - 380024',
    },
    'showWhatsapp': true,
    'showShare': true,
  },

  // 5th Visit - Show Add Expense but hide TAKE ORDER
  {
    'title': 'Hidden Buttons Visit ( HB2025 )',
    'time': '06th April, 2025(11:00 AM) TO 06th April, 2025(02:00 PM)',
    'status': 'Visit Not Started',
    'showExtraButtons': true,
    'showStartedVisit': false,
    'isOutOfRange': true,
    'hideOrderButtons': true,
    'showImage': true,
    'details': {
      'Visit': 'Service',
      'Visit Status': 'Approved',
      'Address':
      '101 Sanand - Sarkhej Rd, Makarba, Ahmedabad\nSarkhej-Okaf, Gujarat, 382421, India',
    },
    'showWhatsapp': true,
    'showShare': true,
    'showDelete': true,
  },

  // 6th Visit - End Visit Requested UI
  {
    'title': 'Late Visit End ( LV2025 )',
    'time': '07th April, 2025(01:30 PM) TO 07th April, 2025(03:30 PM)',
    'status': 'Visit Started',
    'showExtraButtons': true,
    'showStartedVisit': true,
    'isOutOfRange': true,
    'showImage': true,
    'hideOrderButtons': true,
    'isSixthContainer': true,
    'forgotToEndVisit' : true,
    'details': {
      'Visit': 'Inspection',
      'Visit Status': 'Approved',
      'Address':
      '101 Sanand - Sarkhej Rd, Makarba, Ahmedabad\nSarkhej-Okaf, Gujarat, 382421, India',
    },
    'showWhatsapp': true,
    'showShare': true,
  },

  // 7th Visit - Request sent, button hidden
  {
    'title': 'Late Visit End ( LV2025 )',
    'time': '07th April, 2025(01:30 PM) TO 07th April, 2025(03:30 PM)',
    'status': 'Visit Started',
    'showExtraButtons': true,
    'showStartedVisit': true,
    'isOutOfRange': true,
    'showImage': true,
    'hideOrderButtons': true,
    'isSixthContainer': true,
    'isSeventhContainer': true,
    'isEndVisitRequested': true,
    'requestedOn': '03:58 PM , 03 Jun 2025',
    'details': {
      'Visit': 'Inspection',
      'Visit Status': 'Approved',
      'Address':
      '101 Sanand - Sarkhej Rd, Makarba, Ahmedabad\nSarkhej-Okaf, Gujarat, 382421, India',
    },
    'showWhatsapp': true,
    'showShare': true,
  },

  // 8th Visit - Rejected End Visit Request
  {
    'title': 'Late Visit End ( LV2025 )',
    'time': '07th April, 2025(01:30 PM) TO 07th April, 2025(03:30 PM)',
    'status': 'Visit Started',
    'showExtraButtons': true,
    'showStartedVisit': true,
    'isOutOfRange': true,
    'showImage': true,
    'hideOrderButtons': true,
    'isSixthContainer': true,
    'isSeventhContainer': true,
    'isEighthContainer': true, // rejected state
    'requestedOn': '03:58 PM , 03 Jun 2025',
    'details': {

      'Visit': 'Inspection',
      'Visit Status': 'Approved',
      'Address': 'Maninagar, Ahmedabad, Gujarat',
    },
    'showWhatsapp': true,
    'showShare': true,
  },
];

  String monthName(int month) {
    const months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec',
    ];
    return months[month - 1];
  }

  @override
  Widget build(BuildContext context) {
    Responsive.init(context);

    return BlocBuilder<VisitBloc, VisitState>(
      builder: (context, state) {
        final selectedIndex = state is VisitLoaded ? state.selectedIndex : 0;
        final selectedDate = state is VisitLoaded ? state.selectedDate : DateTime.now();

        final Color tabBorderColor = selectedIndex == 0
            ? AppColors.primary
            : AppColors.secondary;

        return Scaffold(
          appBar: CustomAppbar(
            title: 'Visit',
            actions: [
              Padding(
                padding: EdgeInsets.only(
                  right: 12 * Responsive.getResponsiveText(context),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      'Latitude: 22.938088',
                      isKey: true,
                      fontSize: 10 * Responsive.getResponsiveText(context),
                      fontWeight: FontWeight.w600,
                      color: AppTheme.getColor(context).primary,
                    ),
                    CustomText(
                      'Longitude: 72.938088',
                      fontSize: 10 * Responsive.getResponsiveText(context),
                      fontWeight: FontWeight.w600,
                      color: AppTheme.getColor(context).primary,
                    ),
                  ],
                ),
              ),
            ],
          ),
          body: Column(
            children: [
              MyCustomTabBar(
                tabs: const ['My Visit', 'Other Employee Visit'],
                selectedIndex: selectedIndex,
                onTabChange: (index) {
                  context.read<VisitBloc>().add(TabChanged(index));
                },
                selectedBgColors: [
                  AppTheme.getColor(context).primary,
                  AppTheme.getColor(context).secondary,
                ],
                unselectedBorderAndTextColor: tabBorderColor,
                tabBarBorderColor: tabBorderColor,
                isShadowBottomLeft: true,
              ),
              Expanded(
                child: selectedIndex == 0
                    ? MyVisitTab(
                  searchController: TextEditingController(),
                  searchFocus: FocusNode(),
                  formattedDate: formattedDate(selectedDate),
                  goToPreviousDate: () =>
                      context.read<VisitBloc>().add(PreviousDate()),
                  goToNextDate: () =>
                      context.read<VisitBloc>().add(NextDate()),
                  selectDateFromPicker: () async {
                    final result =
                    await showModalBottomSheet<Map<String, int>>(
                      context: context,
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      builder: (_) => CustomVisitCupertinoDatePicker(
                        initialDate: selectedDate,
                      ),
                    );
                    if (result != null) {
                      final picked = DateTime(
                        result['year']!,
                        result['month']!,
                        result['day']!,
                      );
                      context
                          .read<VisitBloc>()
                          .add(UpdateSelectedDate(picked));
                    }
                  },
                  visitList: visitList,
                  buildVisitCard: buildVisitCard,
                  buildAutoExpenseCard: AutoExpenseCard(),
                )
                    : buildOtherEmployeeVisitTab(
                  context,
                  searchController: TextEditingController(),
                  searchFocus: FocusNode(),
                  formattedDate: formattedDate(selectedDate),
                  goToPreviousDate: () =>
                      context.read<VisitBloc>().add(PreviousDate()),
                  goToNextDate: () =>
                      context.read<VisitBloc>().add(NextDate()),
                  selectDateFromPicker: () async {
                    final result =
                    await showModalBottomSheet<Map<String, int>>(
                      context: context,
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      builder: (_) => CustomVisitCupertinoDatePicker(
                        initialDate: selectedDate,
                      ),
                    );
                    if (result != null) {
                      final picked = DateTime(
                        result['year']!,
                        result['month']!,
                        result['day']!,
                      );
                      context
                          .read<VisitBloc>()
                          .add(UpdateSelectedDate(picked));
                    }
                  },
                ),
              ),
            ],
          ),
          floatingActionButton: selectedIndex == 0
              ? ExpandableFab(
            openIcon: Icons.add,
            closeIcon: Icons.close,
            actions: [
              ExpandableFabAction(
                label: 'Add Visit',
                icon: Icons.location_on,
                onTap: () => context.pushNamed('add-visit'),
              ),
              ExpandableFabAction(
                label: 'Add Expense',
                icon: Icons.money,
                onTap: () => context.pushNamed('addExpense'),
              ),
            ],
            imageSize: 66 * Responsive.getResponsiveText(context),
            innericonsize: 20 * Responsive.getResponsiveText(context),
            circleavataradius: 22 * Responsive.getResponsiveText(context),
            innericonbgr: AppColors.white,
            margin: EdgeInsets.only(
              right: 10 * Responsive.getResponsiveText(context),
            ),
            padding: EdgeInsets.symmetric(
              horizontal: 14 * Responsive.getResponsiveText(context),
              vertical: 8 * Responsive.getResponsiveText(context),
            ),
          )
              : null,
        );
      },
    );
  }
}
