import 'package:equatable/equatable.dart';

class NoticeBoardResponseEntity extends Equatable {
  final List<NoticeEntity>? notices;
  final String? message;
  final String? status;

  const NoticeBoardResponseEntity({
    this.notices,
    this.message,
    this.status,
  });

  @override
  List<Object?> get props => [notices, message, status];
}

class NoticeEntity extends Equatable {
  final String? noticeBoardId;
  final String? societyId;
  final String? noticeTitle;
  final String? noticeDescription;
  final String? noticeAttachment;
  final String? noticeTime;
  final String? updatedTime;
  final bool? readStatus;

  const NoticeEntity({
    this.noticeBoardId,
    this.societyId,
    this.noticeTitle,
    this.noticeDescription,
    this.noticeAttachment,
    this.noticeTime,
    this.updatedTime,
    this.readStatus,
  });

  @override
  List<Object?> get props => [
    noticeBoardId,
    societyId,
    noticeTitle,
    noticeDescription,
    noticeAttachment,
    noticeTime,
    updatedTime,
    readStatus,
  ];
}
