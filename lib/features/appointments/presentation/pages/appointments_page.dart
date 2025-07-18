import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
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

  void _onTabChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
    
    if(index == 0) {
      Fluttertoast.showToast(msg: 'request appointment');
    } else {
      Fluttertoast.showToast(msg: 'my appointments');

    }
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
  Widget build(BuildContext context) => Scaffold(
    appBar: const CustomAppbar(title: 'Appointments'),
    body: Padding(
      padding: EdgeInsets.all(13 * Responsive.getResponsive(context)),
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
            onTabChange: _onTabChanged,
          ),
          SizedBox(height: 21 * Responsive.getResponsive(context)),
          const CustomSearchField(hintText: 'Search'),
          SizedBox(height: 17 * Responsive.getResponsive(context)),
          Expanded(
              child: PageView(
                controller: pageController,
                onPageChanged: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });
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
      actions: [],
    ),
  );
}
