import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/leave/presentation/bloc/leave_bloc.dart';
import 'package:myco_flutter/features/leave/presentation/bloc/leave_event.dart';
import 'package:myco_flutter/features/leave/presentation/bloc/leave_state.dart';
import 'package:myco_flutter/features/leave/presentation/widgets/leave_balance_content.dart';
import 'package:myco_flutter/features/leave/presentation/widgets/leave_filter_bottom_sheet.dart';
import 'package:myco_flutter/widgets/custom_appbar.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button_theme.dart';

class MyLeaveBalanceScreen extends StatefulWidget {
  const MyLeaveBalanceScreen({super.key});

  @override
  State<MyLeaveBalanceScreen> createState() => _MyLeaveBalanceScreenState();
}

class _MyLeaveBalanceScreenState extends State<MyLeaveBalanceScreen> {
  late String selectedValue;
  late List<String> yearOptions;

  @override
  void initState() {
    super.initState();
    final currentYear = DateTime.now().year;
    selectedValue = currentYear.toString();
    yearOptions = [
      (currentYear - 1).toString(),
      currentYear.toString(),
      (currentYear + 1).toString(),
    ];
    _fetchLeaveList();
  }

  void _fetchLeaveList() {
    context.read<LeaveBloc>().add(FetchNewLeaveListType(selectedValue));
  }

  void _showYearFilter() {
    showLeaveFilterBottomSheet(context, selectedValue, (newYear) {
      setState(() {
        selectedValue = newYear;
        _fetchLeaveList();
      });
    }, yearOptions);
  }

  @override
  Widget build(BuildContext context) {
    Responsive.init(context);
    return Scaffold(
      appBar: CustomAppbar(
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.arrow_back_outlined),
        ),
        isKey: true,
        title: 'your_leaves',
        centerTitle: true,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: MyCoButton(
              backgroundColor: AppColors.secondary,
              borderColor: AppColors.secondary,
              onTap: _showYearFilter,
              textStyle: TextStyle(
                fontSize: 12 * Responsive.getResponsiveText(context),
                color: MyCoButtonTheme.whitemobileBackgroundColor,
              ),
              title: selectedValue,
              height: 0.035 * Responsive.getHeight(context),
              width: 0.2 * Responsive.getWidth(context),
              imagePosition: AxisDirection.right,
              image: const Icon(
                Icons.keyboard_arrow_down,
                color: MyCoButtonTheme.whitemobileBackgroundColor,
              ),
            ),
          ),
        ],
      ),
      body: BlocConsumer<LeaveBloc, LeaveState>(
        listener: (context, state) {
          if (state is LeaveError) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(SnackBar(content: Text(state.message)));
          } else if (state is CompOffLeavesFetched) {
            log(
              state.compOffLeaveResponseEntity.leaves.toString(),
              name: 'CompOffLeavesFetched',
            );
            if (state.compOffLeaveResponseEntity.leaves?.isEmpty ?? true) {
              Fluttertoast.showToast(
                msg: 'No leave data available',
                gravity: ToastGravity.BOTTOM,
              );
              _fetchLeaveList();
            }
          }
        },
        builder: (context, state) => LeaveBalanceContent(
          state: state,
          onRetry: _fetchLeaveList,
          onFetchLeaveList: _fetchLeaveList,
        ),
      ),
    );
  }
}
