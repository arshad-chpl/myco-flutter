import 'dart:math';

import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/chat/presentation/widgets/chat_list_card.dart';
import 'package:myco_flutter/widgets/custom_appbar.dart';
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
      title: 
            'Chat List',
            
    ),
    body: Padding(padding: EdgeInsets.symmetric(
      horizontal: 0.05 * Responsive.getWidth(context),
      // vertical: 0.01 * Responsive.getHeight(context),
    ), child: Column(
      children: [
       Center(
         child: CircleAvatar(
            radius: Responsive.getWidth(context) * 0.12,
            backgroundImage: const AssetImage('assets/chat/profile.jpg'),
          ),
       ),
       SizedBox(height: 0.012 * Responsive.getHeight(context),),
       CustomText(
         'Chat List',
         fontSize: 20 * Responsive.getResponsiveText(context),
         fontWeight: FontWeight.w700,
       ),
        SizedBox(height: 0.006 * Responsive.getHeight(context),),
        CustomText(
          'You & 22 Others',
          fontSize: 15 * Responsive.getResponsiveText(context),
          fontWeight: FontWeight.w500,
        ),
        SizedBox(height: 0.012 * Responsive.getHeight(context),),
        MyCoTextfield(
        hintText: 'Search',
        hintTextStyle: AppTheme.getTextStyle(
          context,
        ).labelLarge!.copyWith(color: AppColors.textSecondary),
        prefix: const Icon(Icons.search),
        contentPadding: EdgeInsets.only(
          top: 0.012 * Responsive.getHeight(context),
        ),
        boarderRadius: 12 * Responsive.getResponsive(context),
        onChanged: (value) => {},
      ),
      SizedBox( height: 0.012 * Responsive.getHeight(context),),
      Expanded(
        child: ListView.separated(
    itemCount: groupMembers.length,
    itemBuilder: (context, index) {
      final member = groupMembers[index];
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
    )),
    );
}