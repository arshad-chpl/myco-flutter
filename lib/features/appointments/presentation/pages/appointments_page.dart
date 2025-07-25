import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:myco_flutter/constants/constants.dart';
import 'package:myco_flutter/core/services/preference_manager.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/appointments/data/models/request/get_appointment_request_model.dart';
import 'package:myco_flutter/features/appointments/data/models/request/get_my_appointments_request_model.dart';
import 'package:myco_flutter/features/appointments/presentation/bloc/appointment_bloc.dart';
import 'package:myco_flutter/features/appointments/presentation/bloc/appointment_event.dart';
import 'package:myco_flutter/features/appointments/presentation/bloc/appointment_state.dart';
import 'package:myco_flutter/features/appointments/presentation/widgets/appointment_requests.dart';
import 'package:myco_flutter/features/appointments/presentation/widgets/my_appointments.dart';
import 'package:myco_flutter/widgets/custom_appbar.dart';
import 'package:myco_flutter/widgets/custom_myco_tabbar.dart';
import 'package:myco_flutter/widgets/custom_searchfield.dart';
import 'package:myco_flutter/widgets/floating_action_btn.dart';

class AppointmentsPage extends StatefulWidget {
  const AppointmentsPage({super.key});

  @override
  State<AppointmentsPage> createState() => _AppointmentsPageState();
}

class _AppointmentsPageState extends State<AppointmentsPage> {
  List<String> appointments = ['Requests', 'My Appointments'];
  late PageController pageController;
  late PreferenceManager preferenceManager;

  @override
  void initState() {
    super.initState();

    preferenceManager = GetIt.I<PreferenceManager>();

    final initialTabIndex = context.read<AppointmentBloc>().state.tabIndex;
    pageController = PageController(initialPage: initialTabIndex);

    // pageController = PageController(initialPage:  context.read<AppointmentBloc>().state.tabIndex);

    fetchDataForTab(initialTabIndex);

    context.read<AppointmentBloc>().stream.listen((state) {
      if (pageController.hasClients && pageController.page?.round() != state.tabIndex) {
        pageController.jumpToPage(state.tabIndex);
      }
    });
  }

  void onTabChanged(BuildContext context, int index) {
    context.read<AppointmentBloc>().add(AppointmentTabChange(tabIndex: index));
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
    );

    fetchDataForTab(index);
  }

  Future<void> fetchDataForTab(int tabIndex) async {
    final userId = await preferenceManager.getUserId();
    final companyId = await preferenceManager.getCompanyId();
    final languageId = await preferenceManager.getLanguageId();

    if (tabIndex == 0) { // Requests Tab
      context.read<AppointmentBloc>().add(
        GetAppointmentEvent(
          GetAppointmentRequestModel(
            getAppointments: 'getAppointments',
            userId: userId,
            companyId: companyId,
            languageId: languageId,
          ),
        ),
      );
    } else { // My Appointments Tab (tabIndex == 1)
      context.read<AppointmentBloc>().add(
        GetMyAppointmentEvent(
          GetMyAppointmentsRequestModel(
            getMyAppointments: 'getMyAppointments',
            userId: userId,
            companyId: companyId,
            languageId: languageId,
          ),
        ),
      );
    }
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => BlocBuilder<AppointmentBloc, AppointmentState>(
      builder: (context, state) {
        final int selectedIndex = state.tabIndex;

        if (pageController.hasClients && pageController.page?.round() != selectedIndex) {
          pageController.jumpToPage(selectedIndex);
        }

        return Scaffold(
          appBar: const CustomAppbar(title: 'Appointments'),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: VariableBag.screenHorizontalPadding * Responsive.getResponsive(context)),
            child: Column(
              children: [
                MyCustomTabBar(
                  tabs: appointments,
                  selectedBgColors: [
                    AppTheme.getColor(context).primary,
                    AppTheme.getColor(context).secondary,
                  ],
                  unselectedBorderAndTextColor: AppTheme.getColor(context).secondary,
                  tabBarBorderColor: AppTheme.getColor(context).primary,
                  isShadowBottomLeft: true,
                  selectedIndex: selectedIndex,
                  onTabChange: (index) => onTabChanged(context, index),
                ),
                SizedBox(height: VariableBag.tabBarAfterSpace * Responsive.getResponsive(context)),
                const CustomSearchField(hintText: 'Search'),
                SizedBox(height: VariableBag.searchFiledAfterSpace * Responsive.getResponsive(context)),
                Expanded(
                    child: PageView(
                      controller: pageController,
                      physics: const NeverScrollableScrollPhysics(),
                      // onPageChanged: (index) {
                      //   context.read<AppointmentBloc>().add(AppointmentTabChange(tabIndex: index));
                      // },
                      children: const [
                        AppointmentRequests(),
                        MyAppointments()
                      ],
                    )
                )
              ],
            ),
          ),
          floatingActionButton: ExpandableFab(
            innericonsize: 30 * Responsive.getResponsive(context),
            imageSize: 50 * Responsive.getResponsive(context),
            onTap: () {
              context.pushNamed('/');
            },
            openIcon: Icons.add,
            closeIcon: Icons.close,
            actions: const [],
          ),
        );
      },
  );
}
