import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/idea_box/presentation/bloc/list_idea_bloc.dart';
import 'package:myco_flutter/features/idea_box/presentation/bloc/list_idea_event.dart';
import 'package:myco_flutter/features/idea_box/presentation/bloc/list_idea_state.dart';
import 'package:myco_flutter/features/idea_box/presentation/widgets/common_container.dart';
import 'package:myco_flutter/widgets/custom_dotted_line.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
import 'package:myco_flutter/widgets/custom_myco_tabbar.dart';
import 'package:myco_flutter/widgets/custom_text.dart';
import 'package:myco_flutter/widgets/floating_action_btn.dart';

class ListOfIdeas extends StatelessWidget {
  ListOfIdeas({super.key});

  List<Widget> screens = [MyIdeas(), AllIdeas()];
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      titleSpacing: 0,
      title: const CustomText('List of Ideas', fontWeight: FontWeight.bold),
      centerTitle: false,
      leading: const BackButton(),
    ),
    floatingActionButton: ExpandableFab(
      innericonsize: 30 * Responsive.getResponsive(context),
      imageSize: 50 * Responsive.getResponsive(context),

      openIcon: Icons.add,
      closeIcon: Icons.close,
      actions: [
        ExpandableFabAction(
          label: 'Apply Leave',
          icon: Icons.edit_calendar,
          onTap: () => log('Apply Leave tapped'),
        ),
        ExpandableFabAction(
          label: 'Bulk Leave',
          icon: Icons.group,
          onTap: () => log('Bulk Leave tapped'),
        ),
        ExpandableFabAction(
          label: 'Bulk Leave',
          icon: Icons.group,
          onTap: () => log('Bulk Leave tapped'),
        ),
      ],
    ),

    body: Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 0.08 * Responsive.getWidth(context),
      ),
      child: Column(
        children: [
          BlocBuilder<ListIdeaBloc, ListIdeaState>(
            builder: (context, state) {
              final selectedIndex = state is IdeaTabChangeState
                  ? state.selectedIndex
                  : 0;
              return MyCustomTabBar(
                width: 0.9 * Responsive.getWidth(context),

                tabs: const ['My Ideas', 'All Ideas'],

                selectedBgColors: [
                  AppTheme.getColor(context).primary,
                  selectedIndex == 1
                      ? AppTheme.getColor(context).secondary
                      : AppTheme.getColor(context).primary,
                ],
                unselectedTextStyle: TextStyle(
                  color: AppTheme.getColor(context).primary,
                ),
                unselectedBorderAndTextColor: AppTheme.getColor(
                  context,
                ).primary,
                tabBarBorderColor: selectedIndex == 0
                    ? AppTheme.getColor(context).primary
                    : AppTheme.getColor(context).secondary,
                selectedIndex: selectedIndex,

                onTabChange: (index) {
                  context.read<ListIdeaBloc>().add(
                    IdeaTabChangeEvent(index: index),
                  );
                },
              );
            },
          ),
          SizedBox(height: 0.02 * Responsive.getHeight(context)),
          BlocBuilder<ListIdeaBloc, ListIdeaState>(
            builder: (context, state) {
              final selectedIndex = state is IdeaTabChangeState
                  ? state.selectedIndex
                  : 0;
              return screens[selectedIndex];
            },
          ),
        ],
      ),
    ),
  );
}

// ignore: must_be_immutable
class MyIdeas extends StatelessWidget {
  MyIdeas({super.key});

  List<Map<String, dynamic>> list = [
    {
      'title': 'Ideas 1',
      'text': 'skdnvkjncvsdmc',
      'date': '29 May 2025 06:49 PM',
      'like': '1',
      'comment': '2',
    },
    {
      'title': 'Ideas 2',
      'text': 'skdnvkjncvsdmc',
      'date': '29 May 2025 06:49 PM',
      'like': '1',
      'comment': '2',
    },
  ];
  @override
  Widget build(BuildContext context) => Expanded(
    child: ListView.separated(
      separatorBuilder: (context, index) =>
          SizedBox(height: 0.02 * Responsive.getHeight(context)),
      shrinkWrap: true,
      itemCount: list.length,
      itemBuilder: (context, index) => CommonCard(
        headerColor: AppColors.spanishYellow,
        // headerPadding: EdgeInsets.all(value),
        title: 'New Ideas',
        suffixIcon: Row(
          children: [
            MyCoButton(
              height: 0.025 * Responsive.getHeight(context),
              width: 0.2 * Responsive.getWidth(context),
              boarderRadius: 20 * Responsive.getResponsive(context),
              borderColor: AppTheme.getColor(context).onPrimary,
              onTap: () {},
              title: 'Pending',

              backgroundColor: Colors.transparent,
              textStyle: TextStyle(
                fontSize: 14 * Responsive.getResponsiveText(context),
                color: AppTheme.getColor(context).onPrimary,
              ),
            ),
            SizedBox(width: 0.03 * Responsive.getWidth(context)),
            Icon(
              Icons.delete,
              color: AppTheme.getColor(context).onPrimary,
              size: 22 * Responsive.getResponsive(context),
            ),
          ],
        ),
        bottomWidget: Padding(
          padding: EdgeInsets.only(
            left: 10 * Responsive.getResponsive(context),
            top: 5 * Responsive.getResponsive(context),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              CustomText(
                list[index]['title'],
                color: AppTheme.getColor(context).primary,
                fontWeight: FontWeight.bold,
                fontSize: 15 * Responsive.getResponsiveText(context),
              ),
              SizedBox(height: 0.004 * Responsive.getHeight(context)),
              CustomText(
                list[index]['text'],
                color: AppTheme.getColor(context).outline,
                fontSize: 15 * Responsive.getResponsiveText(context),
                fontWeight: FontWeight.w500,
              ),
              SizedBox(height: 0.005 * Responsive.getHeight(context)),
              CustomText(
                list[index]['date'],
                color: AppTheme.getColor(context).onSurface,
                fontSize: 15 * Responsive.getResponsiveText(context),
                fontWeight: FontWeight.w500,
              ),
              Padding(
                padding: EdgeInsets.only(
                  right: 15 * Responsive.getResponsive(context),
                ),
                child: const DottedLineWidget(bottomPadding: 0),
              ),
              SizedBox(height: 0.01 * Responsive.getHeight(context)),
              Row(
                children: [
                  RowImageText(
                    'assets/ideabox/like.png',
                    list[index]['like'].toString(),
                    context,
                  ),
                  SizedBox(width: 0.04 * Responsive.getWidth(context)),
                  RowImageText(
                    'assets/ideabox/message.png',
                    list[index]['comment'].toString(),
                    context,
                  ),
                  SizedBox(width: 0.33 * Responsive.getWidth(context)),
                  RowImageText(
                    'assets/ideabox/attachment.png',
                    'Attechment',
                    context,
                  ),
                ],
              ),
              SizedBox(height: 0.013 * Responsive.getHeight(context)),
            ],
          ),
        ),
      ),
    ),
  );
}

