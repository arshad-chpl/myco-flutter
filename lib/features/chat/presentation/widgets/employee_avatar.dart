import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/responsive.dart';

class AvatarList extends StatefulWidget {
  const AvatarList({super.key});

  @override
  State<AvatarList> createState() => _AvatarListState();
}

// AvatarList widget to display a list of avatars
class _AvatarListState extends State<AvatarList> {
  List<String> imageUrls = [
    'assets/chat/profile.jpg',
    'assets/chat/profile.jpg',
    'assets/chat/profile.jpg',
  ];

  @override
  Widget build(BuildContext context) => Container(
    height: 0.09 * Responsive.getHeight(context),
    child: ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: imageUrls.length,
      separatorBuilder: (_, __) => const SizedBox(width: 8),
      itemBuilder: (context, index) => RemovableAvatar(
        radius: 48 * Responsive.getResponsive(context),
        imageUrl: imageUrls[index],
        onRemove: () {
          setState(() {
            imageUrls.removeAt(index);
          });
        },
      ),
    ),
  );
}

class RemovableAvatar extends StatelessWidget {
  final String imageUrl;
  final double radius;
  final VoidCallback onRemove;

  const RemovableAvatar({
    Key? key,
    required this.imageUrl,
    required this.onRemove,
    this.radius = 52,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Stack(
    alignment: Alignment.topRight,
    clipBehavior: Clip.none,
    children: [
      CircleAvatar(
        radius: radius,
        backgroundImage: AssetImage(imageUrl), // For assets, use AssetImage
        backgroundColor: AppTheme.getColor(context).onPrimary,
      ),
      Positioned(
        top: -3 * Responsive.getResponsive(context),
        right: -2 * Responsive.getResponsive(context),
        child: GestureDetector(
          onTap: onRemove,
          child: Container(
            decoration: BoxDecoration(
              // border: Border.all(color: Colors.grey, width: 2),
              color: AppTheme.getColor(context).onPrimary,
              shape: BoxShape.circle,
              boxShadow: [
                // Outer shadow
                BoxShadow(
                  color: AppTheme.getColor(context).outline,
                  blurRadius: 6,
                  offset: const Offset(0, 2),
                ),
                // Inner shadow simulation (fake using another light glow)
                BoxShadow(
                  color: AppTheme.getColor(context).outline,

                  blurRadius: 4,
                  spreadRadius: -2,
                  offset: const Offset(0, 0),
                ),
              ],
            ),
            padding: const EdgeInsets.all(2),
            child: Icon(
              Icons.close,
              size: 16,
              color: AppTheme.getColor(context).primary,
            ),
          ),
        ),
      ),
    ],
  );
}
