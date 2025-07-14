import 'package:flutter/material.dart';
import 'package:myco_flutter/core/utils/responsive.dart';

class MyTeamCard extends StatelessWidget {
  const MyTeamCard({super.key});

  @override
  Widget build(BuildContext context) {
    Responsive.init(context);

    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 1.0),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Stack(
        children: [
          for (var i = 0; i < 4; i++)
            Align(
              alignment: Alignment(i * 0.7, 0),
              child: personAvatar(context),
            ),
        ],
      ),
    );
  }

  Widget personAvatar(BuildContext context) => Stack(
    clipBehavior: Clip.none,
    children: [
      Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: 3.32),
          shape: BoxShape.circle,
        ),
        child: CircleAvatar(
          radius: Responsive.scaleHeight(86),
          backgroundImage: NetworkImage(
            'https://plus.unsplash.com/premium_photo-1690407617542-2f210cf20d7e?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cGVyc29ufGVufDB8fDB8fHww',
          ),
        ),
      ),
      statusIndecator(context),
    ],
  );

  Widget statusIndecator(BuildContext context, {bool isActive = false}) =>
      Positioned(
        bottom: -6,
        right: 0,
        left: 0,
        child: Container(
          height: Responsive.getResponsiveOnWidth(context),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isActive
                ? Colors.green
                : Colors.red, // Change color based on status
          ),
        ),
      );
}
