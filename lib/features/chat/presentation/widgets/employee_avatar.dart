import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/chat/presentation/bloc/chat_bloc.dart';

class AvatarList extends StatefulWidget {
  const AvatarList({super.key});

  @override
  State<AvatarList> createState() => _AvatarListState();
}

// AvatarList widget to display a list of avatars
class _AvatarListState extends State<AvatarList> {
  List<Map<String, dynamic>> imageUrls = [
    {'id': 'emp123', 'name': 'John Doe', 'image': 'assets/chat/profile.jpg'},
    {'id': 'emp123', 'name': 'John Doe', 'image': 'assets/chat/profile.jpg'},
    {'id': 'emp123', 'name': 'John Doe', 'image': 'assets/chat/profile.jpg'},
    {'id': 'emp123', 'name': 'John Doe', 'image': 'assets/chat/profile.jpg'},
  ];

  @override
  Widget build(BuildContext context) => Container(
    height: 0.09 * Responsive.getHeight(context),
    child: BlocBuilder<ChatBloc, ChatState>(
      builder: (context, state) => ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: state is RemoveAvatarState
                ? state.updateAvtarList.length
                : imageUrls.length,
          separatorBuilder: (_, __) => const SizedBox(width: 8),
          itemBuilder: (context, index) => RemovableAvatar(
            radius: 48 * Responsive.getResponsive(context),
            imageUrl: state is RemoveAvatarState
                ? state.updateAvtarList[index]['image']
                : imageUrls[index]['image'],
            onRemove: () {   
              log('Remove avatar at index $index');
              context.read<ChatBloc>().add(RemoveAvatar(imageUrls, index));
              log('Remove avatar at index ${state is RemoveAvatarState ? state.updateAvtarList : imageUrls[index]['image']}');
            },
          ),
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
