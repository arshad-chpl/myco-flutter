// To parse this JSON data, do
//
//     final viewPendingProfileResponse = viewPendingProfileResponseFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'view_pending_profile_response.g.dart';

ViewPendingProfileResponse viewPendingProfileResponseFromJson(String str) => ViewPendingProfileResponse.fromJson(json.decode(str));

String viewPendingProfileResponseToJson(ViewPendingProfileResponse data) => json.encode(data.toJson());

@JsonSerializable()
class ViewPendingProfileResponse {
  @JsonKey(name: "user_profile_pic")
  String? userProfilePic;
  @JsonKey(name: "user_full_name")
  String? userFullName;
  @JsonKey(name: "user_first_name")
  String? userFirstName;
  @JsonKey(name: "user_last_name")
  String? userLastName;
  @JsonKey(name: "country_code")
  String? countryCode;
  @JsonKey(name: "user_mobile")
  String? userMobile;
  @JsonKey(name: "user_email")
  String? userEmail;
  @JsonKey(name: "block_name")
  String? blockName;
  @JsonKey(name: "floor_name")
  String? floorName;
  @JsonKey(name: "unit_name")
  dynamic unitName;
  @JsonKey(name: "designation")
  String? designation;
  @JsonKey(name: "gender")
  String? gender;
  @JsonKey(name: "user_id")
  String? userId;
  @JsonKey(name: "block_id")
  String? blockId;
  @JsonKey(name: "floor_id")
  String? floorId;
  @JsonKey(name: "user_status")
  String? userStatus;
  @JsonKey(name: "message")
  String? message;

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

  factory ViewPendingProfileResponse.fromJson(Map<String, dynamic> json) => _$ViewPendingProfileResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ViewPendingProfileResponseToJson(this);
}
