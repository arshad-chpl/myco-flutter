// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'uploaded_file_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UploadFileResponse _$UploadFileResponseFromJson(Map<String, dynamic> json) =>
    UploadFileResponse(
      baseUrl: json['base_url'] as String?,
      imgNameArr: (json['img_name_arr'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      message: json['message'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$UploadFileResponseToJson(UploadFileResponse instance) =>
    <String, dynamic>{
      'base_url': instance.baseUrl,
      'img_name_arr': instance.imgNameArr,
      'message': instance.message,
      'status': instance.status,
    };
