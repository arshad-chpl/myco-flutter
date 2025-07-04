part of 'upcoming_celebration_section.dart';

class UpcomingCelebrationCard extends StatelessWidget {
  final String name;
  final String description;
  final String imagePath;
  final String chipLabel;
  final String buttonLabel;
  final VoidCallback onButtonPressed;
  final EdgeInsetsGeometry? cardPadding;
  final double? buttonBorderRadius;
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

  const UpcomingCelebrationCard({
    super.key,
    required this.name,
    required this.description,
    required this.imagePath,
    required this.chipLabel,
    required this.buttonLabel,
    required this.onButtonPressed,
    this.buttonBorderRadius,
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
                      label: CustomText(
                        chipLabel,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        color: AppTheme.getColor(context).onPrimary,
                      ),
                      avatar:
                          chipIcon ??
                          Icon(
                            Icons.card_giftcard,
                            size: 16,
                            color: AppTheme.getColor(context).onPrimary,
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
                              width: 1.5 * getDashboardResponsiveText(context),
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
                        title: CustomText(
                          name,
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          color: AppTheme.getColor(context).primary,
                        ),
                        subtitle: SizedBox(
                          height: 40,
                          child: CustomText(
                            description,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            color: AppTheme.getColor(context).onSurfaceVariant,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 13),
                Divider(
                  height: 8,
                  radius: BorderRadius.circular(4),
                  color: AppTheme.getColor(context).outlineVariant,
                ),
                const SizedBox(height: 12),
                MyCoButton(
                  height: 40 * getDashboardResponsiveText(context),
                  onTap: onButtonPressed,
                  title: buttonLabel,
                  fontWeight: FontWeight.w600,
                  boarderRadius: buttonBorderRadius,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
