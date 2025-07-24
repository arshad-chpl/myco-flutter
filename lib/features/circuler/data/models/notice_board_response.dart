import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:myco_flutter/features/circuler/domain/entity/notice_board_response_entity.dart';

part 'notice_board_response.g.dart';

NoticeBoardResponse noticeBoardResponseFromJson(String str) =>
    NoticeBoardResponse.fromJson(json.decode(str));

String noticeBoardResponseToJson(NoticeBoardResponse data) =>
    json.encode(data.toJson());

@JsonSerializable()
class NoticeBoardResponse {
  @JsonKey(name: 'notice')
  final List<NoticeModel>? notice;
  @JsonKey(name: 'message')
  final String? message;
  @JsonKey(name: 'status')
  final String? status;

  NoticeBoardResponse({
    this.notice,
    this.message,
    this.status,
  });

  factory NoticeBoardResponse.fromJson(Map<String, dynamic> json) =>
      _$NoticeBoardResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$NoticeBoardResponseToJson(this);

  /// Converts to Entity
  NoticeBoardResponseEntity toEntity() => NoticeBoardResponseEntity(
    notices: notice?.map((n) => n.toEntity()).toList(),
    message: message,
    status: status,
  );
}

@JsonSerializable()
class NoticeModel {
  @JsonKey(name: 'notice_board_id')
  final String? noticeBoardId;
  @JsonKey(name: 'society_id')
  final String? societyId;
  @JsonKey(name: 'notice_title')
  final String? noticeTitle;
  @JsonKey(name: 'notice_description')
  final String? noticeDescription;
  @JsonKey(name: 'notice_attachment')
  final String? noticeAttachment;
  @JsonKey(name: 'notice_time')
  final String? noticeTime;
  @JsonKey(name: 'updated_time')
  final String? updatedTime;
  @JsonKey(name: 'read_status')
  final bool? readStatus;

  NoticeModel({
    this.noticeBoardId,
    this.societyId,
    this.noticeTitle,
    this.noticeDescription,
    this.noticeAttachment,
    this.noticeTime,
    this.updatedTime,
    this.readStatus,
  });

  factory NoticeModel.fromJson(Map<String, dynamic> json) =>
      _$NoticeModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$NoticeModelToJson(this);

  /// Converts to Entity
  NoticeEntity toEntity() => NoticeEntity(
    noticeBoardId: noticeBoardId,
    societyId: societyId,
    noticeTitle: noticeTitle,
    noticeDescription: noticeDescription,
    noticeAttachment: noticeAttachment,
    noticeTime: noticeTime,
    updatedTime: updatedTime,
    readStatus: readStatus,
  );
}
