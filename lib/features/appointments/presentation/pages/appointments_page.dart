import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/features/asset/widgets/custom_tab_bar.dart';
import 'package:myco_flutter/widgets/custom_appbar.dart';

class AppointmentsPage extends StatefulWidget {
  const AppointmentsPage({super.key});

  @override
  State<AppointmentsPage> createState() => _AppointmentsPageState();
}

class _AppointmentsPageState extends State<AppointmentsPage> {

  List<String> appointments = ['Requests', 'My Appointments'];

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: const CustomAppbar(
        title: 'Appointments',
      ),
      body: Column(
        children: [
          MyCustomTabBar(
              tabs: appointments,
              selectedBgColor: AppTheme.getColor(context).primary,
              unselectedBorderAndTextColor: AppTheme.getColor(context).secondary,
              tabBarBorderColor: AppTheme.getColor(context).primary,
          ),
        ],
      ),
    );
}
