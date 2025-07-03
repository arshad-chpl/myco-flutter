import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/widgets/custom_myco_button/custom_myco_button.dart';

class CustomProfileCard extends StatelessWidget {
  final String name;
  final String description;
  final String imagePath;
  final String chipLabel;
  final String buttonLabel;
  final VoidCallback onButtonPressed;
  final EdgeInsetsGeometry? cardPadding;
  final double? borderRadius;
  final double? cardHeight;
  final double? cardWidth;
  final double? imageHeight;
  final double? imageWidth;
  final EdgeInsetsGeometry? contentPadding;
  final EdgeInsetsGeometry? chipPadding;
  final Color? chipBgr;
  final TextStyle? nameTextStyle;
  final TextStyle? descTextStyle;
  final TextStyle? chipTextStyle;
  final Icon? chipIcon;
  final OutlinedBorder? shape;
  final Decoration? decoration;
  final double? imageRadius;
  final double? elevation;

  const CustomProfileCard({
    super.key,
    required this.name,
    required this.description,
    required this.imagePath,
    required this.chipLabel,
    required this.buttonLabel,
    required this.onButtonPressed,
    this.borderRadius,
    this.cardPadding,
    this.cardHeight,
    this.cardWidth,
    this.imageHeight,
    this.imageWidth,
    this.contentPadding,
    this.chipPadding,
    this.chipBgr,
    this.nameTextStyle,
    this.descTextStyle,
    this.chipTextStyle,
    this.chipIcon,
    this.shape,
    this.decoration,
    this.imageRadius,
    this.elevation,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: cardHeight,
      width: cardWidth ?? double.infinity,
      child: Padding(
        padding: cardPadding ?? EdgeInsets.all(13.0),
        child: Card(
          elevation: elevation ?? 0,
          color: AppTheme.getColor(context).surface,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(
              color: AppTheme.getColor(context).outlineVariant,
              width: 1.0,
            ),
          ),
          child: Padding(
            padding:
                contentPadding ??
                EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            child: Column(
              children: [
                Row(
                  children: [
                    Spacer(),
                    Chip(
                      label: Text(
                        chipLabel,
                        style:
                            chipTextStyle ??
                            TextStyle(
                              fontSize: 12,
                              color: AppTheme.getColor(context).secondary,
                            ),
                      ),
                      avatar:
                          chipIcon ??
                          Icon(
                            Icons.card_giftcard,
                            size: 16,
                            color: AppTheme.getColor(context).secondary,
                          ),
                      padding:
                          chipPadding ??
                          EdgeInsets.symmetric(horizontal: 2, vertical: 5),
                      backgroundColor:
                          chipBgr ?? AppTheme.getColor(context).primary,
                      visualDensity: VisualDensity.standard,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      shape:
                          shape ??
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      width: imageHeight ?? 80,
                      height: imageWidth ?? 80,
                      decoration:
                          decoration ??
                          BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: AppTheme.getColor(context).primary,
                              width: 1.5,
                            ),
                          ),
                      child: CircleAvatar(
                        backgroundImage: imagePath.startsWith('http')
                            ? NetworkImage(imagePath)
                            : AssetImage(imagePath) as ImageProvider,
                        radius: imageRadius ?? 40,
                      ),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: ListTile(
                        contentPadding: EdgeInsets.all(0),
                        title: Text(
                          name,
                          style:
                              nameTextStyle ??
                              TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: AppTheme.getColor(context).primary,
                              ),
                        ),
                        subtitle: Text(
                          description,
                          style:
                              descTextStyle ??
                              TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,

                                color: AppTheme.getColor(context).onSurface,
                              ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 13),
                Divider(height: 10, color: Colors.grey.shade400),
                const SizedBox(height: 12),
                MyCoButton(
                  height: 40,
                  onTap: onButtonPressed,
                  title: buttonLabel,
                  boarderRadius: borderRadius,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
