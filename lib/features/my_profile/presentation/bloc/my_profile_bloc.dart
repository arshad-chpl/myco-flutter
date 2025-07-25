import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:myco_flutter/core/services/preference_manager.dart';
import 'package:myco_flutter/features/my_profile/domain/usecases/get_profile_data.dart';
import 'package:myco_flutter/features/my_profile/presentation/bloc/my_profile_event.dart';
import 'package:myco_flutter/features/my_profile/presentation/bloc/my_profile_state.dart';

class MyProfileBloc extends Bloc<MyProfileEvent, MyProfileState> {
  GetProfileData getProfileData;

  MyProfileBloc(this.getProfileData) : super(InitialMyProfileState()) {
    // Handler for your original event
    on<GetProfileDataEvent>(fetchMyProfileData);

    // Add a new handler for the other profile event
    on<GetOtherProfileDataEvent>(fetchOtherProfileData);
  }

  // Your original method
  FutureOr<void> fetchMyProfileData(
      GetProfileDataEvent event,
      Emitter<MyProfileState> emit,
      ) async {
    // ... same logic as before
    emit(FetchProfileDataLoadingState());
    Map<String, dynamic> dataMap = {
      'getProfileMenuDetails': event.getProfileMenuDetails,
      'society_id': event.societyId,
      'user_id': event.userId,
      'unit_id': event.unitId,
      'block_id': event.blockId,
      'floor_id': event.floorId,
      'other_user_block_id': event.otherUserBlockId,
      'other_user_floor_id': event.otherUserFloorId,
      'my_user_id': event.myUserId,
      'my_profile': event.myProfile,
    };
    final result = await getProfileData.getProileData(dataMap);
    result.fold(
          (failure) => emit(FetchProfileDataErrorState(failure.message)),
          (profileEntity) => emit(FetchProfileDataSuccessState(profileEntity)),
    );
  }

  // The new method to handle GetOtherProfileDataEvent
  FutureOr<void> fetchOtherProfileData(
      GetOtherProfileDataEvent event, // Note the different event type here
      Emitter<MyProfileState> emit,
      ) async {
    emit(FetchProfileDataLoadingState());
    // The logic is identical, just using the new event object
    Map<String, dynamic> dataMap = {
      'getProfileMenuDetails': event.getProfileMenuDetails,
      'society_id': event.societyId,
      'user_id': event.userId, // This will be the other user's ID
      'unit_id': event.unitId,
      'block_id': event.blockId,
      'floor_id': event.floorId,
      'other_user_block_id': event.otherUserBlockId,
      'other_user_floor_id': event.otherUserFloorId,
      'my_user_id': event.myUserId, // This would be your own ID
      'my_profile': event.myProfile, // This would likely be '0'
    };
    final result = await getProfileData.getProileData(dataMap);
    result.fold(
          (failure) => emit(FetchProfileDataErrorState(failure.message)),
          (profileEntity) => emit(FetchProfileDataSuccessState(profileEntity)),
    );
  }
}