Widget RowImageText(String imagePath, String text, BuildContext context) => Row(
  children: [
    Image.asset(
      imagePath,
      height: 0.02 * Responsive.getHeight(context),
      width: 0.05 * Responsive.getWidth(context),
    ),
    SizedBox(width: 0.015 * Responsive.getWidth(context)),
    CustomText(
      decoration: text == 'Attechment'
          ? TextDecoration.underline
          : TextDecoration.none,

      text,
      fontSize: 15 * Responsive.getResponsiveText(context),
      color: AppTheme.getColor(context).primary,
    ),
  ],
);

// ignore: must_be_immutable
class AllIdeas extends StatelessWidget {
  AllIdeas({super.key});

  List<Map<String, dynamic>> list = [
    {
      'header': 'Science Fair',
      'subtitle': 'Approved (By User)',
      'title': 'Ideas 1',
      'text1': 'skdnvkjncvsdmc',
      'text2': 'By User25 s(QA)',

      'date': '29 May 2025 06:49 PM',

      'like': '1',
      'comment': '2',
    },
    {
      'header': 'Science Fair',
      'subtitle': 'Approved (By User)',
      'title': 'Ideas 1',
      'text1': 'skdnvkjncvsdmc',
      'text2': 'By User25 s(QA)',

      'date': '29 May 2025 06:49 PM',

      'like': '1',
      'comment': '2',
    },
  ];
  @override
  Widget build(BuildContext context) => ListView.separated(
    separatorBuilder: (context, index) =>
        SizedBox(height: 0.02 * Responsive.getHeight(context)),
    shrinkWrap: true,
    itemCount: list.length,
    itemBuilder: (context, index) => CommonCard(
      headerColor: AppTheme.getColor(context).secondary,
      // headerPadding: EdgeInsets.all(value),
      title: list[index]['header'],
      subTitle: list[index]['subtitle'],

      bottomWidget: Padding(
        padding: EdgeInsets.only(
          left: 10 * Responsive.getResponsive(context),
          top: 5 * Responsive.getResponsive(context),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            CustomText(
              list[index]['title'],
              color: AppTheme.getColor(context).primary,
              fontWeight: FontWeight.bold,
              fontSize: 15 * Responsive.getResponsiveText(context),
            ),
            SizedBox(height: 0.004 * Responsive.getHeight(context)),
            CustomText(
              list[index]['text1'],
              color: AppTheme.getColor(context).outline,
              fontSize: 15 * Responsive.getResponsiveText(context),
              fontWeight: FontWeight.w500,
            ),
            SizedBox(height: 0.004 * Responsive.getHeight(context)),
            CustomText(
              list[index]['text2'],
              color: AppTheme.getColor(context).onSurface,
              fontWeight: FontWeight.w500,
              fontSize: 15 * Responsive.getResponsiveText(context),
            ),
            SizedBox(height: 0.005 * Responsive.getHeight(context)),
            CustomText(
              list[index]['date'],
              color: AppTheme.getColor(context).onSurface,
              fontSize: 15 * Responsive.getResponsiveText(context),
              fontWeight: FontWeight.w500,
            ),
            Padding(
              padding: EdgeInsets.only(
                right: 15 * Responsive.getResponsive(context),
              ),
              child: DottedLineWidget(
                bottomPadding: 0,
                color: AppTheme.getColor(context).onSurface,
              ),
            ),
            SizedBox(height: 0.01 * Responsive.getHeight(context)),
            Row(
              children: [
                RowImageText(
                  'assets/ideabox/like.png',
                  list[index]['like'].toString(),
                  context,
                ),
                SizedBox(width: 0.04 * Responsive.getWidth(context)),
                RowImageText(
                  'assets/ideabox/message.png',
                  list[index]['comment'].toString(),
                  context,
                ),
                SizedBox(width: 0.33 * Responsive.getWidth(context)),
                RowImageText(
                  'assets/ideabox/attachment.png',
                  'Attechment',
                  context,
                ),
              ],
            ),
            SizedBox(height: 0.013 * Responsive.getHeight(context)),
          ],
        ),
      ),
    ),
  );
}
