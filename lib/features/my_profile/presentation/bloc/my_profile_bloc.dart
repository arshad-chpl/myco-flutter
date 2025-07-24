import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:myco_flutter/features/my_profile/domain/usecases/get_profile_data.dart';
import 'package:myco_flutter/features/my_profile/presentation/bloc/my_profile_event.dart';
import 'package:myco_flutter/features/my_profile/presentation/bloc/my_profile_state.dart';

class MyProfileBloc extends Bloc<MyProfileEvent, MyProfileState> {
  GetProfileData getProfileData;
  MyProfileBloc(this.getProfileData) : super(InitialMyProfileState()) {
    on<GetProfileDataEvent>(fetchProfileData);
  }

  FutureOr<void> fetchProfileData(
      GetProfileDataEvent event,
    Emitter<MyProfileState> emit,
  ) async {
    emit(FetchProfileDataLoadingState());
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
    Map<String, dynamic> dataMap = {
      'getProfileMenuDetails':event.getProfileMenuDetails,
      'society_id': event.societyId, //'1',
      'user_id': event.userId, //'21',
      'unit_id': event.unitId, //'21',
      'block_id': event.blockId, //'1',
      'floor_id': event.floorId, //'1',
      'other_user_block_id': event.otherUserBlockId,//'',
      'other_user_floor_id': event.otherUserFloorId,//'',
      'my_user_id':event.myUserId,//'21',
      'my_profile':event.myProfile,//'1',
    };

    final result = await getProfileData.getProileData(dataMap);

    result.fold(
      (failure) => emit(FetchProfileDataErrorState(failure.message)),
      (profileEntity) => emit(FetchProfileDataSuccessState(profileEntity)),
    );
  }
}
