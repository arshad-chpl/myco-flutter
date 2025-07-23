part of 'gallery_bloc.dart';

sealed class GalleryEvent extends Equatable {
  const GalleryEvent();

  @override
  List<Object> get props => [];
}

class FetchGalleryAlbum extends GalleryEvent {
  final String societyId;
  final String userId;
  final String languageId;
  final String floorId;
  final String blockId;
  final String filterYear;

  const FetchGalleryAlbum({
    required this.societyId,
    required this.userId,
    required this.languageId,
    required this.floorId,
    required this.blockId,
    required this.filterYear,
  });

  @override
  List<Object> get props => [
    societyId,
    userId,
    languageId,
    floorId,
    blockId,
    filterYear,
  ];
}

class GetGalleryNewAlbum extends GalleryEvent {
  final String societyId;
  final String userId;
  final String languageId;
  final String floorId;
  final String blockId;
  final String galleryAlbumId;

  const GetGalleryNewAlbum({
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
