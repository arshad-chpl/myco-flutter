// abstract class AdminViewRepository {
import 'package:dartz/dartz.dart';
import 'package:myco_flutter/core/error/failure.dart';
import 'package:myco_flutter/features/gallery/data/models/gallery_request.dart';
import 'package:myco_flutter/features/gallery/domain/entities/gallery_album_entity.dart';
import 'package:myco_flutter/features/gallery/domain/entities/get_gallery_new_entity.dart';

/// Fetches fresh data from remote and conditionally caches it.
//   Future<Either<Failure, AdminViewResponseEntity>> getAdminView(
//     AdminViewRequest request,
//   );

//   /// Gets data from the local cache.
//   Future<Either<Failure, AdminViewResponseEntity>> getCachedAdminView(
//     String companyId,
//   );
// }

abstract class GalleryRepository {
  /// Fetches a gallery album based on the provided request.
  Future<Either<Failure, GalleryAlbumEntity>> getGalleryAlbum(
    GalleryRequest request,
  );

  // /// Fetches a new gallery based on the provided request.
  Future<Either<Failure, GetGalleryNewEntity>> getGalleryNew(
    GalleryRequest request,
  );
}
