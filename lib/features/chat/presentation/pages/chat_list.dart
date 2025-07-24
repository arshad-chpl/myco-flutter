import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:myco_flutter/core/router/route_paths.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/language_manager.dart';
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
import 'package:myco_flutter/widgets/custom_searchfield.dart';
import 'package:myco_flutter/widgets/custom_multiselect_bottomsheet.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_myco_tabbar.dart';
import 'package:myco_flutter/widgets/custom_searchfield.dart';
import 'package:myco_flutter/widgets/custom_simple_bottom_sheet.dart';
import 'package:myco_flutter/widgets/custom_text.dart';
import 'package:myco_flutter/widgets/custom_text_field.dart';
import 'package:myco_flutter/widgets/custom_text_field_new.dart';

class ChatListScreen extends StatelessWidget {
  ChatListScreen({super.key});

  List<Widget> screens = [EmployeesChat(), GroupChat()];

  @override
  Widget build(BuildContext context) => Scaffold(
    floatingActionButton: FloatingActionButton(
      onPressed: () {
        context.pushNamed('start-new-chat');
      },
      backgroundColor: AppTheme.getColor(context).primary,

      shape: const CircleBorder(),
      child: SvgPicture.asset(
        'assets/chat/message.svg',

        width: 0.08 * Responsive.getWidth(context),
      ),
    ),
    appBar: CustomAppbar(
      title: 'chat',
      titleSpacing: 10,
      actions: [
        MyCoButton(
          onTap: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              builder: (_) => BlocBuilder<ChatBloc, ChatState>(
                builder: (context, state) => SelectGroupEmp(),
              ),
            );
          },
          title: LanguageManager().get('new_group'),
          textStyle: TextStyle(
            color: AppTheme.getColor(context).onPrimary,
            fontSize: 14 * Responsive.getResponsiveText(context),
          ),
          image: Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: SvgPicture.asset('assets/chat/plus.svg'),
          ),
          imagePosition: AxisDirection.right,
          width: 0.35 * Responsive.getWidth(context),
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
                tabs: [
                  LanguageManager().get('resident'),
                  LanguageManager().get('group_colon'),
                ],
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
          SizedBox(height: 0.03 * Responsive.getHeight(context)),
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

class EmployeesChat extends StatefulWidget {
  EmployeesChat({super.key});

  @override
  State<EmployeesChat> createState() => _EmployeesChatState();
}

class _EmployeesChatState extends State<EmployeesChat> {

  @override
  void initState() {
    super.initState();
    context.read<ChatBloc>().add(GetChatListEvent());
  }
  // final List<Map<String, String>> groupMembers = [
  //   {
  //     'name': 'Vedant',
  //     'message': 'Let’s start the meeting',
  //     'time': '5 mins ago',
  //     'image': 'assets/chat/profile.jpg',
  //   },
  //   {
  //     'name': 'Anjali',
  //     'message': 'Shared the document',
  //     'time': '10 mins ago',
  //     'image': 'assets/chat/profile.jpg',
  //   },
  //   {
  //     'name': 'Mukund',
  //     'message': 'Got it',
  //     'time': '15 mins ago',
  //     'image': 'assets/chat/profile.jpg',
  //   },
  // ];

  @override
  Widget build(BuildContext context) =>Column(
      children: [
        BlocBuilder<ChatBloc, ChatState>(
          builder: (context, state) => CustomSearchField(
                  hintText: 'search_member',
                  onChanged: (value) => {
                    // context.read<ChatBloc>().add(SearchEvent(value, groupMembers)),
                    context.read<ChatBloc>().add(SearchEvent(value)),
                    log(state.toString(), name: "state"),
                  },
                ),
        ),
        SizedBox(height: 0.025 * Responsive.getHeight(context)),
        BlocBuilder<ChatBloc, ChatState>(
          builder: (context, state) {
            if (state is GetChatListLoadingState) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is GetChatListErrorState) {
              return Center(child: Text(state.message));
            }

            if (state is GetChatListSuccessState || state is SearchQueryState) {

              final chatList = state is GetChatListSuccessState ? state.chatList : null;

              return Expanded(
                  child: ListView.separated(
                    itemCount: state is SearchQueryState
                        ? state.filteredList.length
                        : chatList?.member?.length ?? 0,
                    itemBuilder: (context, index) {
                      final member = state is SearchQueryState
                          ? state.filteredList[index]
                          : chatList?.member?[index];
                      return ChatListCard(
                        name: member?.userFirstName ?? "",
                        lastMessage: member?.userLastName ?? "",
                        timeAgo: member?.memberDateOfBirth ?? "",
                        profileImagePath: member?.userProfilePic ?? "",
                      );
                    },
                    separatorBuilder: (context, index) =>
                        SizedBox(height: 30 * Responsive.getResponsive(context)),
                  ),
                );
            }
            return Center(child: Text('No Data Found'),);
          },
        ),
        SizedBox(height: 0.02 * Responsive.getHeight(context)),
      ],
    );
}

class GroupChat extends StatelessWidget {
  GroupChat({super.key});
  final List<Map<String, String>> groups = [
    {
      'name': 'QA dev',
      'message': 'Let’s start the meeting',
      'time': '5 mins ago',
      'image': 'assets/chat/profile.jpg',
    },
    {
      'name': 'Office',
      'message': 'Shared the document',
      'time': '10 mins ago',
      'image': 'assets/chat/profile.jpg',
    },
    {
      'name': 'Team',
      'message': 'Got it',
      'time': '15 mins ago',
      'image': 'assets/chat/profile.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) => BlocBuilder<ChatBloc, ChatState>(
    builder: (context, state) => Column(
      children: [
        CustomSearchField(
          hintText: 'search_member',
          onChanged: (value) => {
            context.read<ChatBloc>().add(SearchEvent(value, groups)),
            context.read<ChatBloc>().add(SearchEvent(value)),
            log(state.toString(), name: "state"),
          },
        ),
        SizedBox(height: 0.025 * Responsive.getHeight(context)),
        
        Expanded(
          child: ListView.separated(
            itemCount: state is SearchQueryState
                ? state.filteredList.length
                : groups.length,
            itemBuilder: (context, index) {
              final member = state is SearchQueryState
                  ? state.filteredList[index]
                  : groups[index];
              return ChatListCard(
                name: member['name']!,
                lastMessage: member['message']!,
                timeAgo: member['time']!,
                profileImagePath: member['image']!,
                onTap: () => {context.pushNamed('group-info')},
              );
            },
            separatorBuilder: (context, index) =>
                SizedBox(height: 0.015 * Responsive.getHeight(context)),
          ),
        ),
        // Expanded(
        //   child: ListView.separated(
        //     itemCount: state is SearchQueryState
        //         ? state.filteredList.length
        //         : groups.length,
        //     itemBuilder: (context, index) {
        //       final member = state is SearchQueryState
        //           ? state.filteredList[index]
        //           : groups[index];
        //       return ChatListCard(
        //         name: member['name']!,
        //         lastMessage: member['message']!,
        //         timeAgo: member['time']!,
        //         profileImagePath: member['image']!,
        //         onTap: () => {context.pushNamed('group-info')},
        //       );
        //     },
        //     separatorBuilder: (context, index) =>
        //         SizedBox(height: 0.015 * Responsive.getHeight(context)),
        //   ),
        // ),
        SizedBox(height: 0.02 * Responsive.getHeight(context)),
      ],
    ),
  );
}
