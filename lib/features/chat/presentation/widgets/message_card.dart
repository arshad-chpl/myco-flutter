import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/theme/colors.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/widgets/custom_text.dart';

class MessageCard extends StatelessWidget {
  final String title;
  final String message;
  final String timestamp;
  final String? userImageUrl;
  final Color backgroundColor;
  final Color textColor;
  final Color highlightColor;
  final bool isSentByUser;

  const MessageCard({
    super.key,
    required this.title,
    required this.message,
    required this.timestamp,
    this.userImageUrl,
    this.backgroundColor = const Color(0xFF2D5F87),
    this.textColor = Colors.white,
    this.highlightColor = Colors.amber,
    this.isSentByUser = false,
  });

  @override
  Widget build(BuildContext context) {
    Responsive.init(context);

    final radius = 20 * Responsive.getResponsive(context);
    final userColor = AppTheme.getColor(
      context,
    ).secondary; // Optional green for sent

    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 0.013 * Responsive.getHeight(context),
        horizontal: 0.015 * Responsive.getWidth(context),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: isSentByUser
            ? MainAxisAlignment.end
            : MainAxisAlignment.start,
        children: [
          if (!isSentByUser) ...[
            SizedBox(width: 0.06 * Responsive.getWidth(context)),
            CircleAvatar(
              radius: 27 * Responsive.getResponsive(context),
              backgroundImage: userImageUrl != null
                  ? NetworkImage(userImageUrl!)
                  : null,
              backgroundColor: Colors.grey[300],
              child: userImageUrl == null
                  ? Icon(
                      Icons.person,
                      size: Responsive.scaleWidth(20),
                      color: Colors.grey,
                    )
                  : null,
            ),
            SizedBox(width: 0.03 * Responsive.getWidth(context)),
          ],

          // Card
          Expanded(
            child: Container(
              width: .05 * Responsive.getWidth(context),
              decoration: BoxDecoration(
                color: isSentByUser ? userColor : backgroundColor,
                border: Border.all(color: AppTheme.getColor(context).outline),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(radius),
                  bottomLeft: Radius.circular(radius),
                  // bottomRight: Radius.circular(radius),
                ),
                // BorderRadius.only(
                //   // topLeft: Radius.circular(
                //   //     isSentByUser ? radius : 0),
                //   topRight: Radius.circular(
                //       isSentByUser ? 0 : radius),
                //   bottomLeft: Radius.circular(
                //       isSentByUser ? radius : 0),
                //   // bottomRight: Radius.circular(
                //   //     isSentByUser ? 0 : radius),
                // ),
              ),
              padding: EdgeInsets.symmetric(
                vertical: 0.01 * Responsive.getHeight(context),
                horizontal: 0.04 * Responsive.getWidth(context),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    title,
                    fontWeight: FontWeight.w600,
                    fontSize: Responsive.scaleText(14),
                    color: AppTheme.getColor(context).onPrimary,
                  ),
                  SizedBox(height: 0.01 * Responsive.getHeight(context)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: CustomText(
                          message,
                          fontSize: Responsive.scaleText(12),
                          color: AppColors.spanishYellow,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(width: 0.02 * Responsive.getWidth(context)),
                      CustomText(
                        timestamp,
                        fontSize: Responsive.scaleText(10),
                        color: AppTheme.getColor(context).onPrimary,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          if (isSentByUser) ...[
            SizedBox(width: 0.03 * Responsive.getWidth(context)),
            CircleAvatar(
              radius: 27 * Responsive.getResponsive(context),
              backgroundImage: userImageUrl != null
                  ? NetworkImage(userImageUrl!)
                  : null,
              backgroundColor: Colors.grey[300],
              child: userImageUrl == null
                  ? Icon(
                      Icons.person,
                      size: Responsive.scaleWidth(20),
                      color: Colors.grey,
                    )
                  : null,
            ),
            SizedBox(width: 0.06 * Responsive.getWidth(context)),
          ],
        ],
      ),
    );
  }
}