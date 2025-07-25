import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/language_manager.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/chat/presentation/bloc/chat_list_bloc/chat_bloc.dart';
import 'package:myco_flutter/features/chat/presentation/bloc/group_chat_bloc/bloc/group_chat_bloc.dart';
import 'package:myco_flutter/features/chat/presentation/bloc/member_chat_bloc.dart/bloc/member_chat_bloc.dart';

import 'package:myco_flutter/features/chat/presentation/widgets/chat_list_card.dart';
import 'package:myco_flutter/features/chat/presentation/widgets/select_group_employee.dart';
import 'package:myco_flutter/features/custom_bloc/tab-bar/bloc/tabbar_bloc.dart';
import 'package:myco_flutter/widgets/custom_appbar.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_myco_tabbar.dart';
import 'package:myco_flutter/widgets/custom_searchfield.dart';

class ChatListScreen extends StatefulWidget {
  ChatListScreen({super.key});

  @override
  State<ChatListScreen> createState() => _ChatListScreenState();
}

class _ChatListScreenState extends State<ChatListScreen> {
  List<Widget> screens = [EmployeesChat(), GroupChat()];
  @override
  void initState() {
    super.initState();
    context.read<MemberChatBloc>().add(GetMemberChatListEvent());
     context.read<GroupChatBloc>().add(GetGroupChatListEvent());
  }

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
              builder: (_) => BlocBuilder<ChatListBloc, ChatListState>(
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
                  // if (index == 0) {
                  //   context.read<ChatListBloc>().add(GetChatListEvent());
                  // } else {
                  //   context.read<GroupChatBloc>().add(GetGroupChatListEvent());
                  // }
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

class EmployeesChat extends StatelessWidget {
  const EmployeesChat({super.key});

  @override
  Widget build(BuildContext context) => Column(
    children: [
      BlocBuilder<MemberChatBloc, MemberChatState>(
        builder: (context, state) => CustomSearchField(
          hintText: 'search_member',
          onChanged: (value) => {
            context.read<MemberChatBloc>().add(SearchEventMember(value)),
            log(state.toString(), name: "state"),
          },
        ),
      ),
      SizedBox(height: 0.025 * Responsive.getHeight(context)),
      BlocBuilder<MemberChatBloc, MemberChatState>(
        builder: (context, state) {
          if (state is GetMemberChatListLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is GetMemberChatListErrorState) {
            return Center(child: Text(state.message));
          }

          if (state is GetMemberChatListSuccessState || state is MemberSearchQueryState) {
            final memberList = state is GetMemberChatListSuccessState
                ? state.memberChatList
                : null;

            return Expanded(
              child: ListView.separated(
                itemCount: state is MemberSearchQueryState
                    ? state.filteredListMember.length
                    : memberList?.member.length ?? 0,
                itemBuilder: (context, index) {
                  final member = state is MemberSearchQueryState
                      ? state.filteredListMember[index]
                      : memberList?.member[index];
                  return ChatListCard(
                    name: member?.userFullName ?? "",
                    lastMessage: member?.msgData ?? "",
                    timeAgo: member?.msgDate.toString() ?? "",
                    profileImagePath: member?.userProfilePic ?? "",
                  );
                },
                separatorBuilder: (context, index) =>
                    SizedBox(height: 30 * Responsive.getResponsive(context)),
              ),
            );
          }
          return Center(child: Text('No Data Found'));
        },
      ),
      SizedBox(height: 0.02 * Responsive.getHeight(context)),
    ],
  );
}

class GroupChat extends StatelessWidget {
  const GroupChat({super.key});

  @override
  Widget build(BuildContext context) => Column(
    children: [
      BlocBuilder<GroupChatBloc, GroupChatState>(
        builder: (context, state) => CustomSearchField(
          hintText: 'search_member',
          onChanged: (value) => {
            context.read<GroupChatBloc>().add(SearchEventGroup(value)),
            log(state.toString(), name: "state"),
          },
        ),
      ),
      SizedBox(height: 0.025 * Responsive.getHeight(context)),
      BlocBuilder<GroupChatBloc, GroupChatState>(
        builder: (context, state) {
          if (state is GetGroupChatListLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is GetGroupChatListErrorState) {
            return Center(child: Text(state.message));
          }

          if (state is GetGroupChatListSuccessState ||
              state is GroupSearchQueryState) {
            final groupChatList = state is GetGroupChatListSuccessState
                ? state.groupChatList
                : null;

            return Expanded(
              child: ListView.separated(
                itemCount: state is GroupSearchQueryState
                    ? state.filteredListGroup.length
                    : groupChatList?.member?.length ?? 0,
                itemBuilder: (context, index) {
                  final member = state is GroupSearchQueryState
                      ? state.filteredListGroup[index]
                      : groupChatList?.member?[index];
                  return ChatListCard(
                    name: member?.topicName ?? "",
                    lastMessage: member?.msgData ?? "",
                    timeAgo: member?.createdDate ?? "",
                    profileImagePath:
                        member?.userProfilePic ??
                        "https://avatar.iran.liara.run/public/1",
                  );
                },
                separatorBuilder: (context, index) =>
                    SizedBox(height: 30 * Responsive.getResponsive(context)),
              ),
            );
          }
          return Center(child: Text('No Data Found'));
        },
      ),
      SizedBox(height: 0.02 * Responsive.getHeight(context)),
    ],
  );
}
