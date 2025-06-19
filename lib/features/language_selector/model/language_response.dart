import 'package:json_annotation/json_annotation.dart';

part 'language_response.g.dart';

@JsonSerializable()
class LanguageResponse {
  @JsonKey(name: 'language')
  final List<Language>? language;

  @JsonKey(name: 'message')
  final String? message;

  @JsonKey(name: 'status')
  final String? status;

  LanguageResponse({
    this.language,
    this.message,
    this.status,
  });

  factory LanguageResponse.fromJson(Map<String, dynamic> json) =>
      _$LanguageResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LanguageResponseToJson(this);
}

@JsonSerializable()
class Language {
  @JsonKey(name: 'language_id')
  final String? languageId;

  @JsonKey(name: 'language_name')
  final String? languageName;

  @JsonKey(name: 'language_name_1')
  final String? languageName1;

  @JsonKey(name: 'language_file')
  final String? languageFile;

  @JsonKey(name: 'language_icon')
  final String? languageIcon;

  @JsonKey(name: 'continue_btn_name')
  final String? continueBtnName;

  // UI-related (not from JSON)
  @JsonKey(ignore: true)
  bool isClicked;

  @JsonKey(ignore: true)
  String? color;

  Language({
    this.languageId,
    this.languageName,
    this.languageName1,
    this.languageFile,
    this.languageIcon,
    this.continueBtnName,
    this.isClicked = false,
    this.color,
  });

  factory Language.fromJson(Map<String, dynamic> json) =>
      _$LanguageFromJson(json);

  Map<String, dynamic> toJson() => _$LanguageToJson(this);
}