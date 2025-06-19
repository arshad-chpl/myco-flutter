import 'package:myco_flutter/features/splash/domain/entities/app_version.dart';

class AppVersionModel extends AppVersion {
  
    AppVersionModel({
    super.message,
    super.status,
    super.versionId,
    super.versionApp,
    super.languageVersion,
    super.versionName,
    super.versionNameView,
    super.backBanner,
    super.chatVideo,
    super.timelineVideo,
    super.faceSdkKey,
    super.latestVersion,
  });

  factory AppVersionModel.fromJson(Map<String, dynamic> json) =>
      AppVersionModel(
      message: json['message'] as String?,
      status: json['status'] as String?,
      versionId: json['version_id'] as String?,
      versionApp: json['version_app'] as String?,
      languageVersion: json['language_version'] as String?,
      versionName: json['version_name'] as String?,
      versionNameView: json['version_name_view'] as String?,
      backBanner: json['back_banner'] as String?,
      chatVideo: json['chat_video'] as String?,
      timelineVideo: json['timeline_video'] as String?,
      faceSdkKey: json['face_sdk_key'] as String?,
      latestVersion: json['version_code'] as String?,
    );

    Map<String, dynamic> toJson() =>
        <String, dynamic>{
      'message': message,
      'status': status,
      'version_id': versionId,
      'version_app': versionApp,
      'language_version': languageVersion,
      'version_name': versionName,
      'version_name_view': versionNameView,
      'back_banner': backBanner,
      'chat_video': chatVideo,
      'timeline_video': timelineVideo,
      'face_sdk_key': faceSdkKey,
      'version_code': latestVersion,
    };

    AppVersion toEntity() => AppVersion(
      message: message,
      status: status,
      versionId: versionId,
      versionApp: versionApp,
      languageVersion: languageVersion,
      versionName: versionName,
      versionNameView: versionNameView,
      backBanner: backBanner,
      chatVideo: chatVideo,
      timelineVideo: timelineVideo,
      faceSdkKey: faceSdkKey,
      latestVersion: latestVersion,
    );

  factory AppVersionModel.fromEntity(AppVersion entity) => AppVersionModel(
      message: entity.message,
      status: entity.status,
      versionId: entity.versionId,
      versionApp: entity.versionApp,
      languageVersion: entity.languageVersion,
      versionName: entity.versionName,
      versionNameView: entity.versionNameView,
      backBanner: entity.backBanner,
      chatVideo: entity.chatVideo,
      timelineVideo: entity.timelineVideo,
      faceSdkKey: entity.faceSdkKey,
      latestVersion: entity.latestVersion,
    );
}
