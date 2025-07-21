// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:myco_flutter/core/theme/app_theme.dart';
// import 'package:myco_flutter/core/utils/responsive.dart';
// import 'package:myco_flutter/features/take_order/presentation/widgets/add_order_bottomsheet.dart';
// import 'package:myco_flutter/features/take_order/presentation/widgets/bottomsheet_config.dart';
// import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';
// import 'package:myco_flutter/widgets/custom_text.dart';

// class ChatListCard extends StatelessWidget {
//   const ChatListCard({super.key});

//   @override
//   Widget build(BuildContext context) => Container(
//     decoration: BoxDecoration(
//       color: AppTheme.getColor(context).onPrimary,
//       border: Border.all(color: AppTheme.getColor(context).outline),
//       borderRadius: BorderRadius.circular(
//         12 * Responsive.getResponsive(context),
//       ),
//     ),
//     child: ListTile(
//       onTap: () {
//         context.pushNamed('user-chat');
//       },
//       contentPadding: EdgeInsets.only(
//         left: 12.0 * Responsive.getResponsive(context),
//         right: 12.0 * Responsive.getResponsive(context),
//         top: 6.0 * Responsive.getResponsive(context),
//       ),
//       // isThreeLine: true,
//       leading: CircleAvatar(
//         backgroundColor: AppTheme.getColor(context).secondary,
//         radius: 35 * Responsive.getResponsive(context),
//         backgroundImage: AssetImage('assets/chat/profile.jpg'),
//       ),
//       title: CustomText(
//         'Vedant',
//         fontWeight: FontWeight.w600,
//         fontSize: 18 * Responsive.getResponsiveText(context),
//         color: AppTheme.getColor(context).primary,
//       ),
//       subtitle: 
//           CustomText(
//             'Hii',
//             fontSize: 14 * Responsive.getResponsiveText(context),
//           ),
       
//       trailing: Column(
//         children: [
//           const Spacer(),
//           CustomText(
//             '3 hours ago',
//             fontSize: 12 * Responsive.getResponsiveText(context),
            
//           )
//         ],
//       ),
//     ),
//   );
// }


import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

class ChatListCard extends StatelessWidget {
  final String name;
  final String lastMessage;
  final String timeAgo;
  final String profileImagePath; // You can make it nullable and add `isNetwork` flag if needed
  final VoidCallback? onTap;
  final bool? isSufixIcon;

  const ChatListCard({
    super.key,
    required this.name,
    required this.lastMessage,
    required this.timeAgo,
    required this.profileImagePath,
    this.onTap,
    this.isSufixIcon = false,
  });

  @override
  Widget build(BuildContext context) {
    Responsive.init(context);
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 6 * Responsive.getResponsive(context),
        horizontal: 8 * Responsive.getResponsive(context),
      ),
      decoration: BoxDecoration(
        color: AppTheme.getColor(context).onPrimary,
        border: Border.all(color: AppTheme.getColor(context).outline),
        borderRadius: BorderRadius.circular(
          12 * Responsive.getResponsive(context),
        ),
      ),
      child: ListTile(
        onTap: onTap ??
            () {
              context.pushNamed('user-chat');
            },
        contentPadding: EdgeInsets.only(
          left: 12.0 * Responsive.getResponsive(context),
          right: 12.0 * Responsive.getResponsive(context),
          top: 6.0 * Responsive.getResponsive(context),
        ),
        leading: CircleAvatar(
          backgroundColor: AppTheme.getColor(context).secondary,
          radius: 35 * Responsive.getResponsive(context),
          backgroundImage: AssetImage(profileImagePath),
          // Use NetworkImage(profileImageUrl) if needed
        ),
        title: CustomText(
          name,
          fontWeight: FontWeight.w600,
          fontSize: 16 * Responsive.getResponsiveText(context),
          color: AppTheme.getColor(context).primary,
        ),
        subtitle: CustomText(
          lastMessage,
          fontSize: 14 * Responsive.getResponsiveText(context),
        ),
        trailing: isSufixIcon! == true ? Column(
          children: [
            Icon(Icons.cancel_outlined , color: AppTheme.getColor(context).error,),
            
          ],
        ):Column(
          children: [
            const Spacer(),
            CustomText(
              timeAgo,
              fontSize: 12 * Responsive.getResponsiveText(context),
            )
          ],
        ), 
      ),
    );
  }
}
