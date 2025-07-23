part of 'album_bloc.dart';

sealed class AlbumEvent extends Equatable {
  const AlbumEvent();

  @override
  List<Object> get props => [];
}


// Event to fetch a new gallery album
class GetGalleryNew extends AlbumEvent {
  final String societyId;
  final String userId;
  final String languageId;
  final String floorId;
  final String blockId;
  final String galleryAlbumId;

  const GetGalleryNew({
    required this.societyId,
    required this.userId,
    required this.languageId,
    required this.floorId,
    required this.blockId,
    required this.galleryAlbumId,
  });

  @override
  List<Object> get props => [
    societyId,
    userId,
    languageId,
    floorId,
    blockId,
    galleryAlbumId,
  ];
}
