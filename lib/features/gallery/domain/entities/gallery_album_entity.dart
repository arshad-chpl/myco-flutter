import 'package:equatable/equatable.dart';

// This file defines the GalleryAlbumEntity and related entities used in the gallery feature of the application.
class GalleryAlbumEntity extends Equatable {
  final List<EventAlbumEntity>? eventAlbum;
  final String? message;
  final String? status;

  const GalleryAlbumEntity({this.eventAlbum, this.message, this.status});

  @override
  List<Object?> get props => [eventAlbum, message, status];
}

class EventAlbumEntity  extends Equatable {
  final String? galleryAlbumId;
  final String? albumTitle;
  final String? eventId;
  final DateTime? eventDate;
  final String? blockId;
  final String? floorId;
  final String? uploadDate;
  final List<ImageEntity>? images;

 const EventAlbumEntity({
    this.galleryAlbumId,
    this.albumTitle,
    this.eventId,
    this.eventDate,
    this.blockId,
    this.floorId,
    this.uploadDate,
    this.images,
  });

  @override
  List<Object?> get props => [
    galleryAlbumId,
    albumTitle,
    eventId,
    eventDate,
    blockId,
    floorId,
    uploadDate,
    images,
  ];
}

class ImageEntity extends Equatable {
  final String? galleryId;
  final String? galleryType;
  final String? galleryPhoto;

  const ImageEntity({this.galleryId, this.galleryType, this.galleryPhoto});

  @override
  List<Object?> get props => [galleryId, galleryType, galleryPhoto];
}
