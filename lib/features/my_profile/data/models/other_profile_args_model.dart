import 'package:equatable/equatable.dart';

class OtherProfilePageArgs extends Equatable {
  final String? getProfileMenuDetails;
  final String? societyId;
  final String? userId;
  final String? unitId;
  final String? blockId;
  final String? floorId;
  final String? otherUserBlockId;
  final String? otherUserFloorId;
  final String? myUserId;
  final String? myProfile;

  const OtherProfilePageArgs({
    this.getProfileMenuDetails,
    this.societyId,
    this.userId,
    this.unitId,
    this.blockId,
    this.floorId,
    this.otherUserBlockId,
    this.otherUserFloorId,
    this.myUserId,
    this.myProfile,
  });

  @override
  List<Object?> get props => [
    getProfileMenuDetails,
    societyId,
    userId,
    unitId,
    blockId,
    floorId,
    otherUserBlockId,
    otherUserFloorId,
    myUserId,
    myProfile,
  ];
}
