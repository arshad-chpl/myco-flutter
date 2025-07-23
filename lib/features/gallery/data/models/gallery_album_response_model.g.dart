// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gallery_album_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GalleryAlbumResponseModel _$GalleryAlbumResponseModelFromJson(
        Map<String, dynamic> json) =>
    GalleryAlbumResponseModel(
      eventAlbum: (json['event_album'] as List<dynamic>?)
          ?.map((e) => EventAlbum.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$GalleryAlbumResponseModelToJson(
        GalleryAlbumResponseModel instance) =>
    <String, dynamic>{
      'event_album': instance.eventAlbum,
      'message': instance.message,
      'status': instance.status,
    };

EventAlbum _$EventAlbumFromJson(Map<String, dynamic> json) => EventAlbum(
      galleryAlbumId: json['gallery_album_id'] as String?,
      albumTitle: json['album_title'] as String?,
      eventId: json['event_id'] as String?,
      eventDate: json['event_date'] == null
          ? null
          : DateTime.parse(json['event_date'] as String),
      blockId: json['block_id'] as String?,
      floorId: json['floor_id'] as String?,
      uploadDate: json['upload_date'] as String?,
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => Image.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$EventAlbumToJson(EventAlbum instance) =>
    <String, dynamic>{
      'gallery_album_id': instance.galleryAlbumId,
      'album_title': instance.albumTitle,
      'event_id': instance.eventId,
      'event_date': instance.eventDate?.toIso8601String(),
      'block_id': instance.blockId,
      'floor_id': instance.floorId,
      'upload_date': instance.uploadDate,
      'images': instance.images,
    };

Image _$ImageFromJson(Map<String, dynamic> json) => Image(
      galleryId: json['gallery_id'] as String?,
      galleryType: json['gallery_type'] as String?,
      galleryPhoto: json['gallery_photo'] as String?,
    );

Map<String, dynamic> _$ImageToJson(Image instance) => <String, dynamic>{
      'gallery_id': instance.galleryId,
      'gallery_type': instance.galleryType,
      'gallery_photo': instance.galleryPhoto,
    };
