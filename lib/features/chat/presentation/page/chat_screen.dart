// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/chat/presentation/widgets/message_card.dart';
import 'package:myco_flutter/widgets/custom_appbar.dart';
import 'package:myco_flutter/widgets/custom_text.dart';
import 'package:myco_flutter/widgets/custom_text_field.dart';
import 'package:myco_flutter/widgets/custom_text_field_new.dart';

class UserChatScreen extends StatelessWidget {
  UserChatScreen({super.key});
  // ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) => Scaffold(
    resizeToAvoidBottomInset: true,

    body: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppTheme.getColor(context).primary,
            AppTheme.getColor(context).onPrimary,
            AppTheme.getColor(context).secondary,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            CustomAppbar(
              appBarBackgoundColor: Colors.transparent,
              appBarTitleWidget: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundColor: AppTheme.getColor(context).secondary,
                    radius: 20 * Responsive.getResponsive(context),
                    backgroundImage: const AssetImage(
                      'assets/chat/profile.jpg',
                    ),
                  ),
                  SizedBox(width: 0.02 * Responsive.getWidth(context)),
                  CustomText(
                    'Vedant',
                    fontSize: 20 * Responsive.getResponsiveText(context),
                    fontWeight: FontWeight.w700,
                  ),
                ],
              ),
              titleSpacing: 10,
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.more_vert,
                    color: AppTheme.getColor(context).onSurface,
                  ),
                ),
              ],
            ),
            SizedBox(height: 0.01 * Responsive.getHeight(context)),
            Expanded(
              flex: 14,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 0.06 * Responsive.getWidth(context),
                ),
                child: ListView.builder(
                  reverse: true,
                  // controller: _scrollController,
                  itemBuilder: (context, index) => const MessageCard(
                    title: 'Vedant',
                    message: 'Open by Mukund Madhav',
                    timestamp: 'May 30 10:30 AM',
                    // isSentByUser: true,
                  ),
                  itemCount: 15,
                  shrinkWrap: true,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 0.06 * Responsive.getWidth(context),
              ),
              child: NewTextField(
                hintText: 'Type Message',
                maxLines: 5,
                prefixIconPath: 'assets/add_expense/add-circle.svg',
                // prefix: Row(
                //   children: [
                //     Image.asset(
                //       'assets/chat/attachment.png',
                //       scale: 35 * Responsive.getResponsive(context),
                //     ),
                //     SizedBox(width: 0.05 * Responsive.getWidth(context)),
                //     Image.asset(
                //       'assets/chat/send.png',
                //       scale: 35 * Responsive.getResponsive(context),
                //     ),
                //     SizedBox(width: 0.05 * Responsive.getWidth(context)),
                //   ],
                // ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
