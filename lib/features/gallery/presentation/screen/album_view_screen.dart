import 'dart:developer' as dev;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:myco_flutter/constants/app_assets.dart';
import 'package:myco_flutter/core/services/preference_manager.dart';
import 'package:myco_flutter/features/gallery/presentation/bloc/gallery_bloc.dart';
import 'package:myco_flutter/features/gallery/presentation/widget/album_shimmer.dart';
import 'package:myco_flutter/widgets/cached_image_holder.dart';
import 'package:myco_flutter/widgets/custom_appbar.dart';

class AlbumViewScreen extends StatefulWidget {
  final String albumName;
  final String? galleryAlbumId;
  const AlbumViewScreen({
    required this.albumName,
    required this.galleryAlbumId,
    super.key,
  });

  @override
  State<AlbumViewScreen> createState() => _AlbumViewScreenState();
}

class _AlbumViewScreenState extends State<AlbumViewScreen> {
  void _loadAlbumImages() async {
    // Logic to load album images goes here
    // This could involve fetching from a remote server or local database
    dev.log('Loading images for album: ${widget.albumName}');

    final preferenceManager = GetIt.I<PreferenceManager>();
    final userId = await preferenceManager.getUserId();
    final languageId = await preferenceManager.getLanguageId();

    if (mounted) {
      // ignore: use_build_context_synchronously
      context.read<GalleryBloc>().add(
        GetGalleryNewAlbum(
          societyId: '1',
          userId: userId ?? '',
          languageId: languageId ?? '',
          floorId: '151',
          blockId: '30',
          galleryAlbumId: widget.galleryAlbumId ?? '',
        ),
      );
    }
  }

  @override
  void initState() {
    _loadAlbumImages();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: CustomAppbar(
      isKey: false,
      title: widget.albumName,
      elevation: 0,
      scrolledUnderElevation: 0,
    ),
    body: BlocBuilder<GalleryBloc, GalleryState>(
      builder: (context, state) {
        if (state is GalleryInitial || state is GalleryLoading) {
          return const SizedBox.expand(child: AlbumShimmer());
        }
        if (state is GalleryNewLoaded) {
          final images = state.getGalleryNewEntity.images;
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 2,
              mainAxisSpacing: 2,
            ),
            itemCount: images?.length ?? 0,
            itemBuilder: (context, index) {
              final image = images?[index];
              return CachedImage(
                imageUrl: image?.galleryPhoto ?? '',
                errorWidget: Image.asset(AppAssets.myCoLogo),
              );
            },
          );
        }
        return SizedBox.fromSize();
      },
    ),
  );
}
