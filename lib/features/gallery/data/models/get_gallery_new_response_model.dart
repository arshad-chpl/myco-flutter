// To parse this JSON data, do
//
//     final getGalleryNewResponseModel = getGalleryNewResponseModelFromJson(jsonString);

import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:myco_flutter/features/gallery/domain/entities/get_gallery_new_entity.dart';

part 'get_gallery_new_response_model.g.dart';

GetGalleryNewResponseModel getGalleryNewResponseModelFromJson(String str) =>
    GetGalleryNewResponseModel.fromJson(json.decode(str));

String getGalleryNewResponseModelToJson(GetGalleryNewResponseModel data) =>
    json.encode(data.toJson());

@JsonSerializable()
class GetGalleryNewResponseModel {
  @JsonKey(name: 'images')
  List<Image>? images;
  @JsonKey(name: 'message')
  String? message;
  @JsonKey(name: 'status')
  String? status;

  GetGalleryNewResponseModel({this.images, this.message, this.status});

  factory GetGalleryNewResponseModel.fromJson(Map<String, dynamic> json) =>
      _$GetGalleryNewResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetGalleryNewResponseModelToJson(this);

  // to entity
  GetGalleryNewEntity toEntity() => GetGalleryNewEntity(
    images: images?.map((image) => image.toEntity()).toList(),
    message: message,
    status: status,
  );
}

@JsonSerializable()
class Image {
  @JsonKey(name: 'gallery_id')
  String? galleryId;
  @JsonKey(name: 'gallery_title')
  String? galleryTitle;
  @JsonKey(name: 'gallery_photo')
  String? galleryPhoto;
  @JsonKey(name: 'gallery_type')
  String? galleryType;
  @JsonKey(name: 'image_size')
  String? imageSize;
  @JsonKey(name: 'event_id')
  String? eventId;
  @JsonKey(name: 'gallery_group_id')
  String? galleryGroupId;

  Image({
    this.galleryId,
    this.galleryTitle,
    this.galleryPhoto,
    this.galleryType,
    this.imageSize,
    this.eventId,
    this.galleryGroupId,
  });

  factory Image.fromJson(Map<String, dynamic> json) => _$ImageFromJson(json);

  Map<String, dynamic> toJson() => _$ImageToJson(this);

  // to entity
  ImageEntity toEntity() => ImageEntity(
    galleryId: galleryId,
    galleryTitle: galleryTitle,
    galleryPhoto: galleryPhoto,
    galleryType: galleryType,
    imageSize: imageSize,
    eventId: eventId,
    galleryGroupId: galleryGroupId,
  );
}
