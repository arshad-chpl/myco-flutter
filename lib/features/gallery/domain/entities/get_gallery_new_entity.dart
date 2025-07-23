import 'package:equatable/equatable.dart';

// This class represents the entity for the new gallery feature.
// It contains a list of images, a message, and a status.
// The images are represented by the ImageEntity class, which contains details about each image.
// The GetGalleryNewEntity class is used to encapsulate the response from the remote data source
class GetGalleryNewEntity extends Equatable {
  final List<ImageEntity>? images;
  final String? message;
  final String? status;

  const GetGalleryNewEntity({this.images, this.message, this.status});

  @override
  List<Object?> get props => [images, message, status];
}

class ImageEntity extends Equatable {
  final String? galleryId;
  final String? galleryTitle;
  final String? galleryPhoto;
  final String? galleryType;
  final String? imageSize;
  final String? eventId;
  final String? galleryGroupId;

  const ImageEntity({
    this.galleryId,
    this.galleryTitle,
    this.galleryPhoto,
    this.galleryType,
    this.imageSize,
    this.eventId,
    this.galleryGroupId,
  });

  @override
  List<Object?> get props => [
    galleryId,
    galleryTitle,
    galleryPhoto,
    galleryType,
    imageSize,
    eventId,
    galleryGroupId,
  ];
}
