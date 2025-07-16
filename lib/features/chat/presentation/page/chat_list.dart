import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/chat/presentation/bloc/chat_bloc.dart';
import 'package:myco_flutter/features/chat/presentation/widgets/chat_list_card.dart';
import 'package:myco_flutter/features/chat/presentation/widgets/select_group_employee.dart';
import 'package:myco_flutter/features/custom_bloc/tab-bar/bloc/tabbar_bloc.dart';
import 'package:myco_flutter/features/employees/presentation/pages/employees_screen.dart';
import 'package:myco_flutter/features/take_order/presentation/widgets/frequent_buy_card.dart';
import 'package:myco_flutter/widgets/custom_appbar.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_myco_tabbar.dart';
import 'package:myco_flutter/widgets/custom_text.dart';
import 'package:myco_flutter/widgets/custom_text_field.dart';

class ChatListScreen extends StatelessWidget {
  ChatListScreen({super.key});

  List<Widget> screens = [EmployeesChat(), EmployeesChat()];

  @override
  Widget build(BuildContext context) => Scaffold(
    floatingActionButton: FloatingActionButton(
      onPressed: () {},
      backgroundColor: AppTheme.getColor(context).primary,

      shape: const CircleBorder(),
      child: Image.asset(
        'assets/chat/message.png',
        color: AppTheme.getColor(context).onPrimary,
        width: 0.08 * Responsive.getWidth(context),
      ),
    ),
    appBar: CustomAppbar(
      title: CustomText(
        'Chat List',
        fontSize: 20 * Responsive.getResponsiveText(context),
        fontWeight: FontWeight.w700,
      ),
      titleSpacing: 10,
      actions: [
        MyCoButton(
          onTap: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              builder: (_) => BlocBuilder<ChatBloc, ChatState>(
                builder: (context, state) => const SelectGroupEmp(),
              ),
            );
          },
          title: 'Create new group +',
          textStyle: TextStyle(
            color: AppTheme.getColor(context).onPrimary,
            fontSize: 12 * Responsive.getResponsiveText(context),
          ),
          width: 0.33 * Responsive.getWidth(context),
          height: 0.028 * Responsive.getHeight(context),
          boarderRadius: 20 * Responsive.getResponsive(context),
          isShadowBottomLeft: true,
        ),
        SizedBox(width: 0.02 * Responsive.getWidth(context)),
      ],

      // padding: 0.02 * Responsive.getWidth(context),
    ),
    body: Container(
      padding: EdgeInsets.symmetric(
        horizontal: 0.06 * Responsive.getWidth(context),
      ),
      child: Column(
        children: [
          BlocBuilder<TabbarBloc, TabbarState>(
            builder: (context, state) {
              final selectedIndex = state is TabChangeState
                  ? state.selectedIndex
                  : 0;
              return MyCustomTabBar(
                tabs: const ['Employee', 'Group'],
                selectedBgColors: [
                  AppTheme.getColor(context).secondary,
                  AppTheme.getColor(context).primary,
                ],

                unselectedBorderAndTextColor: AppTheme.getColor(
                  context,
                ).onPrimary,
                tabBarBorderColor: AppTheme.getColor(context).onSurface,
                tabBarBackgroundColor: AppTheme.getColor(context).surface,
                isShadowBottomLeft: true,
                selectedIndex: selectedIndex,
                onTabChange: (index) {
                  // context.read<TakeOrderBloc>().add(
                  //   TabChangeEvent(index: index),
                  // );
                  context.read<TabbarBloc>().add(TabChangeEvent(index: index));
                },
              );
            },
          ),
          SizedBox(height: 0.02 * Responsive.getHeight(context)),
          Expanded(
            child: BlocBuilder<TabbarBloc, TabbarState>(
              builder: (context, state) {
                final selectedIndex = state is TabChangeState
                    ? state.selectedIndex
                    : 0;
                return screens[selectedIndex];
              },
            ),
          ),
        ],
      ),
    ),
  );
}

class EmployeesChat extends StatelessWidget {
  EmployeesChat({super.key});
  final List<Map<String, String>> groupMembers = [
    {
      'name': 'Vedant',
      'message': 'Let’s start the meeting',
      'time': '5 mins ago',
      'image': 'assets/chat/profile.jpg',
    },
    {
      'name': 'Anjali',
      'message': 'Shared the document',
      'time': '10 mins ago',
      'image': 'assets/chat/profile.jpg',
    },
    {
      'name': 'Mukund',
      'message': 'Got it',
      'time': '15 mins ago',
      'image': 'assets/chat/profile.jpg',
    },
  ];
  @override
  Widget build(BuildContext context) => BlocBuilder<ChatBloc, ChatState>(
    builder: (context, state) => Column(
      children: [
        MyCoTextfield(
          hintText: 'Search',
          hintTextStyle: AppTheme.getTextStyle(
            context,
          ).labelLarge!.copyWith(color: AppColors.textSecondary),
          prefix: Image.asset('assets/chat/search-icon.png', scale: 20),
          contentPadding: EdgeInsets.only(
            top: 0.012 * Responsive.getHeight(context),
          ),
          boarderRadius: 12 * Responsive.getResponsive(context),
          onChanged: (value) => {
            context.read<ChatBloc>().add(SearchEvent(value, groupMembers)),
            log(state.toString(), name: "state"),
          },
        ),
        SizedBox(height: 0.025 * Responsive.getHeight(context)),

        Expanded(
          child: ListView.separated(
            itemCount: state is SearchQueryState
                ? state.filteredList.length
                : groupMembers.length,
            itemBuilder: (context, index) {
              final member = state is SearchQueryState
                  ? state.filteredList[index]
                  : groupMembers[index];
              return ChatListCard(
                name: member['name']!,
                lastMessage: member['message']!,
                timeAgo: member['time']!,
                profileImagePath: member['image']!,
              );
            },
            separatorBuilder: (context, index) =>
                SizedBox(height: 0.015 * Responsive.getHeight(context)),
          ),
        ),
        SizedBox(height: 0.02 * Responsive.getHeight(context)),
        // SideBySideButtons(
        //   button1Name: 'Reset Cart',
        //   button2Name: 'Add Order',
        //   onTap1: () {},
        //   onTap2: () {
        //     context.pushNamed('order-summary');
        //   },
        // ),
        SizedBox(height: 0.02 * Responsive.getHeight(context)),
      ],
    ),
  );
}
