import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/chat/presentation/bloc/chat_bloc.dart';
import 'package:myco_flutter/features/chat/presentation/widgets/chat_list_card.dart';
import 'package:myco_flutter/widgets/custom_appbar.dart';
import 'package:myco_flutter/widgets/custom_searchfield.dart';
import 'package:myco_flutter/widgets/custom_text.dart';
import 'package:myco_flutter/widgets/custom_text_field.dart';

class GroupInfo extends StatelessWidget {
  GroupInfo({super.key});
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
  Widget build(BuildContext context) => Scaffold(
    appBar: const CustomAppbar(
      appBarBackgoundColor: Colors.transparent,
      title: 'Chat List',
    ),
    body: Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 0.05 * Responsive.getWidth(context),
        // vertical: 0.01 * Responsive.getHeight(context),
      ),
      child: BlocBuilder<ChatBloc, ChatState>(
        builder: (context, state) => Column(
            children: [
              Center(
                child: CircleAvatar(
                  radius: Responsive.getWidth(context) * 0.12,
                  backgroundImage: const AssetImage('assets/chat/profile.jpg'),
                ),
              ),
              SizedBox(height: 0.012 * Responsive.getHeight(context)),
              CustomText(
                'Chat List',
                fontSize: 20 * Responsive.getResponsiveText(context),
                fontWeight: FontWeight.w700,
              ),
              SizedBox(height: 0.006 * Responsive.getHeight(context)),
              CustomText(
                'You & 22 Others',
                fontSize: 15 * Responsive.getResponsiveText(context),
                fontWeight: FontWeight.w500,
              ),
              SizedBox(height: 0.012 * Responsive.getHeight(context)),
              CustomSearchField(
                hintText: 'Search',
                onChanged: (value) => {
                  context.read<ChatBloc>().add(
                    SearchEvent(value, groupMembers),
                  ),
                 
                },
              ),
              SizedBox(height: 0.012 * Responsive.getHeight(context)),
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
                      isSufixIcon: true,
                    );
                  },
                  separatorBuilder: (context, index) =>
                      SizedBox(height: 0.015 * Responsive.getHeight(context)),
                ),
              ),
            ],
          ),
      ),
    ),
  );
}
