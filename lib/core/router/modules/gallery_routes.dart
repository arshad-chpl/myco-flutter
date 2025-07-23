import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:myco_flutter/core/router/route_paths.dart';
import 'package:myco_flutter/features/gallery/presentation/bloc/gallery_bloc.dart';
import 'package:myco_flutter/features/gallery/presentation/screen/album_view_screen.dart';
import 'package:myco_flutter/features/gallery/presentation/screen/gallery_screen.dart';

List<RouteBase> galleryRoutes = [
  ShellRoute(
    builder: (context, state, child) =>
        BlocProvider(create: (_) => GetIt.I<GalleryBloc>(), child: child),
    routes: [
      GoRoute(
        path: RoutePaths.gallery,
        builder: (context, state) => const GalleryScreen(),
        // name: 'gallery',
      ),
      GoRoute(
        path: RoutePaths.albumView,
        builder: (context, state) =>
            AlbumViewScreen(albumName: state.extra as String),
        // name: 'album-view',
      ),
    ],
  ),
];
