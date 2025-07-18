import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';
import 'package:myco_flutter/features/sign_in/domain/entities/view_pending_profile_entity.dart';

part 'view_pending_profile_response.g.dart';

ViewPendingProfileResponse viewPendingProfileResponseFromJson(String str) =>
    ViewPendingProfileResponse.fromJson(json.decode(str));

String viewPendingProfileResponseToJson(ViewPendingProfileResponse data) =>
    json.encode(data.toJson());

@JsonSerializable()
class ViewPendingProfileResponse {
  @JsonKey(name: "user_profile_pic")
  final String? userProfilePic;

  @JsonKey(name: "user_full_name")
  final String? userFullName;

  @JsonKey(name: "user_first_name")
  final String? userFirstName;

  @JsonKey(name: "user_last_name")
  final String? userLastName;

  @JsonKey(name: "country_code")
  final String? countryCode;

  @JsonKey(name: "user_mobile")
  final String? userMobile;

  @JsonKey(name: "user_email")
  final String? userEmail;

  @JsonKey(name: "block_name")
  final String? blockName;

  @JsonKey(name: "floor_name")
  final String? floorName;

  @JsonKey(name: "unit_name")
  final dynamic unitName;

  @JsonKey(name: "designation")
  final String? designation;

  @JsonKey(name: "gender")
  final String? gender;

  @JsonKey(name: "user_id")
  final String? userId;

  @JsonKey(name: "block_id")
  final String? blockId;

  @JsonKey(name: "floor_id")
  final String? floorId;

  @JsonKey(name: "user_status")
  final String? userStatus;

  @JsonKey(name: "message")
  final String? message;

  ViewPendingProfileResponse({
    this.userProfilePic,
    this.userFullName,
    this.userFirstName,
    this.userLastName,
    this.countryCode,
    this.userMobile,
    this.userEmail,
    this.blockName,
    this.floorName,
    this.unitName,
    this.designation,
    this.gender,
    this.userId,
    this.blockId,
    this.floorId,
    this.userStatus,
    this.message,
  });

  factory ViewPendingProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$ViewPendingProfileResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ViewPendingProfileResponseToJson(this);

  ViewPendingProfileEntity toEntity() => ViewPendingProfileEntity(
    userProfilePic: userProfilePic,
    userFullName: userFullName,
    userFirstName: userFirstName,
    userLastName: userLastName,
    countryCode: countryCode,
    userMobile: userMobile,
    userEmail: userEmail,
    blockName: blockName,
    floorName: floorName,
    unitName: unitName,
    designation: designation,
    gender: gender,
    userId: userId,
    blockId: blockId,
    floorId: floorId,
    userStatus: userStatus,
    message: message,
  );
}
