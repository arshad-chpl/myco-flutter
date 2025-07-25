import 'package:equatable/equatable.dart';

sealed class MyProfileEvent extends Equatable {
  const MyProfileEvent();
  @override
  List<Object?> get props => [];
}

class GetProfileDataEvent extends MyProfileEvent {
  final String? getProfileMenuDetails,
      societyId,
      userId,
      unitId,
      blockId,
      floorId,
      otherUserBlockId,
      otherUserFloorId,
      myUserId,
      myProfile;

  const GetProfileDataEvent({
    this.getProfileMenuDetails = 'getProfileMenuDetails',
    this.societyId="1",
    this.userId='1504',
    this.unitId='0',
    this.blockId='1',
    this.floorId='1',
    this.otherUserBlockId='',
    this.otherUserFloorId='',
    this.myUserId='1504',
    this.myProfile='1',
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
class GetOtherProfileDataEvent extends MyProfileEvent {
  final String? getProfileMenuDetails,
      societyId,
      userId,
      unitId,
      blockId,
      floorId,
      otherUserBlockId,
      otherUserFloorId,
      myUserId,
      myProfile;

  const GetOtherProfileDataEvent({
    this.getProfileMenuDetails = 'getProfileMenuDetails',
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

class FetchProfileDataEvent extends MyProfileEvent {
  const FetchProfileDataEvent();

  @override
  List<Object?> get props => [];
}
