// To parse this JSON data, do
//
//     final uploadFileResponse = uploadFileResponseFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'uploaded_file_response.g.dart';

UploadFileResponse uploadFileResponseFromJson(String str) => UploadFileResponse.fromJson(json.decode(str));

String uploadFileResponseToJson(UploadFileResponse data) => json.encode(data.toJson());

@JsonSerializable()
class UploadFileResponse {
  @JsonKey(name: "base_url")
  String? baseUrl;
  @JsonKey(name: "img_name_arr")
  List<String>? imgNameArr;
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "status")
  String? status;

  UploadFileResponse({
    this.baseUrl,
    this.imgNameArr,
    this.message,
    this.status,
  });

  factory UploadFileResponse.fromJson(Map<String, dynamic> json) => _$UploadFileResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UploadFileResponseToJson(this);
}
