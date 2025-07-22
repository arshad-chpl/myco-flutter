import 'package:json_annotation/json_annotation.dart';
import 'package:myco_flutter/features/lost_and_found/domain/entities/lost_and_found_entity.dart';
import 'dart:convert';
part 'lost_and_found_item_model.g.dart';

LostAndFoundModel lostAndFoundModelFromJson(String str) =>
    LostAndFoundModel.fromJson(json.decode(str));

@JsonSerializable()
class LostAndFoundModel {
  @JsonKey(name: "lostfound")
  final List<Lostfound>? lostfound;
  @JsonKey(name: "message")
  final String? message;

  LostAndFoundModel({this.lostfound, this.message});

  factory LostAndFoundModel.fromJson(Map<String, dynamic> json) =>
      _$LostAndFoundModelFromJson(json);
  Map<String, dynamic> toJson() => _$LostAndFoundModelToJson(this);

  // LostFoundEntity toEntity() => LostFoundEntity(
  //
  // );
}

@JsonSerializable()
class Lostfound {
  @JsonKey(name: "lost_found_master_id")
  final String? lostFoundMasterId;
  @JsonKey(name: "user_id")
  final String? userId;
  @JsonKey(name: "lost_found_title")
  final String? lostFoundTitle;
  @JsonKey(name: "lost_found_date")
  final String? lostFoundDate;
  @JsonKey(name: "lost_found_image")
  final String? lostFoundImage;
  @JsonKey(name: "lost_found_type")
  final String? lostFoundType;
  @JsonKey(name: "lost_found_type_int")
  final String? lostFoundTypeInt;

  Lostfound({
    this.lostFoundMasterId,
    this.userId,
    this.lostFoundTitle,
    this.lostFoundDate,
    this.lostFoundImage,
    this.lostFoundType,
    this.lostFoundTypeInt,
  });

  factory Lostfound.fromJson(Map<String, dynamic> json) =>
      _$LostfoundFromJson(json);

  Map<String, dynamic> toJson() => _$LostfoundToJson(this);

  LostFoundEntity toEntity() => LostFoundEntity(
    lostFoundMasterId: lostFoundMasterId,
    userId: userId,
    lostFoundTitle: lostFoundTitle,
    lostFoundDate: lostFoundDate,
    lostFoundImage: lostFoundImage,
    lostFoundType: lostFoundType,
    lostFoundTypeInt: lostFoundTypeInt,
  );
}
