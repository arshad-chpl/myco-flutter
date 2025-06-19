// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'language_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LanguageResponse _$LanguageResponseFromJson(Map<String, dynamic> json) =>
    LanguageResponse(
      language:
          (json['language'] as List<dynamic>?)
              ?.map((e) => Language.fromJson(e as Map<String, dynamic>))
              .toList(),
      message: json['message'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$LanguageResponseToJson(LanguageResponse instance) =>
    <String, dynamic>{
      'language': instance.language,
      'message': instance.message,
      'status': instance.status,
    };

Language _$LanguageFromJson(Map<String, dynamic> json) => Language(
  languageId: json['language_id'] as String?,
  languageName: json['language_name'] as String?,
  languageName1: json['language_name_1'] as String?,
  languageFile: json['language_file'] as String?,
  languageIcon: json['language_icon'] as String?,
  continueBtnName: json['continue_btn_name'] as String?,
);

Map<String, dynamic> _$LanguageToJson(Language instance) => <String, dynamic>{
  'language_id': instance.languageId,
  'language_name': instance.languageName,
  'language_name_1': instance.languageName1,
  'language_file': instance.languageFile,
  'language_icon': instance.languageIcon,
  'continue_btn_name': instance.continueBtnName,
};
