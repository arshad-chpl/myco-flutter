import 'package:equatable/equatable.dart';

class ViewPendingProfileEntity extends Equatable {
  final String? userProfilePic;
  final String? userFullName;
  final String? userFirstName;
  final String? userLastName;
  final String? countryCode;
  final String? userMobile;
  final String? userEmail;
  final String? blockName;
  final String? floorName;
  final dynamic unitName;
  final String? designation;
  final String? gender;
  final String? userId;
  final String? blockId;
  final String? floorId;
  final String? userStatus;
  final String? message;

  const ViewPendingProfileEntity({
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

  @override
  List<Object?> get props => [
    userProfilePic,
    userFullName,
    userFirstName,
    userLastName,
    countryCode,
    userMobile,
    userEmail,
    blockName,
    floorName,
    unitName,
    designation,
    gender,
    userId,
    blockId,
    floorId,
    userStatus,
    message,
  ];
}
