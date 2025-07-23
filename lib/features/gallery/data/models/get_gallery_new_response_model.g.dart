// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_gallery_new_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetGalleryNewResponseModel _$GetGalleryNewResponseModelFromJson(
        Map<String, dynamic> json) =>
    GetGalleryNewResponseModel(
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => Image.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$GetGalleryNewResponseModelToJson(
        GetGalleryNewResponseModel instance) =>
    <String, dynamic>{
      'images': instance.images,
      'message': instance.message,
      'status': instance.status,
    };

Image _$ImageFromJson(Map<String, dynamic> json) => Image(
      galleryId: json['gallery_id'] as String?,
      galleryTitle: json['gallery_title'] as String?,
      galleryPhoto: json['gallery_photo'] as String?,
      galleryType: json['gallery_type'] as String?,
      imageSize: json['image_size'] as String?,
      eventId: json['event_id'] as String?,
      galleryGroupId: json['gallery_group_id'] as String?,
    );

Map<String, dynamic> _$ImageToJson(Image instance) => <String, dynamic>{
      'gallery_id': instance.galleryId,
      'gallery_title': instance.galleryTitle,
      'gallery_photo': instance.galleryPhoto,
      'gallery_type': instance.galleryType,
      'image_size': instance.imageSize,
      'event_id': instance.eventId,
      'gallery_group_id': instance.galleryGroupId,
    };
