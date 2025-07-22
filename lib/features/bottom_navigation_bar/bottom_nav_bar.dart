import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/bottom_navigation_bar/bloc/bottom_navigation_bar_bloc.dart';
import 'package:myco_flutter/features/bottom_navigation_bar/rps_custom_painter.dart';
import 'package:myco_flutter/features/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'package:myco_flutter/features/dashboard/presentation/pages/dashboard_page.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  // BLoCs for each screen
  // final HomeBloc _homeBloc = HomeBloc();
  // final CommunityBloc _communityBloc = CommunityBloc();
  // final ChatBloc _chatBloc = ChatBloc();
  // final ProfileBloc _profileBloc = ProfileBloc();

  @override
  void dispose() {
    // Dispose of the BLoCs when the widget is removed from the widget tree
    // _homeBloc.close();
    // _communityBloc.close();
    // _chatBloc.close();
    // _profileBloc.close();
    super.dispose();
  }

  // List of screens with their respective BLoC providers
  late final List<Widget> _screens;

  @override
  void initState() {
    super.initState();
    _screens = [
      BlocProvider(
        create: (context) => GetIt.I<DashboardBloc>(),
        child: const DashBoardPage(),
        lazy: false,
      ),
      const Center(child: Text('Screen 2')),
      const Center(child: Text('Screen 3')),
      const Center(child: Text('Screen 4')),
    ];
  }

  @override
  Widget build(
    BuildContext context,
  ) => BlocBuilder<BottomNavigationBarBloc, BottomNavigationBarState>(
    builder: (context, state) => Scaffold(
      backgroundColor: AppTheme.getColor(context).surface,
      body: SafeArea(
        top: true,
        bottom: false,
        child: IndexedStack(index: state.currentIndex, children: _screens),
      ),
      extendBody: true,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<BottomNavigationBarBloc>().add(ToggleIconEvent());
        },
        backgroundColor: AppTheme.getColor(context).primary,
        shape: const CircleBorder(),
        child: Image.asset(
          state.isMenuSelected
              ? 'assets/images/menu-selected.png'
              : 'assets/images/menu.png',
          height: 0.04 * Responsive.getHeight(context),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.bottomCenter,
            children: [
              CustomPaint(
                size: Size(
                  double.infinity,
                  0.09 * Responsive.getHeight(context),
                ),
                painter: BNBCustomPainter(),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: CustomText(
                  'Menu',
                  color: AppTheme.getColor(context).onSurfaceVariant,
                  fontWeight: FontWeight.w700,
                  fontSize: 14 * Responsive.getResponsiveText(context),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                  SizedBox(),
                  // Padding(
                  //   padding: EdgeInsets.only(
                  //     top: 0.04 * Responsive.getHeight(context),
                  //   ),
                  //   child: CustomText(
                  //     'Menu',
                  //     color: AppTheme.getColor(context).onSurfaceVariant,
                  //     fontWeight: FontWeight.w700,
                  //     fontSize: 14 * Responsive.getResponsiveText(context),
                  //   ),
                  // ),
                  // SizedBox(width: 0.03 * Responsive.getWidth(context)),
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
          Container(
            height: MediaQuery.of(context).viewPadding.bottom,
            color: AppTheme.getColor(context).surfaceBright,
          ),
        ],
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
      // margin: EdgeInsets.only(left: 0.06 * Responsive.getWidth(context)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            isSelected ? selectedImagePath : imagePath,
            height: 0.03 * Responsive.getHeight(context),
            width: 0.1 * Responsive.getWidth(context),
          ),
          SizedBox(height: 0.005 * Responsive.getHeight(context)),
          CustomText(
            text,
            fontWeight: FontWeight.w700,
            fontSize: 14 * Responsive.getResponsiveText(context),
            color: isSelected
                ? AppTheme.getColor(context).primary
                : AppTheme.getColor(context).onSurfaceVariant,
          ),
        ],
      ),
    ),
  );
}
