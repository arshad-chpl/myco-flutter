import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';

class AnimatedBottomSheet extends StatefulWidget {
  @override
  _AnimatedBottomSheetState createState() => _AnimatedBottomSheetState();
}

class _AnimatedBottomSheetState extends State<AnimatedBottomSheet>
    with TickerProviderStateMixin {
  late AnimationController _expandController;

  late Animation<double> _expandAnimation;

  @override
  void initState() {
    super.initState();

    // Container expand animation
    _expandController = AnimationController(
      duration: Duration(milliseconds: 600),
      vsync: this,
    );

    _expandAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _expandController, curve: Curves.easeIn));

    Future.delayed(Duration(milliseconds: 200), () {
      if (mounted) _expandController.forward();
    });
  }

  @override
  void dispose() {
    _expandController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.8,
        width: double.infinity,
        margin: EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: AppTheme.getColor(context).surface,
          borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AnimatedBuilder(
              animation: _expandAnimation,
              builder: (BuildContext context, Widget? child) {
                return Container(
                  height: 50,
                  width:
                      _expandAnimation.value *
                      MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: AppTheme.getColor(context).secondary,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      'Swipe up for more',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
