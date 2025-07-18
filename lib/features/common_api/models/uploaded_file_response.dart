import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';
import 'package:myco_flutter/features/common_api/domain/entities/uploaded_file_response_entity.dart';

part 'uploaded_file_response.g.dart';

UploadFileResponseModel UploadFileResponseModelFromJson(String str) =>
    UploadFileResponseModel.fromJson(json.decode(str));

String UploadFileResponseModelToJson(UploadFileResponseModel data) =>
    json.encode(data.toJson());

@JsonSerializable()
class UploadFileResponseModel {
  @JsonKey(name: "base_url")
  final String? baseUrl;

  @JsonKey(name: "img_name_arr")
  final List<String>? imgNameArr;

  @JsonKey(name: "message")
  final String? message;

  @JsonKey(name: "status")
  final String? status;

  UploadFileResponseModel({
    this.baseUrl,
    this.imgNameArr,
    this.message,
    this.status,
  });

  factory UploadFileResponseModel.fromJson(Map<String, dynamic> json) =>
      _$UploadFileResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$UploadFileResponseModelToJson(this);

  /// Convert to domain entity
  UploadFileResponseEntity toEntity() => UploadFileResponseEntity(
    baseUrl: baseUrl,
    imgNameArr: imgNameArr,
    message: message,
    status: status,
  );
}
