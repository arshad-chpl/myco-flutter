import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/appointments/presentation/bloc/appointment_bloc.dart';
import 'package:myco_flutter/features/appointments/presentation/bloc/appointment_event.dart';
import 'package:myco_flutter/features/appointments/presentation/bloc/appointment_state.dart';
import 'package:myco_flutter/features/appointments/presentation/widgets/appointment_request_list_view_widget.dart';
import 'package:myco_flutter/features/appointments/presentation/widgets/my_appointments_list_view_widgets.dart';
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
  int _selectedIndex = 0;
  late PageController pageController;

  void onTabChanged(BuildContext context, int index) {
    context.read<AppointmentBloc>().add(AppointmentTabChange(tabIndex: index));
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
    );

    Fluttertoast.showToast(
      msg: index == 0 ? 'request appointment' : 'my appointments',
    );
  }

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: _selectedIndex);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => BlocBuilder<AppointmentBloc, AppointmentState>(
      builder: (context, state) {
        int currentIndex = 0;
        if(state is AppointmentLoaded) {
          currentIndex = state.selectIndex;
        }

        _selectedIndex = currentIndex;

        return Scaffold(
          appBar: const CustomAppbar(title: 'Appointments'),
          body: Padding(
            padding: EdgeInsets.all(23 * Responsive.getResponsive(context)),
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
                  selectedIndex: _selectedIndex,
                  onTabChange: (index) => onTabChanged(context, index),
                ),
                SizedBox(height: 21 * Responsive.getResponsive(context)),
                const CustomSearchField(hintText: 'Search'),
                SizedBox(height: 17 * Responsive.getResponsive(context)),
                Expanded(
                    child: PageView(
                      controller: pageController,
                      physics: const NeverScrollableScrollPhysics(),
                      onPageChanged: (index) {
                        context.read<AppointmentBloc>().add(AppointmentTabChange(tabIndex: index));
                      },
                      children: const [
                        AppointmentRequestListViewWidget(),
                        MyAppointmentsListViewWidgets()
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
