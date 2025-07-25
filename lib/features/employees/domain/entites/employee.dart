import 'package:equatable/equatable.dart';

class Employee extends Equatable {
  final String? userId;
  final String? unitId;
  final String? blockId;
  final String? floorId;
  final String? userFirstName;
  final String? userLastName;
  final String? userMobile;
  final String? userFullName;
  final String? shortName;
  final String? societyId;
  final String? designation;
  final String? companyLeaveDate;
  final String? companyLeaveDateView;
  final bool? isFutureDate;
  final bool? userActive;
  final String? userProfilePic;

  const Employee({
    this.userId,
    this.unitId,
    this.blockId,
    this.floorId,
    this.userFirstName,
    this.userLastName,
    this.userMobile,
    this.userFullName,
    this.shortName,
    this.societyId,
    this.designation,
    this.companyLeaveDate,
    this.companyLeaveDateView,
    this.isFutureDate,
    this.userActive,
    this.userProfilePic,
  });

  @override
  List<Object?> get props => [
    userId,
    unitId,
    blockId,
    floorId,
    userFirstName,
    userLastName,
    userMobile,
    userFullName,
    shortName,
    societyId,
    designation,
    companyLeaveDate,
    companyLeaveDateView,
    isFutureDate,
    userActive,
    userProfilePic,
  ];
}
