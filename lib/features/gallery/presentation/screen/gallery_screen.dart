import 'dart:developer' as dev;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:myco_flutter/core/router/route_paths.dart';
import 'package:myco_flutter/core/services/preference_manager.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/responsive.dart';
import 'package:myco_flutter/features/gallery/presentation/bloc/gallery_bloc.dart';
import 'package:myco_flutter/features/gallery/presentation/widget/album_shimmer.dart';
import 'package:myco_flutter/features/gallery/presentation/widget/album_tile.dart';
import 'package:myco_flutter/widgets/custom_appbar.dart';
import 'package:myco_flutter/widgets/custom_simple_bottom_sheet.dart';
import 'package:myco_flutter/widgets/custom_text.dart';
import 'package:myco_flutter/widgets/custom_text_field_new.dart';

/// GalleryScreen displays a grid of albums.
/// Each album shows an image grid, the album title, and the date.
/// The appearance is responsive to device size.
class GalleryScreen extends StatefulWidget {
  const GalleryScreen({super.key});

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  // Controller for the album selection dropdown
  final albumController = TextEditingController();

  // load gallery albums
  Future<void> _loadGalleryAlbums() async {
    dev.log('Loading gallery albums...');

    final preferenceManager = GetIt.I<PreferenceManager>();
    final userId = await preferenceManager.getUserId();
    final languageId = await preferenceManager.getLanguageId();

    if (mounted) {
      context.read<GalleryBloc>().add(
        FetchGalleryAlbum(
          societyId: '1',
          userId: userId ?? '',
          languageId: languageId ?? '',
          floorId: '151',
          blockId: '30',
          filterYear: '2024',
        ),
      );
    }
  }

  @override
  void initState() {
    _loadGalleryAlbums();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: const CustomAppbar(
      title: 'gallery',
      isKey: true,
      elevation: 0,
      scrolledUnderElevation: 0,
    ),
    body: Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 14.0 * Responsive.getResponsive(context),
      ),
      // albums
      child: Column(
        children: [
          // drop down
          NewTextField(
            hintText: 'Select Album',
            controller: albumController,

            onTap: () async {
              // album list
              final albumList = [
                {'id': '1', 'name': 'Album 1'},
                {'id': '2', 'name': 'Album 2'},
                {'id': '3', 'name': 'Album 3'},
              ];

              // Open the bottom sheet
              final selectedAlbumId = await showCustomSimpleBottomSheet(
                context: context,
                dataList: albumList,
                heading: 'Select Album',
                searchHint: 'Search Albums',
                btnTitle: 'Select',
                selectedId: albumController.text,
              );

              // Find the matching album name if an ID was selected
              if (selectedAlbumId != null) {
                final selectedAlbum = albumList.firstWhere(
                  (album) => album['id'] == selectedAlbumId,
                  orElse: () => {},
                );

                // Update the controller with the name (if found)
                albumController.text = selectedAlbum['name'] ?? '';
                dev.log('Album selected: ${albumController.text}');
              }
            },
          ),
          SizedBox(
            height: 0.02 * Responsive.getHeight(context),
          ), // spacing after dropdown
          // albums grid
          BlocBuilder<GalleryBloc, GalleryState>(
            builder: (context, state) {
              // Loading state
              if (state is GalleryInitial || state is GalleryLoading) {
                return const Expanded(child: AlbumShimmer());
              }

              // Error state
              if (state is GalleryError) {
                dev.log('Error loading gallery albums: ${state.message}');
                return Expanded(
                  child: Center(
                    child: CustomText(
                      state.message,
                      fontWeight: FontWeight.w600,
                      color: AppTheme.getColor(context).error,
                    ),
                  ),
                );
              }

              // loaded state
              if (state is GalleryAlbumLoaded) {
                final albums = state.galleryAlbumEntity.eventAlbum ?? [];

                dev.log(
                  'Gallery albums loaded: ${albums.length}',
                  name: 'GalleryScreen',
                );

                if (albums.isEmpty) {
                  return const Expanded(
                    child: Center(
                      child: CustomText(
                        'No albums found',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  );
                }

                return Expanded(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, // three albums per row
                      crossAxisSpacing: 16 * Responsive.getResponsive(context),
                      mainAxisSpacing: 24 * Responsive.getResponsive(context),
                      childAspectRatio:
                          0.65, // adjust tile shape: width : height
                    ),
                    itemCount: albums.length,
                    itemBuilder: (context, index) {
                      final album = albums[index];

                      final imageUrls =
                          album.images
                              ?.map((image) => image.galleryPhoto)
                              .whereType<String>()
                              .toList() ??
                          [];
                      // Layout for each album: 2x2 image grid (AlbumTile) + title + date
                      return GestureDetector(
                        onTap: () async {
                          // dev.log('Loading gallery new...');

                          // final preferenceManager =
                          //     GetIt.I<PreferenceManager>();
                          // final userId = await preferenceManager.getUserId();
                          // final languageId = await preferenceManager
                          //     .getLanguageId();

                          // if (mounted) {
                          //   // ignore: use_build_context_synchronously
                          //   context.read<GalleryBloc>().add(
                          //     GetGalleryNewAlbum(
                          //       societyId: '1',
                          //       userId: userId ?? '',
                          //       languageId: languageId ?? '',
                          //       floorId: '151',
                          //       blockId: '30',
                          //       galleryAlbumId: album.galleryAlbumId ?? '',
                          //     ),
                          //   );
                          // }

                          context.push(
                            RoutePaths.albumView,
                            extra: album.albumTitle ?? '',
                          );
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // AlbumTile displays a 2x2 grid of album images
                            AlbumTile(imageUrls: imageUrls),

                            // album title
                            Padding(
                              padding: EdgeInsets.symmetric(
                                vertical:
                                    4.0 * Responsive.getResponsive(context),
                              ),
                              child: CustomText(
                                album.albumTitle ?? '',
                                fontSize:
                                    14 * Responsive.getResponsive(context),
                                fontWeight: FontWeight.w600,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),

                            // album date
                            CustomText(
                              album.eventDate?.toLocal().toString().split(
                                    ' ',
                                  )[0] ??
                                  '',
                              fontSize: 12 * Responsive.getResponsive(context),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                );
              }

              return const SizedBox.shrink();
            },
          ),

          SizedBox(height: 0.02 * Responsive.getHeight(context)),
        ],
      ),
    ),
  );

  @override
  void dispose() {
    albumController.dispose();
    super.dispose();
  }
}
