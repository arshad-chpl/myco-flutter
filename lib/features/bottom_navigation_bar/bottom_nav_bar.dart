import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/bottom_navigation_bar/bloc/bottom_navigation_bar_bloc.dart';
import 'package:myco_flutter/features/bottom_navigation_bar/rps_custom_painter.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  List<Widget> screens = [
    const Center(child: Text('Screen 1')),
    const Center(child: Text('Screen 2')),
    const Center(child: Text('Screen 3')),
    const Center(child: Text('Screen 4')),
  ];

  @override
  Widget build(BuildContext context) => SafeArea(
    child: BlocBuilder<BottomNavigationBarBloc, BottomNavigationBarState>(
      builder: (context, state) => Scaffold(
        backgroundColor: AppColors.bgWhite,
        body: screens[state.currentIndex],
        extendBody: true,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.read<BottomNavigationBarBloc>().add(ToggleIconEvent());
          },
          backgroundColor: AppColors.primary,
          shape: const CircleBorder(),
          child: Image.asset(
            state.isMenuSelected
                ? 'assets/images/menu-selected.png'
                : 'assets/images/menu.png',
            height: 0.04 * getHeight(context),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.bottomCenter,
          children: [
            CustomPaint(
              size: Size(double.infinity, 0.08 * getHeight(context)),
              painter: RPSCustomPainter(),
            ),
            Row(
              children: [
                navItem(
                  context,
                  index: 0,
                  text: 'Home',
                  isSelected: state.currentIndex == 0,
                  imagePath: 'assets/images/home.png',
                  selectedImagePath: 'assets/images/home-selected.png',
                ),
                navItem(
                  context,
                  index: 1,
                  text: 'Community',
                  isSelected: state.currentIndex == 1,
                  imagePath: 'assets/images/blog.png',
                  selectedImagePath: 'assets/images/blog-selected.png',
                ),
                SizedBox(width: 0.07 * getWidth(context)),
                Padding(
                  padding: EdgeInsets.only(top: 0.03 * getHeight(context)),
                  child: Text(
                    'Menu',
                    style: TextStyle(
                      color: AppColors.greyText,
                      fontSize: 14 * getResponsiveText(context),
                    ),
                  ),
                ),
                SizedBox(width: 0.03 * getWidth(context)),
                navItem(
                  context,
                  index: 2,
                  text: 'Chat',
                  isSelected: state.currentIndex == 2,
                  imagePath: 'assets/images/chat.png',
                  selectedImagePath: 'assets/images/chat-selected.png',
                ),
                navItem(
                  context,
                  index: 3,
                  text: 'Profile',
                  isSelected: state.currentIndex == 3,
                  imagePath: 'assets/images/user.png',
                  selectedImagePath: 'assets/images/user-selected.png',
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
            // 'assets/images/chat-selected.png',
            height: 0.03 * getHeight(context),
            width: 0.1 * getWidth(context),
          ),
          SizedBox(height: 0.005 * getHeight(context)),
          Text(
            text,
            style: TextStyle(
              color: isSelected ? AppColors.primary : AppColors.greyText,
              fontSize: 14 * getResponsiveText(context),
            ),
          ),
        ],
      ),
    ),
  );
}

class CustomBottomBar extends StatelessWidget {
  final int currentIndex;
  const CustomBottomBar({required this.currentIndex, super.key});

  @override
  Widget build(BuildContext context) => Stack(
    clipBehavior: Clip.none,
    alignment: Alignment.bottomCenter,
    children: [
      CustomPaint(
        size: Size(double.infinity, 0.08 * getHeight(context)),
        painter: RPSCustomPainter(),
      ),
      Row(
        children: [
          navItem(
            context,
            index: 0,
            text: 'Home',
            isSelected: currentIndex == 0,
            imagePath: 'assets/images/home.png',
            selectedImagePath: 'assets/images/home-selected.png',
          ),
          navItem(
            context,
            index: 1,
            text: 'Community',
            isSelected: currentIndex == 1,
            imagePath: 'assets/images/blog.png',
            selectedImagePath: 'assets/images/blog-selected.png',
          ),
          SizedBox(width: 0.07 * getWidth(context)),
          Padding(
            padding: EdgeInsets.only(top: 0.03 * getHeight(context)),
            child: Text(
              'Menu',
              style: TextStyle(
                color: AppColors.greyText,
                fontSize: 14 * getResponsiveText(context),
              ),
            ),
          ),
          SizedBox(width: 0.03 * getWidth(context)),
          navItem(
            context,
            index: 2,
            text: 'Chat',
            isSelected: currentIndex == 2,
            imagePath: 'assets/images/chat.png',
            selectedImagePath: 'assets/images/chat-selected.png',
          ),
          navItem(
            context,
            index: 3,
            text: 'Profile',
            isSelected: currentIndex == 3,
            imagePath: 'assets/images/user.png',
            selectedImagePath: 'assets/images/user-selected.png',
          ),
        ],
      ),
    ],
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
            // 'assets/images/chat-selected.png',
            height: 0.03 * getHeight(context),
            width: 0.1 * getWidth(context),
          ),
          SizedBox(height: 0.005 * getHeight(context)),
          Text(
            text,
            style: TextStyle(
              color: isSelected ? AppColors.primary : AppColors.greyText,
              fontSize: 14 * getResponsiveText(context),
            ),
          ),
        ],
      ),
    ),
  );
}
