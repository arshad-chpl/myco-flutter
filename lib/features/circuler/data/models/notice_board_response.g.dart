// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notice_board_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NoticeBoardResponse _$NoticeBoardResponseFromJson(Map<String, dynamic> json) =>
    NoticeBoardResponse(
      notice: (json['notice'] as List<dynamic>?)
          ?.map((e) => NoticeModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$NoticeBoardResponseToJson(
        NoticeBoardResponse instance) =>
    <String, dynamic>{
      'notice': instance.notice,
      'message': instance.message,
      'status': instance.status,
    };

NoticeModel _$NoticeModelFromJson(Map<String, dynamic> json) => NoticeModel(
      noticeBoardId: json['notice_board_id'] as String?,
      societyId: json['society_id'] as String?,
      noticeTitle: json['notice_title'] as String?,
      noticeDescription: json['notice_description'] as String?,
      noticeAttachment: json['notice_attachment'] as String?,
      noticeTime: json['notice_time'] as String?,
      updatedTime: json['updated_time'] as String?,
      readStatus: json['read_status'] as bool?,
    );

Map<String, dynamic> _$NoticeModelToJson(NoticeModel instance) =>
    <String, dynamic>{
      'notice_board_id': instance.noticeBoardId,
      'society_id': instance.societyId,
      'notice_title': instance.noticeTitle,
      'notice_description': instance.noticeDescription,
      'notice_attachment': instance.noticeAttachment,
      'notice_time': instance.noticeTime,
      'updated_time': instance.updatedTime,
      'read_status': instance.readStatus,
    };
