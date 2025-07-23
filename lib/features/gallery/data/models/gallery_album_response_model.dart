// To parse this JSON data, do
//
//     final galleryAlbumResponseModel = galleryAlbumResponseModelFromJson(jsonString);

import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:myco_flutter/features/gallery/domain/entities/gallery_album_entity.dart';

part 'gallery_album_response_model.g.dart';

GalleryAlbumResponseModel galleryAlbumResponseModelFromJson(String str) =>
    GalleryAlbumResponseModel.fromJson(json.decode(str));

String galleryAlbumResponseModelToJson(GalleryAlbumResponseModel data) =>
    json.encode(data.toJson());

@JsonSerializable()
class GalleryAlbumResponseModel {
  @JsonKey(name: 'event_album')
  List<EventAlbum>? eventAlbum;
  @JsonKey(name: 'message')
  String? message;
  @JsonKey(name: 'status')
  String? status;

  GalleryAlbumResponseModel({this.eventAlbum, this.message, this.status});

  factory GalleryAlbumResponseModel.fromJson(Map<String, dynamic> json) =>
      _$GalleryAlbumResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$GalleryAlbumResponseModelToJson(this);

  /// Converts the data model to a domain entity.
  GalleryAlbumEntity toEntity() => GalleryAlbumEntity(
    eventAlbum: eventAlbum?.map((model) => model.toEntity()).toList(),
    message: message,
    status: status,
  );
}

@JsonSerializable()
class EventAlbum {
  @JsonKey(name: 'gallery_album_id')
  String? galleryAlbumId;
  @JsonKey(name: 'album_title')
  String? albumTitle;
  @JsonKey(name: 'event_id')
  String? eventId;
  @JsonKey(name: 'event_date')
  DateTime? eventDate;
  @JsonKey(name: 'block_id')
  String? blockId;
  @JsonKey(name: 'floor_id')
  String? floorId;
  @JsonKey(name: 'upload_date')
  String? uploadDate;
  @JsonKey(name: 'images')
  List<Image>? images;

  EventAlbum({
    this.galleryAlbumId,
    this.albumTitle,
    this.eventId,
    this.eventDate,
    this.blockId,
    this.floorId,
    this.uploadDate,
    this.images,
  });

  factory EventAlbum.fromJson(Map<String, dynamic> json) =>
      _$EventAlbumFromJson(json);

  Map<String, dynamic> toJson() => _$EventAlbumToJson(this);

  /// Converts the data model to a domain entity.
  EventAlbumEntity toEntity() => EventAlbumEntity(
    galleryAlbumId: galleryAlbumId,
    albumTitle: albumTitle,
    eventId: eventId,
    eventDate: eventDate,
    blockId: blockId,
    floorId: floorId,
    uploadDate: uploadDate,
    images: images?.map((model) => model.toEntity()).toList(),
  );
}

@JsonSerializable()
class Image {
  @JsonKey(name: 'gallery_id')
  String? galleryId;
  @JsonKey(name: 'gallery_type')
  String? galleryType;
  @JsonKey(name: 'gallery_photo')
  String? galleryPhoto;

  Image({this.galleryId, this.galleryType, this.galleryPhoto});

  factory Image.fromJson(Map<String, dynamic> json) => _$ImageFromJson(json);

  Map<String, dynamic> toJson() => _$ImageToJson(this);

  /// Converts the data model to a domain entity.
  ImageEntity toEntity() => ImageEntity(
    galleryId: galleryId,
    galleryType: galleryType,
    galleryPhoto: galleryPhoto,
  );
}
