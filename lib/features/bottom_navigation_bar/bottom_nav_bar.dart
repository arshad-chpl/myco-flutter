import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/bottom_navigation_bar/bloc/bottom_navigation_bar_bloc.dart';
import 'package:myco_flutter/features/bottom_navigation_bar/rps_custom_painter.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  List<Widget> screens = [
    const Center(child: CustomText('Screen 1')),
    const Center(child: CustomText('Screen 2')),
    const Center(child: CustomText('Screen 3')),
    const Center(child: CustomText('Screen 4')),
  ];

  @override
  Widget build(BuildContext context) => SafeArea(
    child: BlocBuilder<BottomNavigationBarBloc, BottomNavigationBarState>(
      builder: (context, state) => Scaffold(
        backgroundColor: AppTheme.getColor(context).surface,
        // backgroundColor: Colors.grey,
        body: screens[state.currentIndex],
        extendBody: true,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.read<BottomNavigationBarBloc>().add(ToggleIconEvent());
          },
          backgroundColor: AppTheme.getColor(context).primary,
          shape: const CircleBorder(),
          child: Image.asset(
            state.isMenuSelected
                ? 'visit/images/menu-selected.png'
                : 'visit/images/menu.png',
            height: 0.04 * getHeight(context),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.bottomCenter,
          children: [
            CustomPaint(
              size: Size(double.infinity, 0.09 * getHeight(context)),
              // painter: RPSCustomPainter(),
              painter: BNBCustomPainter(),
            ),
            Row(
              children: [
                navItem(
                  context,
                  index: 0,
                  text: 'Home',
                  isSelected: state.currentIndex == 0,
                  imagePath: 'visit/images/home.png',
                  selectedImagePath: 'visit/images/home-selected.png',
                ),
                navItem(
                  context,
                  index: 1,
                  text: 'Community',
                  isSelected: state.currentIndex == 1,
                  imagePath: 'visit/images/blog.png',
                  selectedImagePath: 'visit/images/blog-selected.png',
                ),
                SizedBox(width: 0.07 * getWidth(context)),
                Padding(
                  padding: EdgeInsets.only(top: 0.04 * getHeight(context)),
                  child: CustomText(
                    'Menu',
                    color: AppTheme.getColor(context).onSurfaceVariant,
                    fontWeight: FontWeight.w700,
                    fontSize: 14 * getResponsiveText(context),
                  ),
                ),
                SizedBox(width: 0.03 * getWidth(context)),
                navItem(
                  context,
                  index: 2,
                  text: 'Chat',
                  isSelected: state.currentIndex == 2,
                  imagePath: 'visit/images/chat.png',
                  selectedImagePath: 'visit/images/chat-selected.png',
                ),
                navItem(
                  context,
                  index: 3,
                  text: 'Profile',
                  isSelected: state.currentIndex == 3,
                  imagePath: 'visit/images/user.png',
                  selectedImagePath: 'visit/images/user-selected.png',
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );

  Widget navItem(
    BuildContext context, {
    required int index,
    required String imagePath,
    required String selectedImagePath,
    required String text,
    required bool isSelected,
  }) => GestureDetector(
    onTap: () {
      context.read<BottomNavigationBarBloc>().add(
        ChangeNavigationIndexEvent(index),
      );
    },
    child: Container(
      margin: EdgeInsets.only(left: 0.06 * getWidth(context)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            isSelected ? selectedImagePath : imagePath,
            height: 0.03 * getHeight(context),
            width: 0.1 * getWidth(context),
          ),
          SizedBox(height: 0.005 * getHeight(context)),
          CustomText(
            text,
            fontWeight: FontWeight.w700,
            fontSize: 14 * getResponsiveText(context),
            color: isSelected
                ? AppTheme.getColor(context).primary
                : AppTheme.getColor(context).onSurfaceVariant,
          ),
        ],
      ),
    ),
  );
}
