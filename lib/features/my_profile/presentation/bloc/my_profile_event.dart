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
    this.userId='21',
    this.unitId='21',
    this.blockId='1',
    this.floorId='1',
    this.otherUserBlockId='',
    this.otherUserFloorId='',
    this.myUserId='21',
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

class FetchProfileDataEvent extends MyProfileEvent {
  const FetchProfileDataEvent();

  @override
  List<Object?> get props => [];
}
