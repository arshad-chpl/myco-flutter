import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/chat/presentation/widgets/message_card.dart';
import 'package:myco_flutter/widgets/custom_appbar.dart';
import 'package:myco_flutter/widgets/custom_text.dart';
import 'package:myco_flutter/widgets/custom_text_field.dart';

class UserChatScreen extends StatelessWidget {
  final bool? isNewChat;
  const UserChatScreen({super.key, this.isNewChat = false});
  
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
              child: isNewChat! || false // Replace 'true' with your actual condition for empty chat
                  ? Center(
                      child: CustomText(
                        "start a conversation",
                        fontSize: 15 * Responsive.getResponsiveText(context),
                        fontWeight: FontWeight.w500,
                        color: AppTheme.getColor(context).onSurface,
                      ),
                    )
                  : Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 0.06 * Responsive.getWidth(context),
                      ),
                      child: ListView.builder(
                        reverse: true,
                        itemBuilder: (context, index) => const MessageCard(
                          title: 'Vedant',
                          message: 'Open by Mukund Madhav',
                          timestamp: 'May 30 10:30 AM',
                        ),
                        itemCount: 15,
                        shrinkWrap: true,
                      ),
                    ),
            ),
            SizedBox(height: 0.02 * Responsive.getHeight(context)),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 0.06 * Responsive.getWidth(context),
              ),
              child: MyCoTextfield(
                hintText: 'Type Message',
                hintTextStyle: AppTheme.getTextStyle(
                  context,
                ).labelLarge!.copyWith(color: AppColors.textSecondary),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    12 * Responsive.getResponsive(context),
                  ),
                  borderSide: BorderSide(
                    color: AppTheme.getColor(context).outline,
                    width: 1.2,
                  ),
                ),
                contentPadding: EdgeInsets.only(
                  top: 0.012 * Responsive.getHeight(context),
                  left: 0.03 * Responsive.getWidth(context),
                  right: 0.03 * Responsive.getWidth(context),
                  bottom: 0.012 * Responsive.getHeight(context),
                ),
                onClick: () {},
                boarderRadius: 12 * Responsive.getResponsive(context),
                suffix: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      'assets/chat/attachment.png',
                      scale: 30 * Responsive.getResponsive(context),
                    ),
                    SizedBox(width: 0.05 * Responsive.getWidth(context)),
                    Image.asset(
                      'assets/chat/send.png',
                      scale: 30 * Responsive.getResponsive(context),
                    ),
                    SizedBox(width: 0.05 * Responsive.getWidth(context)),
                  ],
                ),
                isSuffixIconOn: true,
                onChanged: (value) => {},
              ),
            ),
          ],
        ),
      ),
    ),
  );
}