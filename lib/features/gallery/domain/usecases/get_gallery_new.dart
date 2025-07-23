import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:myco_flutter/core/error/failure.dart';
import 'package:myco_flutter/features/gallery/data/models/gallery_request.dart';
import 'package:myco_flutter/features/gallery/domain/entities/get_gallery_new_entity.dart';
import 'package:myco_flutter/features/gallery/domain/repositories/gallery_repository.dart';

class GetGalleryNewUseCase {
  final GalleryRepository repository;
  GetGalleryNewUseCase({required this.repository});

  Future<Either<Failure, GetGalleryNewEntity>> call(
    GetGalleryNewParams params,
  ) async {
    // Constructing the request object using the parameters provided
    final request = GalleryRequest(
      tag: params.tag,
      societyId: params.societyId,
      userId: params.userId,
      languageId: params.languageId,
      floorId: params.floorId,
      blockId: params.blockId,
      galleryAlbumId: params.galleryAlbumId,
    );

    // Calling the repository to get the gallery new data
    // It will return either a Failure or a GetGalleryNewEntity
    // If the request fails, it will return a Failure with an error message
    // If the request is successful, it will return a GetGalleryNewEntity
    return await repository.getGalleryNew(request);
  }
}

class GetGalleryNewParams extends Equatable {
  final String tag;
  final String societyId;
  final String userId;
  final String languageId;
  final String floorId;
  final String blockId;
  final String galleryAlbumId;

  const GetGalleryNewParams({
    required this.tag,
    required this.societyId,
    required this.userId,
    required this.languageId,
    required this.floorId,
    required this.blockId,
    required this.galleryAlbumId,
  });

  @override
  List<Object?> get props => [
    tag,
    societyId,
    userId,
    languageId,
    floorId,
    blockId,
    galleryAlbumId,
  ];
}
